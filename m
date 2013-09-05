From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: i2c: Add LPS001WP to the Trivial
 Devices list
Date: Thu, 05 Sep 2013 12:40:09 +0100
Message-ID: <1378381209.24019.21.camel@hornet>
References: <1378302655-13258-1-git-send-email-lee.jones@linaro.org>
	 <20130904142422.GM18206@e106331-lin.cambridge.arm.com>
	 <20130904151159.GA8980@lee--X1>
	 <20130905113001.GR18206@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130905113001.GR18206-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "sa-z923LK4zBo2bacvFa/9K2g@public.gmane.org" <sa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org" <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-09-05 at 12:30 +0100, Mark Rutland wrote:
> I also note that the device can also be attached to SPI. Do we have a=
ny
> other devices which may be attached to either? Do we handle that, and=
 if
> so, how (do we have the same compatible string for both interfaces?)?

Theoretically you don't need anything to make it work - nodes being a
children of a I2C master will instantiate i2c_clients, offspring of a
SPI master will become spi_devices. Then you register two drivers - I2C
and SPI ones, probably sharing most of the code - both matching the sam=
e
compatible value. The I2C one will be bound only with the I2C nodes, th=
e
same applies to SPI.

I hope :-)

Pawe=C5=82
