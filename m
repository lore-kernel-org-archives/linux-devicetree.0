From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] [v2] power/fsl: add MDIO dt binding for FMan
Date: Mon, 22 Dec 2014 15:25:51 -0600
Message-ID: <1419283551.5581.172.camel@freescale.com>
References: <1415958800-9867-1-git-send-email-shh.xie@gmail.com>
	 <1416966592.15957.172.camel@freescale.com>
	 <DM2PR0301MB08641FB289DBA17AD59FBEA0E26A0@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1418940078.5581.143.camel@freescale.com>
	 <DM2PR0301MB0864AA31CD1A7438F476020FE26B0@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1419030955.5581.154.camel@freescale.com>
	 <DM2PR0301MB086427C10254A0A749CD1326E2560@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <5497D466.9090804@Freescale.com> <1419237176.5581.159.camel@freescale.com>
	 <5497E645.7010500@Freescale.com> <1419241330.5581.162.camel@freescale.com>
	 <5497FBAB.4010206@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5497FBAB.4010206-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: Xie Shaohui-B21989 <Shaohui.Xie-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liberman Igal-B31950 <Igal.Liberman-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-12-22 at 05:08 -0600, Emil Medve wrote:
> Hello Scott,
> 
> 
> On 12/22/2014 03:42 AM, Scott Wood wrote:
> > On Mon, 2014-12-22 at 03:37 -0600, Emil Medve wrote:
> >> Hello Scott,
> >>
> >>
> >> On 12/22/2014 02:32 AM, Scott Wood wrote:
> >>> On Mon, 2014-12-22 at 02:20 -0600, Emil Medve wrote:
> >>>> For the purpose of an example in the binding document, I suggest we just
> >>>> stick with the IEEE standard frequency.
> >>>
> >>> The whole reason for this property existing in the device tree is
> >>> non-standard frequencies.
> >>
> >> While the standard claims 2.5 MHz, most MDIO controllers and PHY devices
> >> support frequencies well beyond the standard. Specifying a lower then
> >> the standard frequency for the benefit of some errata is just one side
> >> of this property
> > 
> > The erratum was (until now) the only claimed reason for it.  If there
> > are other reasons why one would specify a different frequency (in
> > particular, that relate to hardware description), please elaborate.
> 
> From memory, the 1 Gb/s Vitesse PHY(s) we have on some of our DS boards
> support 12.5 MHz. I can dig out more specs for specifics on other PHY(s)
> 
> 2.5 MHz is slow and even more so for high speed interfaces. With both
> polling and interrupts (both MDIO and/or PHY) we've noticed (or blamed)
> in the past some Ethernet performance issues on this very slowness
> 
> As of right now I'm not aware of another way to specify/coordinate the
> MDC speed so setting a default (common denominator) in the DT that is
> different then the IEEE standard seems ok
>
> >>>> We can continue this conversation about errata handling when we submit
> >>>> the code relevant to this binding (and the FMan v3 support)
> >>>
> >>> It affects the binding, so let's discuss it now please.
> >>
> >> I think this specific (unpublished yet) errata has less bearing on the
> >> binding then you might believe. This is mostly about providing a
> >> common/default frequency supported by all the devices on some board
> > 
> > What reason other than an erratum would there be for the standard
> > frequency not being supported?
> 
> This is not about not supporting the standard frequency. This is about
> the default frequency being different then the standard

OK, though rather than talk about defaults I'd phrase it as indicating
that a higher frequency than standard is supported, or that a lower
frequency than standard is required.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
