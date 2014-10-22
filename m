From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: meson: reset: Add reset controller for
 MesonX SoCs
Date: Wed, 22 Oct 2014 11:52:40 +0200
Message-ID: <20141022095240.GA22342@carlo-MacBookPro>
References: <1413803985-8363-1-git-send-email-carlo@caione.org>
 <1413803985-8363-2-git-send-email-carlo@caione.org>
 <1413819611.3107.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413819611.3107.6.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On lun, ott 20, 2014 at 05:40:11 +0200, Philipp Zabel wrote:
> Am Montag, den 20.10.2014, 13:19 +0200 schrieb Carlo Caione:
> > Hi Philipp,
> > from the documentation and the sources I have, it seems that in the register
> > together with the bits for resetting the ICs there are also bits for turning
> > the ICs on and off. I really wanted to avoid create a new of_xlate function
> > just to map the reset IDs to the correct bit in the register so I left the
> > nr_resets to BITS_PER_LONG and I'm using the default of_xlate.
> > This way I can also avoid to use obscure reset IDs to be remapped when I can
> > use directly the bit number in the register as reset ID.
> 
> I'm fine with reusing of_reset_simple_xlate and using the bit offsets as
> reset control number. Do you already know what abstraction you'll choose
> for the IC enable bits? (Are those clock gates, or maybe power domains?)
> Hopefully the documentation you obtained will help to decide.

Those are clock gates actually. Arnd suggested to add a driver for the
entire block (resets and clock gates) so probably I need to dig deeper
in the CCF.

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
