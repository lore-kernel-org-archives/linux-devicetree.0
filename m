From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] watchdog: imx2_wdt: add external reset support via
 'ext-reset-output' dt prop
Date: Thu, 17 Dec 2015 07:02:08 -0800
Message-ID: <CAJ+vNU2qHQPSJ1KWp_3f3vAdeuOcF0ooZHmHsdafabZLXJv=Bw@mail.gmail.com>
References: <1446758362-11702-1-git-send-email-akshay.bhat@timesys.com>
	<1446758362-11702-2-git-send-email-akshay.bhat@timesys.com>
	<20151105222325.GA26159@roeck-us.net>
	<CAJ+vNU2fSxRJ7YvxOfNzoEoiKgzv-dHj=+eksKxH48ekHiUw2Q@mail.gmail.com>
	<20151106220249.GA19791@roeck-us.net>
	<565F4244.7090502@timesys.com>
	<CAJ+vNU00Bf97HUqkkW9KqOUzHXh482R9O1gasz6ju3Pn-_5chA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ+vNU00Bf97HUqkkW9KqOUzHXh482R9O1gasz6ju3Pn-_5chA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 2, 2015 at 12:54 PM, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org> wrote:
>
> On Wed, Dec 2, 2015 at 11:11 AM, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> >
> > On 11/06/2015 05:02 PM, Guenter Roeck wrote:
> >>
> >> On Fri, Nov 06, 2015 at 11:53:42AM -0800, Tim Harvey wrote:
> >>>
> >>> On Thu, Nov 5, 2015 at 2:23 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> >>>>
> >>>> On Thu, Nov 05, 2015 at 04:19:21PM -0500, Akshay Bhat wrote:
> >>>>>
> >>>>> From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> >>>>>
> >>>>> The IMX6 watchdog supports assertion of a signal (WDOG_B) which
> >>>>> can be pinmux'd to an external pin. This is typically used for boards
> >>>>> that
> >>>>> have PMIC's in control of the IMX6 power rails. In fact, failure to use
> >>>>> such an external reset on boards with external PMIC's can result in
> >>>>> various
> >>>>> hangs due to the IMX6 not being fully reset [1] as well as the board
> >>>>> failing
> >>>>> to reset because its PMIC has not been reset to provide adequate
> >>>>> voltage for
> >>>>> the CPU when coming out of reset at 800Mhz.
> >>>>>
> >>>>> This uses a new device-tree property 'ext-reset-output' to indicate the
> >>>>> board has such a reset and to cause the watchdog to be configured to
> >>>>> assert
> >>>>> WDOG_B instead of an internal reset both on a watchdog timeout and in
> >>>>> system_restart.
> >>>>>
> >>>>> [1]
> >>>>> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/333689.html
> >>>>>
> >>>>> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>>> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> >>>>> ---
> >>>>>   .../devicetree/bindings/watchdog/fsl-imx-wdt.txt     |  2 ++
> >>>>>   drivers/watchdog/imx2_wdt.c                          | 20
> >>>>> ++++++++++++++++++--
> >>>>>   2 files changed, 20 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
> >>>>> b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
> >>>>> index 8dab6fd..9b89b3a 100644
> >>>>> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
> >>>>> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.txt
> >>>>> @@ -9,6 +9,8 @@ Optional property:
> >>>>
> >>>>
> >>>> properties ?
> >>>>
> >>>>>   - big-endian: If present the watchdog device's registers are
> >>>>> implemented
> >>>>>     in big endian mode, otherwise in native mode(same with CPU), for
> >>>>> more
> >>>>>     detail please see:
> >>>>> Documentation/devicetree/bindings/regmap/regmap.txt.
> >>>>> +- ext-reset-output: If present the watchdog device is configured to
> >>>>> assert its
> >>>>
> >>>>
> >>>> Should that have a vendor prefix ? Also, not sure if "-output"
> >>>> has any real value in the property name. "fsl,external-reset", maybe ?
> >>>
> >>>
> >>> Hi Guenter,
> >>>
> >>> I don't see why a vendor prefix is necessary - its a feature of the
> >>> IMX6 watchdog supported by this driver to be able to trigger an
> >>> internal chip-level reset and/or an external signal that can be hooked
> >>> to additional hardware.
> >>>
> >> Sounded like vendor specific to me, but then I am not a devicetree
> >> maintainer,
> >> so I am not an authority on the subject.
> >
> >
> > Devicetree maintainers,
> >
> > Any thoughts?
> >
> > Tim,
> >
> > After looking at all the other watchdog drivers, it does not appear that
> > there is any other processor which uses a similar feature. Since imx is the
> > only processor that appears to support this feature, it might make sense in
> > making this vendor specific. If in the future it is found more processors
> > support a similar functionality, it can be revisited and moved out from
> > being vendor specific?
> >
>
> I'm certainly no expert on device-tree policy. I understand your
> point, but realize that the driver in question is imx2_wdt.c
> (compatible = "fsl,imx21-wdt"). This is an IP block inside the silicon
> of only Freescale chips, so its not like a future omap chip would be
> using this driver - only fsl devices. So why would it need a 'vendor'
> property any more than its other properties?
>
> Regards,
>
> Tim

Wim,

Does the lack of response mean overwhelming approval?

I haven't heard any valid complaints - what does it take to get this approved?

Regards,

Tim
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
