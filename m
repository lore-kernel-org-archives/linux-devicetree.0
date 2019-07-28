From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH v3 4/5] iio: imu: st_lsm6dsx: add support for accel/gyro
 unit of lsm9sd1
Date: Sun, 28 Jul 2019 08:04:51 +0200
Message-ID: <a2f6d5fe-04c6-f5d8-ad38-56b8fa033295@puri.sm>
References: <20190725053132.9589-1-martin.kepplinger@puri.sm>
 <20190725053132.9589-5-martin.kepplinger@puri.sm>
 <20190727184844.307255a2@archlinux>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190727184844.307255a2@archlinux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: lorenzo.bianconi83@gmail.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27.07.19 19:48, Jonathan Cameron wrote:
> On Thu, 25 Jul 2019 07:31:31 +0200
> Martin Kepplinger <martin.kepplinger@puri.sm> wrote:
> 
>> The LSM9DS1's accelerometer / gyroscope unit and it's magnetometer (separately
>> supported in iio/magnetometer/st_magn*) are located on a separate i2c addresses
>> on the bus.
>>
>> For the datasheet, see https://www.st.com/resource/en/datasheet/lsm9ds1.pdf
>>
>> Treat it just like the LSM6* devices and, despite it's name, hook it up
>> to the st_lsm6dsx driver, using it's basic functionality.
>>
>> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> I'm a little confused on this hardware.
> 
> How does buffered output work if these are independently clocked?
> 
> I took a quick look at the datasheet, and 'suspect' the answer is that
> it runs at the gyro frequencies if both are enable. Is that right?
> 

Thanks for reviewing, Jonathan,

Correct. It says so in chapter 7.12. But that's a "problem" with all
these imu devices, not specific to this addition right?

Sidenote: I thought about renaming things to "lsm6ds0" here just because
of the name and because the registers are (almost) the same as for my
lsm9ds1. But I'm not a fan of blindly doing that without being able to
test. When the current patchset looks good to you, let's keep it that way.

                            martin
