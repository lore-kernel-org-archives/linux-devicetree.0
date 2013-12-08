From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel-VkQ1JFuSMpfAbQlEx87xDw@public.gmane.org>
Subject: Re: lis302 DT binding for Nokia N900
Date: Sun, 08 Dec 2013 15:00:36 +0100
Message-ID: <52A47B84.8050009@tremplin-utc.net>
References: <20131203122059.GB4653@earth.universe> <52A473D8.7020706@tremplin-utc.net> <20131208134651.GA25587@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131208134651.GA25587-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08-12-13 14:46, Sebastian Reichel wrote:
:
> No, it's connected via I2C. Please note, that the N900's acceleromete=
r
> is already supported, but only when initialized via legacy boardcode.
>
> The problem is, that I can't specify negative values in the device
> tree file (the device tree compiler complains). I couldn't find any
> example of negative numbers in any dts file, so I guess, that
> negative numbers are not supported.
>
:
> I just want to port the existing boardcode to device tree.
> The existing platform data is defined as rx51_lis3lv02d_data in
> arch/arm/mach-omap2/board-rx51-peripherals.c.
Oh! Yes, then the values themselves should be fine.
Indeed, the problem is in the parsing of the DT values.
Currently, lis3lv02d_init_dt() reads values as unsigned int:

u32 val;
if (of_get_property(np, "st,axis-x", &val))
	pdata->axis_x =3D val;

So it's quite unlikely to get negative ;-) Is there a way to read signe=
d=20
ints in DT? If so, I can update the driver.

=C3=89ric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
