# Fix Photos

Fix photos with wrong dates/times/timezones.

## Motivation

Lets say you have been on vacation recently. Multiple people took photos with different cameras. But one (or more) of those cameras was not set to the correct timezone. If you sort all the photos by date/time, there will be misplaced photos of course. This repository provides a few little scripts to fix a problem like this.

## Prerequisites

All the scripts are based on the [exiftool](https://exiftool.org/) which can be installed with `sudo apt-get install exiftool` for example.

## Functionality

### `split.sh`

Takes all the files in the folder `raw` an sorts them into `sorted/<Camera Model Name>` where `<Camera Model Name>` is the camera model with which they were taken.

### `correct_timezone.sh "<Camera Model Name>" <op> <offset> <timezone>`

Takes all the photos of a the specified camera model `<Camera Model Name>` and performs the operation `<op>` with offset `<offset>` on the date/time. It also sets the timezone to be `<timezone>`.

#### Examples

```
./correct_timezone.sh "Canon EOS 200D" + 02:00:00 +02:00
```
The time zone of the photos taken by the camera Canon EOS 200D was set to GMT+00:00. But the correct timezone would have been GMT+02:00.

```
./correct_timezone.sh "Canon EOS 200D" + 00:00:00 +02:00
```
The date/time of the camera Canon EOS 200D was set correctly (corresponding to GMT+02:00). But the timezone was not set or set to GMT+00:00. This changes only the timezone option.

### `merge.sh`

Takes all the photos sorted by camera model and merges them back together into the folder `merged`.

### `transform.sh`

Takes all the photos from the folder `merged` and renames them. A photo taken on May 26th 2023 16:55:51 would be placed as `2023/05/26-16_55_51-000.jpg` where the last three zeros get incremented for photos with the exact same date/time.