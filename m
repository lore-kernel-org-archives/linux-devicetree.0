From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2] DT updates for Hummingboard and new Cubox-i
Date: Sun, 19 Jan 2014 19:34:22 -0800
Message-ID: <CAOesGMiych-jeo_eKGgL1qxsYQ=rkb4UQwgGBsG-7+GMbLJWhg@mail.gmail.com>
References: <20140116182211.GX15937@n2100.arm.linux.org.uk>
	<20140119031816.GD16158@S2101-09.ap.freescale.net>
	<20140119185246.GB28056@quad.lixom.net>
	<20140120004434.GV15937@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140120004434.GV15937-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 19, 2014 at 4:44 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Sun, Jan 19, 2014 at 10:52:46AM -0800, Olof Johansson wrote:
>> On Sun, Jan 19, 2014 at 11:18:18AM +0800, Shawn Guo wrote:
>> > On Thu, Jan 16, 2014 at 06:22:12PM +0000, Russell King - ARM Linux wrote:
>> > > Now that the Cubox-i has been released, and I have one, I've been able to
>> > > update things a little.  Out of the following two patches, the first one
>> > > I think is critical to be merged before the microsom support hits
>> > > mainline, since it drops the flexcan support from the microsom level,
>> > > moving it to the Hummingboard level.
>> >
>> > I will be out of town for a few days, and won't be online until next
>> > weekend.  So please send the patch directly to arm-soc folks, so that
>> > they can send it together with imx-dt-3.14 stuff.
>> >
>> > arm-soc folks, please take this as another ping for my imx-dt-3.14 pull
>> > request :)
>>
>> I'm well aware that the DT branch has not been merged, and that's because
>> there has been no consensus from DT maintainers on the massive rework
>> you did as the base of the branch.
>>
>> Given the timing, it's not looking like it will be resolved in time for
>> the 3.14 merge window (which might open today).
>
> Okay, that presumably means that the Hummingboard stuff won't be going in
> through this route, and it sounds like the imx DT stuff will need rework.
>
> Is there any objection if I pushed just the Hummingboard files upstream
> myself?

I'm guessing this is going to mess up Shawn's cleanup patches, but
time has ran out for 3.14 for those so they will need to be respun
anyway, most likely.

We can apply them to arm-soc's dt branch. I think it's better if we
merge them since dts files tend to be one of the conflict-ridden areas
(even if this particular instance isn't). Send the series our way if
you want, or send a branch pull request, your choice.

We're generally somewhat liberal w.r.t. applying brand new dts files
-- just like Greg is liberal with applying new PCI ids in -stable: as
long as they don't break dtbs target compilation there's little reason
to sit on them a whole release if they come in early during the cycle
(pre-rc2 or so).


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
