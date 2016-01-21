From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/4] soc: mediatek: Add MT2701 power dt-bindings
Date: Thu, 21 Jan 2016 13:22:26 +0800
Message-ID: <1453353746.5384.35.camel@mtksdaap41>
References: <1453270097-53853-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1453270097-53853-4-git-send-email-jamesjj.liao@mediatek.com>
	 <1453282161.16515.9.camel@mtksdaap41>
	 <20160120163502.GA22147@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160120163502.GA22147@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Yingjoe, Rob,

On Wed, 2016-01-20 at 10:35 -0600, Rob Herring wrote:
> On Wed, Jan 20, 2016 at 05:29:21PM +0800, Yingjoe Chen wrote:
> > On Wed, 2016-01-20 at 14:08 +0800, James Liao wrote:
> > > From: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > 
> > > Add power dt-bindings for MT2701.
> > > 
> > > Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/soc/mediatek/scpsys.txt    |  6 +++--
> > >  include/dt-bindings/power/mt2701-power.h           | 27 ++++++++++++++++++++++
> > >  2 files changed, 31 insertions(+), 2 deletions(-)
> > >  create mode 100644 include/dt-bindings/power/mt2701-power.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > > index a6c8afc..807d87f 100644
> > > --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > > +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > > @@ -9,10 +9,12 @@ domain control.
> > >  
> > >  The driver implements the Generic PM domain bindings described in
> > >  power/power_domain.txt. It provides the power domains defined in
> > > -include/dt-bindings/power/mt8173-power.h.
> > > +include/dt-bindings/power/mt8173-power.h and mt2701-power.h.
> > >  
> > >  Required properties:
> > > -- compatible: Must be "mediatek,mt8173-scpsys"
> > > +- compatible: Should be:
> > > +	- "mediatek,mt8173-scpsys"
> > > +	- "mediatek,mt2701-scpsys"
> > >  - #power-domain-cells: Must be 1
> > >  - reg: Address range of the SCPSYS unit
> > >  - infracfg: must contain a phandle to the infracfg controller
> > 
> > Please sort the list.
> 
> And s/Should be/Should be one of/

OK. I'll modify it in next patch.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
