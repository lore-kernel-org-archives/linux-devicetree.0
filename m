From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Subject: Re: lis302 DT binding for Nokia N900
Date: Sun, 08 Dec 2013 14:27:52 +0100
Message-ID: <52A473D8.7020706@tremplin-utc.net>
References: <20131203122059.GB4653@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131203122059.GB4653-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03-12-13 13:21, Sebastian Reichel wrote:
> Hi,
>
> The lis302 has already a DT binding described in [0],
> which descibes misc. hardware properties. The problem
> is, that the Nokia N900 needs negative values for some
> of the properties, which seem to be unsupported by DT.
> The following values would be needed for the N900 (taken
> from board code):
>
> st,axis-x =3D <1>;  /* LIS3_DEV_X */
> st,axis-y =3D <-2>; /* LIS3_INV_DEV_Y */
> st,axis-z =3D <-3>; /* LIS3_INV_DEV_Z */
>
> st,min-limit-x =3D <-32>;
> st,min-limit-y =3D <3>;
> st,min-limit-z =3D <3>;
>
> st,max-limit-x =3D <-3>;
> st,max-limit-y =3D <32>;
> st,max-limit-z =3D <32>;
>
> Can you please tell me how to setup the properties correctly?

Hi Sebastian,
The code to support inversion of the axis is there... but apparently=20
only in the I2C code. It seems the SPI code doesn't (yet) use any of=20
these values. Is the accelerometer on the N900 connected via SPI, by=20
chance?

It should be pretty simple to extend the SPI driver to support axis=20
conversion too. It'd basically be a copy-paste of lis3lv02d_i2c_probe()

Concerning {min,max}-limit-*, I only have vague understanding of this=20
information (only used in self test), but it should already be working=20
fine with both I2C and SPI (as it's bus independent). In addition, note=
=20
that it's compared to raw data (i.e., before axis conversion), so you=20
probably don't need to put negative values there.

=C3=89ric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
