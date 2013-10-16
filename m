From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/mpc85xx: Update the clock nodes in device
 tree
Date: Wed, 16 Oct 2013 11:46:49 -0500
Message-ID: <1381942009.7979.727.camel@snotra.buserror.net>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B150C312F-RL0Hj/+nBVDYdknt8GnhQq4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian-B29983 <B29983-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Li Yang-Leo-R58472 <r58472-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-10-15 at 21:57 -0500, Tang Yuantian-B29983 wrote:
> > > > > >
> > > > > The device tree makes that quite clear.
> > > >
> > > > You chose to model it that way in the device tree; that doesn't make
> > > > it clear that the hardware works that way or that it's a good way to
> > > > model it.
> > > >
> > > > > Each PLL has several output which MUX node can take from.
> > > >
> > > > Point out where in the hardware documentation it says this.  What I
> > > > see is a PLL that has one output, and a MUX register that can choose
> > > > from multiple PLL and divider options.
> > > >
> > > Take T4240 for example: see section 4.6.5.1 , (Page 141) in T4240RM Rev.
> > D, 09/2012.
> > 
> > That shows the dividers as being somewhere in between the PLL and the MUX.
> > The MUX is where the divider is selected.  There's nothing in the PLL's
> > programming interface that relates to the dividers.  As such it's simpler
> > to model it as being part of the MUX.
> > 
> > -Scott
> > 
> I don't know whether it is simpler, but "modeling divider as being part of the MUX"
> is your guess, right?
> If the "divider" is included in MUX, the MUX would not be called "MUX".

It's still selecting from multiple PLLs.

> I don't know whether "divider" module exists or not. If it exists, it should be part
> of PLL or between PLL and MUX. wherever it was, the device tree binding is appropriate.

The device tree binding is unnecessarily complicated.

> The P3041RM shows exactly each PLL has 2 outputs which definitely have no "divider" at all.

That diagram is a bit weird -- one of the outputs is used as is, and the
other is split into 1/2 and 1/4.  It doesn't really matter though; the
end result is the same.  We're describing the programming interface, not
artwork choices in the manual.

-Scott



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
