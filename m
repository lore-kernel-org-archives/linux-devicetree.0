From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in device
 tree
Date: Fri, 18 Oct 2013 11:31:20 -0500
Message-ID: <1382113880.7979.836.camel@snotra.buserror.net>
References: <1381300704-4238-1-git-send-email-Yuantian.Tang@freescale.com>
	 <20131010100331.GE26954@e106331-lin.cambridge.arm.com>
	 <D07C73A334FF604B95B3CBD2A545D07B150BD137@039-SN2MPN1-013.039d.mgd.msft.net>
	 <20131011092526.GE3910@e106331-lin.cambridge.arm.com>
	 <1381518433.7979.536.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C24BD@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1381788786.7979.643.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C2B08@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1381858855.7979.693.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C312F@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1381942009.7979.727.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C4600@039-SN2MPN1-013.039d.mgd.msft.net>
	 <1382027085.7979.774.camel@snotra.buserror.net>
	 <D07C73A334FF604B95B3CBD2A545D07B150C5CAB@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B150C5CAB-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <B29983-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Yang-Leo-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-10-17 at 21:06 -0500, Tang Yuantian-B29983 wrote:
> > On Wed, 2013-10-16 at 21:08 -0500, Tang Yuantian-B29983 wrote:
> > > > > > That shows the dividers as being somewhere in between the PLL
> > > > > > and the
> > > > MUX.
> > > > > > The MUX is where the divider is selected.  There's nothing in
> > > > > > the PLL's programming interface that relates to the dividers.
> > > > > > As such it's simpler to model it as being part of the MUX.
> > > > > >
> > > > > > -Scott
> > > > > >
> > > > > I don't know whether it is simpler, but "modeling divider as being
> > > > > part
> > > > of the MUX"
> > > > > is your guess, right?
> > > > > If the "divider" is included in MUX, the MUX would not be called
> > "MUX".
> > > >
> > > > It's still selecting from multiple PLLs.
> > > >
> > > > > I don't know whether "divider" module exists or not. If it exists,
> > > > > it should be part of PLL or between PLL and MUX. wherever it was,
> > > > > the
> > > > device tree binding is appropriate.
> > > >
> > > > The device tree binding is unnecessarily complicated.
> > > >
> > > > > The P3041RM shows exactly each PLL has 2 outputs which definitely
> > > > > have
> > > > no "divider" at all.
> > > >
> > > > That diagram is a bit weird -- one of the outputs is used as is, and
> > > > the other is split into 1/2 and 1/4.  It doesn't really matter
> > > > though; the end result is the same.  We're describing the
> > > > programming interface, not artwork choices in the manual.
> > > >
> > > > -Scott
> > > >
> > > If the device tree needs to be modified, could you give me your
> > suggestions?
> > 
> > My suggestion is to have only one output per PLL node.  The MUX node
> > would have one input per PLL.  Dividers would be handled internally to
> > the MUX driver.
> > 
> > -Scott
> > 
> I don't think your suggestion is constructive.

Hmm?

> Your suggestion is on the premise of that the "divider" is part of MUX,
> And I think it should be part of PLL.
> MUX can't CREATE clock which PLL can. So my thought is more reasonable.
> If the device tree documents like what you said, it would have few help for driver.
> The reason is obvious that the driver is still going to deal with the "divider" 
> detail which varies from platform to platform.
> I will document as it was unless you prove your suggestion.

I can't follow this.  My point is that my suggestion better matches the
programming model, and is simpler.

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
