From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH][v4] power/fsl: add MDIO dt binding for FMan
Date: Thu, 29 Jan 2015 20:43:40 -0600
Message-ID: <1422585820.10544.146.camel@freescale.com>
References: <1422446064-3901-1-git-send-email-shh.xie@gmail.com>
	 <1422579249.10544.140.camel@freescale.com>
	 <DM2PR0301MB0864EF866EFDEB634BED54E5E2310@DM2PR0301MB0864.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR0301MB0864EF866EFDEB634BED54E5E2310-Cwg/PA1lyPnq20u2fDgSrZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xie Shaohui-B21989 <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Medve Emilian-EMMEDVE1 <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-01-29 at 20:38 -0600, Xie Shaohui-B21989 wrote:
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Friday, January 30, 2015 8:54 AM
> > To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Medve
> > Emilian-EMMEDVE1; Xie Shaohui-B21989
> > Subject: Re: [PATCH][v4] power/fsl: add MDIO dt binding for FMan
> > 
> > On Wed, 2015-01-28 at 19:54 +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > +- interrupts
> > > +		Usage: required
> > > +		Value type: <prop-encoded-array>
> > > +		Definition: Event interrupt of external MDIO controller.
> > 
> > What if this MDIO controller is not "external"?  Should Usage say
> > "required for external MDIO"?
> [S.H] I thought the definition can tell the interrupt is for external MDIO,
> I can change the Usage to "required for external MDIO" in next version. 
> how about other parts, are they OK?

Yes.  I'll fix it up when applying.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
