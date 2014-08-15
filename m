From: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 4/6] arm64: Add DTS support for FSL's LS2085A SoC
Date: Fri, 15 Aug 2014 15:49:53 +0000
Message-ID: <77e80a2d69ee470a8458a85450a1510c@BY2PR0301MB0743.namprd03.prod.outlook.com>
References: <1408096156-29772-1-git-send-email-bhupesh.sharma@freescale.com>
 <1408096156-29772-5-git-send-email-bhupesh.sharma@freescale.com>
 <20140815102329.GB596@leverpostej>
 <c43739ed82a34f6eb2adbbe240e07c5d@DM2PR03MB317.namprd03.prod.outlook.com>
 <0DC5667C-E45A-4781-9AE6-0C5E1C70F268@codeaurora.org>
 <9c8daab7efa446c884409ae3aaaaa151@BY2PR0301MB0743.namprd03.prod.outlook.com>
 <3537CF6F-9BF9-4905-B051-EB94034FC1C2@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3537CF6F-9BF9-4905-B051-EB94034FC1C2-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Kumar Gala [mailto:galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org]
> Sent: Friday, August 15, 2014 10:44 AM
> To: Yoder Stuart-B08248
> Cc: Basu Arnab-B45036; Mark Rutland; Sharma Bhupesh-B45370; arnd-r2nGTMty4D4@public.gmane.org;
> Catalin Marinas; Will Deacon; grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH 4/6] arm64: Add DTS support for FSL's LS2085A SoC
> 
> 
> On Aug 15, 2014, at 10:41 AM, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> >
> >
> >> -----Original Message-----
> >> From: Kumar Gala [mailto:galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org]
> >> Sent: Friday, August 15, 2014 10:26 AM
> >> To: Basu Arnab-B45036
> >> Cc: Mark Rutland; Sharma Bhupesh-B45370; arnd-r2nGTMty4D4@public.gmane.org; Catalin Marinas;
> >> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Will Deacon; Yoder Stuart-B08248;
> >> grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> Subject: Re: [PATCH 4/6] arm64: Add DTS support for FSL's LS2085A SoC
> >>
> >>
> >> On Aug 15, 2014, at 10:21 AM, arnab.basu-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> >>
> >>>>>
> >>>>> +	cpus {
> >>>>> +		#address-cells = <2>;
> >>>>> +		#size-cells = <0>;
> >>>>> +
> >>>>> +		/* We have 4 clusters having 2 Cortex-A57 cores each */
> >>>>> +		cpu@0 {
> >>>>> +			device_type = "cpu";
> >>>>> +			compatible = "arm,cortex-a57";
> >>>>> +			reg = <0x0 0x0>;
> >>>>> +			enable-method = "spin-table";
> >>>>> +			cpu-release-addr = <0x0 0x8000fff8>;
> >>>>> +		};
> >>>>
> >>>> I would strongly recommend having a unique cpu-release-addr for each CPU.
> >>>>
> >>>
> >>> This is more of a place holder, we intend to patch this address from U-Boot
> >>> and use individual release addresses for each CPU.
> >>
> >> If you are going to patch it in u-boot, than why not just have u-boot add
> the
> >> property and drop it from here.
> >>
> >> If you intend to keep it here, than make <0x0 0x0> and add a comment that
> says
> >> u-boot will fill it out
> >
> > As I said to Mark re: the comment on having different release addresses
> > per CPU, we are just following existing practice from the existing
> > arch/arm64 device trees:
> >   apm-storm.dtsi
> >   foundation-v8.dts
> >   rtsm_ve-aemv8a.dts
> >
> > I think one of the reasons the cpu-release-addr is not 0x0 is that
> > UEFI had(?)/has(?) limited ability to do device tree fix ups.  It's
> > not a problem at all in u-boot, but there is some reason all
> > existing device trees have the same hardcoded address for all
> > CPUs.
> 
> Are you guys planning on supporting UEFI on this platform?

Yes.

> > So we want to do the standard/conventional thing here that will
> > allow are device trees to be used in more than u-boot.
> 
> Well, I think the guys would say the standard thing is to move to PSCI.

Agree.  That is our plan.  But it looks like at this point in
time all the device tree have a common denominator spin table
mechanim that gets updated/overriden if PSCI is supported.

Stuart
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
