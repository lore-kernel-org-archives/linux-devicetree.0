From: "Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [RFC][PATCH 1/3] ARM: dts: vf610: Add Freescale FlexTimer
 Module timer node.
Date: Thu, 17 Apr 2014 08:34:48 +0000
Message-ID: <4d7a62616f2a4b21af2d20b45deef0b6@BY2PR03MB505.namprd03.prod.outlook.com>
References: <1397614787-8300-1-git-send-email-Li.Xiubo@freescale.com>
 <1397614787-8300-2-git-send-email-Li.Xiubo@freescale.com>
 <20140416085953.GC11602@dragon>
 <6934b6e7d11f4eb6a8ec74542820d718@BY2PR03MB505.namprd03.prod.outlook.com>
 <20140417082228.GA22160@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140417082228.GA22160@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <Shawn.Guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Jason.Jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [RFC][PATCH 1/3] ARM: dts: vf610: Add Freescale FlexTimer Module
> timer node.
> 
> On Thu, Apr 17, 2014 at 07:49:31AM +0000, Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> > > > +			ftm0: ftm@40038000 {
> > > > +				compatible = "fsl,vf610-ftm-timer";
> > > > +				reg = <0x40038000 0x2000>;
> > > > +				interrupts = <0 42 IRQ_TYPE_LEVEL_HIGH>;
> > > > +				clock-names = "ftm0", "ftm1",
> > > > +					"ftm0_counter_en", "ftm1_counter_en";
> > > > +				clocks = <&clks VF610_CLK_FTM0>,
> > > > +					<&clks VF610_CLK_FTM1>,
> > > > +					<&clks VF610_CLK_FTM0_EXT_FIX_EN>,
> > > > +					<&clks VF610_CLK_FTM1_EXT_FIX_EN>;
> > > > +				status = "disabled";
> > >
> > > For such completely internal block which has no pins route out on board,
> > > we should probably just not have this "disabled" status line.
> > >
> >
> > Well, from IEEE 1275, there defined a standard 'status' property indicating
> > The operational status of one device. The 'status' property has four
> possible
> > values: 'okay/ok', 'disabled', 'fail' and 'fail-xxx'.
> >
> > If it is absent, that means the status of the device is unknown or okay.
> 
> Yes, missing 'disabled' status equals to a 'okay' status from Linux
> implementation.  Then, the device is always available in device tree,
> and Linux Kconfig option will control whether the driver for the device
> is enabled.
> 
> >
> > If discard the status line here in vf610.dtsi, this device will be enabled
> > as default though 'no pins route out' on the board, and actually there has
> > pins route out on the board, as timer devices here we just not use it, but
> > as PWM devices the pins will be used.
> >
> > How about let the node disabled in vf610.dtsi, and then enable it in vf610-
> twr.dts
> > if it will be used in TWR board... ?
> 
> Okay.  If there is some use cases that have board level configuration
> like pin out, I'm fine with your existing code.
> 

@Shawn,

I'll send the v2 patch series of this.

Thanks very much for your comments.

BRs
Xiubo



> Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
