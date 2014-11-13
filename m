From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] DT: add MDIO node for FMan node
Date: Thu, 13 Nov 2014 02:29:07 -0600
Message-ID: <1415867347.15957.60.camel@freescale.com>
References: <1415102196-9238-1-git-send-email-shh.xie@gmail.com>
	 <1415665384.15957.16.camel@freescale.com>
	 <fb6dc6131da04e89bfc31bd8278030a0@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1415727479.15957.29.camel@freescale.com>
	 <c4dd11a97a684be8b799c2f639e600ca@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1415859399.15957.48.camel@freescale.com>
	 <59c6a8b7ad1d477aad9edd2152d02f8e@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1415862913.15957.56.camel@freescale.com>
	 <489ad06fda99436eb3307d613b1f8293@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1415865867.15957.58.camel@freescale.com>
	 <b7e76a785be4439bb1f69dc611703e1d@DM2PR0301MB0864.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b7e76a785be4439bb1f69dc611703e1d-Cwg/PA1lyPnq20u2fDgSrZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xie Shaohui-B21989 <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Medve Emilian-EMMEDVE1 <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-11-13 at 02:27 -0600, Xie Shaohui-B21989 wrote:
> 
> 
> Best Regards, 
> Shaohui Xie
> 
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Thursday, November 13, 2014 4:04 PM
> > To: Xie Shaohui-B21989
> > Cc: Liberman Igal-B31950; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve Emilian-EMMEDVE1
> > Subject: Re: [PATCH] DT: add MDIO node for FMan node
> > 
> > On Thu, 2014-11-13 at 02:02 -0600, Xie Shaohui-B21989 wrote:
> > >
> > >
> > > Best Regards,
> > > Shaohui Xie
> > >
> > >
> > > > -----Original Message-----
> > > > From: Wood Scott-B07421
> > > > Sent: Thursday, November 13, 2014 3:15 PM
> > > > To: Xie Shaohui-B21989
> > > > Cc: Liberman Igal-B31950; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > > > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve Emilian-EMMEDVE1
> > > > Subject: Re: [PATCH] DT: add MDIO node for FMan node
> > > >
> > > > On Thu, 2014-11-13 at 01:11 -0600, Xie Shaohui-B21989 wrote:
> > > > > > -----Original Message-----
> > > > > > From: Wood Scott-B07421
> > > > > > Sent: Thursday, November 13, 2014 2:17 PM
> > > > > > To: Xie Shaohui-B21989
> > > > > > Cc: Liberman Igal-B31950; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > > > > > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve Emilian-EMMEDVE1
> > > > > > Subject: Re: [PATCH] DT: add MDIO node for FMan node
> > > > > >
> > > > > > On Wed, 2014-11-12 at 07:40 -0600, Xie Shaohui-B21989 wrote:
> > > > > > > > -----Original Message-----
> > > > > > > > From: Wood Scott-B07421
> > > > > > > > Sent: Wednesday, November 12, 2014 1:38 AM
> > > > > > > > To: Xie Shaohui-B21989
> > > > > > > > Cc: Liberman Igal-B31950; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > > > > > > > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve Emilian-EMMEDVE1
> > > > > > > > Subject: Re: [PATCH] DT: add MDIO node for FMan node
> > > > > > > >
> > > > > > > > On Tue, 2014-11-11 at 04:32 -0600, Xie Shaohui-B21989 wrote:
> > > > > > > > > > -----Original Message-----
> > > > > > > > > > From: Wood Scott-B07421
> > > > > > > > > > Sent: Tuesday, November 11, 2014 8:23 AM
> > > > > > > > > > To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > > > > > > > > > Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org;
> > > > > > > > > > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve Emilian-EMMEDVE1; Xie
> > > > > > > > > > Shaohui-B21989
> > > > > > > > > > Subject: Re: [PATCH] DT: add MDIO node for FMan node
> > > > > > > > > >
> > > > > > > > > > On Tue, 2014-11-04 at 19:56 +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > wrote:
> > > > > > > > > > > From: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > > > > > > >
> > > > > > > > > > > This binding is for FMan MDIO, it covers FMan v2 & FMan
> > v3.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Shaohui Xie <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > > > > > > > ---
> > > > > > > > > > > based on http://patchwork.ozlabs.org/patch/390351/
> > > > > > > > > > > for 'next' of
> > > > > > > > > > >
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.
> > > > > > > > > > > git
> > > > > > > > > >
> > > > > > > > > > Are there any other FMan pieces that are missing from
> > > > > > > > > > the above
> > > > > > patch?
> > > > > > > > > [S.H] I'm adding Igal for this comment.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > +- bus-frequency
> > > > > > > > > > > +		Usage: optional
> > > > > > > > > > > +		Value type: <u32>
> > > > > > > > > > > +		Definition: Default MDIO bus clock speed.
> > > > > > > > > >
> > > > > > > > > > Use clocks/clock-names
> > > > > > > > > [S.H] The MDIO uses Fman clock and divides it to a proper
> > > > > > > > > value which
> > > > > > > > is specified by this property.
> > > > > > > >
> > > > > > > > Use clocks/clock-names to describe that relationship.
> > > > > > > >
> > > > > > >
> > > > > > > [S.H] The MDIO node is sub-node and embedded in Fman node, the
> > > > > > > clocks/clock-names is provided by Fman node, should repeat
> > > > > > > them in MDIO node? For the default MDIO bus clock speed, maybe
> > > > > > > "clock-
> > > > ranges"
> > > > > > > should be used?
> > > > > >
> > > > > > It's a different clock.  You wouldn't be repeating.  If it's
> > > > > > derived from the FMan clock, then maybe you don't need anything
> > > > > > here (does the driver know what the divider is, or would that
> > > > > > need to be specified in the device tree?), but no more
> > > > > > clock-frequency/bus-
> > > > frequency properties.
> > > > > >
> > > > > [S.H] The purpose here is to get a specific clock frequency,
> > > > > driver to
> > > > use it to calculate the divider.
> > > > > Then the Fman clock can be divided to the frequency.
> > > >
> > > > Oh, so this is stating a desired frequency and not something that
> > > > already exists?  What determines this frequency?  Is it based on
> > > > board design, or just on the MDIO standard, etc?  I'm wondering if
> > > > the device tree is the right place for it.
> > > [S.H] Yes, a desired frequency which is different with MDIO standard.
> > 
> > I'm not sure what you mean by "different with".  Do you mean "different
> > from"?  What does the standard say about frequency?
> [S.H] The standard MDIO frequency is 2.5MHz.  But a different one is desired.

Why is a different frequency desired?

> > 
> > > The Fman clock and the divider determines this frequency.
> > > Since Fman clock is different on different SoCs, so specify the
> > > desired frequency, then to get the proper divider.
> > 
> > Why does the fman clock being different mean the mdio clock should be
> > different?
> [S.H] The mdio clock should be same, a different divider should be used 
> to match the Fman clock to make sure the mdio clock kept same. So to specify
> The desired mdio frequency, then to get proper divider.

What I'm trying to determine is why the MDIO frequency wouldn't always
be the same, and thus could be hardcoded in the driver rather than in
the device tree.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
