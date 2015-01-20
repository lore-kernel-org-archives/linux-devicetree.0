From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: imx6sx-sdb: change default board as reva board
Date: Tue, 20 Jan 2015 16:03:39 +0800
Message-ID: <20150120080338.GW2766@dragon>
References: <1421220998-3491-1-git-send-email-peter.chen@freescale.com>
 <1421220998-3491-2-git-send-email-peter.chen@freescale.com>
 <20150120073527.GT2766@dragon>
 <20150120063016.GD13645@shlinux2>
 <BN1PR0301MB062873E37C225DD38B2BCE3CFF4B0@BN1PR0301MB0628.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BN1PR0301MB062873E37C225DD38B2BCE3CFF4B0-RQSpjbwlmjRcEY/EnGXkZZwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2015 at 07:51:31AM +0000, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> > > > +&cpu0 {
> > > > +	operating-points = <
> > > > +		/* kHz    uV */
> > > > +		996000  1250000
> > > > +		792000  1175000
> > > > +		396000  1075000
> > > > +	>;
> > > > +	fsl,soc-operating-points = <
> > > > +		/* ARM kHz  SOC uV */
> > > > +		996000      1175000
> > > > +		792000      1175000
> > > > +		396000      1175000
> > > > +	>;
> > >
> > > I'm wondering why different revision of the board require a different
> > > OPP settings.
> > >
> > 
> > Anson, do you know the reason?
> 
> As i.MX6SX SDB Rev-B board uses PFuse 200 which has only one power supply for both
> VDDARM_IN and VDDSOC_IN, so it needs VDDARM_IN equal VDDSOC_IN, currently
> we set Rev-B board as default in imx6sx.dtsi, which uses same voltage for both
> VDDARM_IN and VDDSOC_IN.The Rev-A board uses PFuze 100 which has separate power
> supply for VDDARM_IN and VDDSOC_IN, so it can use different voltage on VDDARM_IN
> and VDDSOC_IN according to datasheet.

Thanks for the clarification, Anson.

Peter,

OPP is a CPU characteristic defined by data sheet, so we should define
OPP according to data sheet in imx6sx.dtsi, and only overwrite the
property in Rev-B dts per board/PMIC quirk.

Also, please put the rationale why we need OPP quick on Rev-B into
commit log.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
