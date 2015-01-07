From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] [v3] power/fsl: add MDIO dt binding for FMan
Date: Wed, 7 Jan 2015 12:05:34 -0600
Message-ID: <1420653934.4961.58.camel@freescale.com>
References: <1419321466-5575-1-git-send-email-shh.xie@gmail.com>
	 <DM2PR0301MB08640979E5088618D1395CFAE2580@DM2PR0301MB0864.namprd03.prod.outlook.com>
	 <1420590520.4961.38.camel@freescale.com>
	 <DM2PR0301MB08645ABD93708FFE011EF362E2460@DM2PR0301MB0864.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR0301MB08645ABD93708FFE011EF362E2460-Cwg/PA1lyPnq20u2fDgSrZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xie Shaohui-B21989 <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Medve Emilian-EMMEDVE1 <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-06 at 23:29 -0600, Xie Shaohui-B21989 wrote:
> > > > +- interrupts
> > > > +		Usage: optional
> > > > +		Value type: <prop-encoded-array>
> > > > +		Definition: Event interrupt of external MDIO controller.
> > > > +		1 Gb/s MDIO and 10 Gb/s MDIO has one interrupt respectively.
> > 
> > I'm confused by "respectively" here.  Does fsl,fman-memac-mdio have two
> > interrupts (one for 1 Gb/s and one for 10 Gb/s)?
> [S.H] We use two MDIO controllers for external PHY management. One for 1 Gb/s,
> One for 10 Gb/s, and two MDIO interrupts connected to MPIC.

If there can be two interrupts you need to make that clear and specify
the order.

Is it possible for one MDIO controller to have an interrupt connected
but not the other, on the same system?  How would you represent that in
the device tree?  If there are two MDIO controllers why are they in the
same node?

>   Does "optional" mean it's used if and
> > only if external MDIO is used, or is it optional even with external MDIO?  I see
> > it's not present in the example -- do we not have a real example that has the
> > interrupt?
> [S.H] "optional" means it's available on hardware, but MDIO driver does not use interrupt. 
> So we don't have a real example.

<record type="broken">The device tree describes the hardware, not the
driver</record>

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
