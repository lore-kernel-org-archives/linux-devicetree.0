From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 4/5] iio: imu: st_lsm6dsx: add support for accel/gyro
 unit of lsm9sd1
Date: Sun, 28 Jul 2019 09:34:14 +0100
Message-ID: <20190728093414.5d3ca94d@archlinux>
References: <20190725053132.9589-1-martin.kepplinger@puri.sm>
        <20190725053132.9589-5-martin.kepplinger@puri.sm>
        <20190727184844.307255a2@archlinux>
        <a2f6d5fe-04c6-f5d8-ad38-56b8fa033295@puri.sm>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a2f6d5fe-04c6-f5d8-ad38-56b8fa033295@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: lorenzo.bianconi83@gmail.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 28 Jul 2019 08:04:51 +0200
Martin Kepplinger <martin.kepplinger@puri.sm> wrote:

> On 27.07.19 19:48, Jonathan Cameron wrote:
> > On Thu, 25 Jul 2019 07:31:31 +0200
> > Martin Kepplinger <martin.kepplinger@puri.sm> wrote:
> >   
> >> The LSM9DS1's accelerometer / gyroscope unit and it's magnetometer (separately
> >> supported in iio/magnetometer/st_magn*) are located on a separate i2c addresses
> >> on the bus.
> >>
> >> For the datasheet, see https://www.st.com/resource/en/datasheet/lsm9ds1.pdf
> >>
> >> Treat it just like the LSM6* devices and, despite it's name, hook it up
> >> to the st_lsm6dsx driver, using it's basic functionality.
> >>
> >> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>  
> > I'm a little confused on this hardware.
> > 
> > How does buffered output work if these are independently clocked?
> > 
> > I took a quick look at the datasheet, and 'suspect' the answer is that
> > it runs at the gyro frequencies if both are enable. Is that right?
> >   
> 
> Thanks for reviewing, Jonathan,
> 
> Correct. It says so in chapter 7.12. But that's a "problem" with all
> these imu devices, not specific to this addition right?
It's not a problem as such, but there is a related difference in this
device to the others supported by this driver.

The other parts seem to allow for independent data rate setting, with
streaming to the buffer that isn't in 'lock step'.  I.e you can get

Ax_1, Ay_1, Az_1, Gx_1, Gy_1, Gz_1, Gx_2, Gy_2, Gz_2, Ax_2, Ay_2, Az_2, Gy_3...

That required us to split them up into two devices and means that, to fuse
data from these two source, userspace has to do the harder job of
aligning the two datasets.

For this device, things are simpler in that you always a 'scan' that goes
across both accelerometer and gyroscope channels.  That allows us to
represent it as a single IIO device with a single buffer.

I'm not seeing any reference in the lsm9ds1 to the pattern registers
that are used to handle difference in frequency for the other
parts by letting us know what is actually present in each data set
in the fifo.

Now, that doesn't meant we can't still handle them separately given
we already do that for other parts.

Anyhow, is my understanding correct?

Jonathan

> 
> Sidenote: I thought about renaming things to "lsm6ds0" here just because
> of the name and because the registers are (almost) the same as for my
> lsm9ds1. But I'm not a fan of blindly doing that without being able to
> test. When the current patchset looks good to you, let's keep it that way.
> 
>                             martin
