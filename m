From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: shmobile: document iWave's
 iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development platform
Date: Wed, 9 Aug 2017 11:09:18 +0200
Message-ID: <20170809090918.GO2705@verge.net.au>
References: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
 <TY1PR06MB07023F6BECCA3E86D00EBE23B78A0@TY1PR06MB0702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB07023F6BECCA3E86D00EBE23B78A0-/PRLmSCtZ14u2TXDOttQZW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 02:14:50PM +0000, Chris Paterson wrote:
> + linux-renesas-soc

Thanks Chris,

I would not have seen these patches otherwise.

Fabrizio,

these patches seem find to me.
Please repost them with myself and linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org CCed
so they hit the patchwork of that ML and I can apply them.

Please add any "Acked-by" or other tags that you may have received -
patchwork can't currently see them either.

I would also consider dropping the CC of linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
there is no need to circulate these patches there.



> 
> > From: Fabrizio Castro [mailto:fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org]
> > Sent: 08 August 2017 13:28
> > To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org
> > 
> > Hello,
> > 
> > This series aims to add the documentation for the device tree bindings of the
> > iWave iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development kit:
> > http://www.iwavesystems.com/product/development-platform/sodimm-
> > evaluation-boards/rz-g1e-sodimm-development-kit-28/rz-g1e-sodimm-
> > development-kit.html
> > 
> > which consists of a System on Module (iW-RainboW-G22M-SM) and a carrier
> > card (iW-RainboW-G22D).
> > 
> > Regards,
> > 
> > Fabrizio Castro (2):
> >   ARM: shmobile: document iW-RainboW-G22M-SM SODIMM System on
> > Module
> >   ARM: shmobile: document iW-RainboW-G22D SODIMM SOM Development
> >     Platform
> > 
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > --
> > 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
