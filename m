From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add ddc i2c reference to veyron
Date: Thu, 3 Sep 2015 09:28:09 -0700
Message-ID: <CAD=FV=XB9S7-PtshFjBgUwv3oGoXamsGBnwBBrw00aoBpr6q7A@mail.gmail.com>
References: <1441229148-12095-1-git-send-email-dianders@chromium.org>
	<CAL_JsqLLPCy6OpsP4NNjUA6+UxeTC-zGjGPPU+MLhUqFXSSGJQ@mail.gmail.com>
	<20150903082210.GU21084@n2100.arm.linux.org.uk>
	<CAL_JsqL838-somj-o2QtxRA9bXon5dHijx22v0mVowqyhKgoUQ@mail.gmail.com>
	<20150903151854.GA21084@n2100.arm.linux.org.uk>
	<CAL_JsqLKbW2ur1US1DCAcJeDYzq8f1L3vO9C8TitAqGt9tAusQ@mail.gmail.com>
	<CAD=FV=XdP9T29drocB_WkNKrDif9Qwrdjt2C4=AwQk9rey3yLg@mail.gmail.com>
	<1441296838.3102.12.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441296838.3102.12.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?B?5aea5pm65oOF?= <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lucas,

On Thu, Sep 3, 2015 at 9:13 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> 6. Once you start using the dw_hdmi's i2c block with the currently
>> posted patch against mainline (to do this you not only need the patch
>> but you need to remove the ddc-i2c-bus property, set the pinmux, and
>> disable i2c5) then you'll see a bonafide i2c bus exposed to Linux.  In
>> my case this stole i2c0 away from the builtin SoC I2C bus and caused
>> the SoC I2C bus to fail to probe.  Doh.
>>
> This shouldn't happen. I don't know if the patches landed yet, but I
> know Wolfram (i2c maintainer) had patches to reserve the range of bus
> numbers that are fixed by alias nodes and don't hand out those numbers
> to adapters with a dynamic bus number allocation.
>
>> 7. I was trying to solve #6 by adding an "of_node" to the i2c bus
>> which allowed me to give it a (non-conflicting) bus ID.
>>
> This should not be needed.

Ah.  It's very possible that the issue is due to the fact that I was
testing this on an old kernel (3.14) that's missing that feature.  OK,
if that's fixed then at least the actual bug (making i2c0 fail to
load) is not a problem.  It'd still be nice to be able to assign a bus
number to this bus just to make reading of the logs easier, but it's
not a functionality requirement.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
