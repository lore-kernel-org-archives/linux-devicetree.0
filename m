From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v1 0/3] iio: afe: rescale: Add INFO_PROCESSED support
Date: Tue, 11 Jun 2019 12:44:17 +0100
Message-ID: <20190611124417.0000137a@huawei.com>
References: <20190611095659.29845-1-mylene.josserand@bootlin.com>
        <36890130-24ed-2200-1e8d-964612fee62d@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <36890130-24ed-2200-1e8d-964612fee62d@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: =?ISO-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>, "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2019 11:02:14 +0000
Peter Rosin <peda@axentia.se> wrote:

> On 2019-06-11 11:56, Mylène Josserand wrote:
> > Hello everyone,
> > 
> > You will find a small series that add the support of processed values
> > for iio-rescale driver.
> > Thanks to that, it is possible to read processed values in sysfs instead
> > of getting only raw and scale values.
> > 
> > Here is an example for a 3v3 voltage reading:
> > # cat /sys/bus/iio/devices/iio\:device1/in_voltage0_scale
> > 3.791015625
> > # cat /sys/bus/iio/devices/iio\:device1/in_voltage0_raw
> > 879
> > # cat /sys/bus/iio/devices/iio\:device1/in_voltage0_input
> > 3332
> > 
> > It is also possible to read directly the processed values using iio-hwmon
> > driver (see example in patch03):
> > 
> > # cat /sys/class/hwmon/hwmon0/in1_input
> > 3328
> > 
> > I seperated my series in 3 patches:
> >    - Patch01: Move the scale conversion into a function to prepare the
> >    support of IIO_CHAN_INFO_PROCESSED.
> >    - Patch02: Add the support of IIO_CHAN_INFO_PROCESSED.
> >    - Patch03: Add an example of the use of hwmon and voltage-divider nodes
> >    in device-tree.
> > 
> > If you have any feedbacks on it, I will be pleased to read them!  
> 
> 
> The last patch about hwmon has nothing to do with this series, and
> should be possible as-is without any code changes. No? AFAICT,
> iio_hwmon calls iio_read_channel_processed, which calls
> iio_convert_raw_to_processed_unlocked in case IIO_CHAN_INFO_PROCESSES
> is not handled by the driver. Is that not working?
> 
> There is also libiio in userspace that provides the scale as a double
> and makes the conversion to a processed value trivial, so the series
> is really mostly about the convenience of having a human directly
> seeing the processed value in sysfs. Right?
> 
> If that is deemed valuable, then I think it should be fixed in a
> central location, and not individually for each and every driver.
> 
> Anyway, not my call, just stating my opinion, but those are the
> reasons for me not adding a processed channel from the very beginning.

I definitely want to fully understand the reasoning behind this proposal.

My gut feeling is that it doesn't make sense a sit ends up with two
interfaces to the same thing in userspace, which we generally want to
avoid.

It's really trivial to do the maths in userspace and often doing it in
kernel is less accurate, or much more complex.

Jonathan
> 
> Cheers,
> Peter
> 
> > Best regards,
> > Mylène
> > 
> > Mylène Josserand (3):
> >   iio: afe: rescale: Move scale conversion to new function
> >   iio: afe: rescale: Add support of CHAN_INFO_PROCESSED
> >   dt-bindings: iio: afe: Add hwmon example
> > 
> >  .../bindings/iio/afe/voltage-divider.txt           | 24 ++++++
> >  drivers/iio/afe/iio-rescale.c                      | 96 ++++++++++++++++------
> >  2 files changed, 96 insertions(+), 24 deletions(-)
> >   
> 
