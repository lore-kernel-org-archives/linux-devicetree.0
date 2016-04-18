From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 3/4] soc: mediatek: Add MT2701 power dt-bindings
Date: Mon, 18 Apr 2016 09:56:54 +0800
Message-ID: <1460944614.26713.1.camel@mtksdaap41>
References: <1460621819-695-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1460621819-695-4-git-send-email-jamesjj.liao@mediatek.com>
	 <1460631381.13240.3.camel@mtksdaap41> <1460685753.7028.5.camel@mtksdaap41>
	 <1460731329.19786.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460731329.19786.4.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Yingjoe,

On Fri, 2016-04-15 at 22:42 +0800, Yingjoe Chen wrote:
> On Fri, 2016-04-15 at 10:02 +0800, James Liao wrote:
> > On Thu, 2016-04-14 at 18:56 +0800, Yingjoe Chen wrote:
> > > On Thu, 2016-04-14 at 16:16 +0800, James Liao wrote:
> > > > From: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > 
> > > > Add power dt-bindings for MT2701.
> > > > 
> > > > Signed-off-by: Shunli Wang <shunli.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > > Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > > > ---
> > > >  .../devicetree/bindings/soc/mediatek/scpsys.txt    | 12 ++++++----
> > > >  include/dt-bindings/power/mt2701-power.h           | 27 ++++++++++++++++++++++
> > > >  2 files changed, 34 insertions(+), 5 deletions(-)
> > > >  create mode 100644 include/dt-bindings/power/mt2701-power.h
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > > > index e8f15e3..ebb3144 100644
> > > > --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > > > +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > > > @@ -9,17 +9,19 @@ domain control.
> > > >  
> > > >  The driver implements the Generic PM domain bindings described in
> > > >  power/power_domain.txt. It provides the power domains defined in
> > > > -include/dt-bindings/power/mt8173-power.h.
> > > > +include/dt-bindings/power/mt8173-power.h and mt2701-power.h.
> > > >  
> > > >  Required properties:
> > > > -- compatible: Must be "mediatek,mt8173-scpsys"
> > > > +- compatible: Should be one of:
> > > > +	- "mediatek,mt2701-scpsys"
> > > > +	- "mediatek,mt8173-scpsys"
> > > >  - #power-domain-cells: Must be 1
> > > >  - reg: Address range of the SCPSYS unit
> > > >  - infracfg: must contain a phandle to the infracfg controller
> > > >  - clock, clock-names: clocks according to the common clock binding.
> > > > -                      The clocks needed "mm", "mfg", "venc" and "venc_lt".
> > > > -		      These are the clocks which hardware needs to be enabled
> > > > -		      before enabling certain power domains.
> > > > +                      The clocks needed "mm", "mfg", "venc", "venc_lt" and
> > > > +                      "ethif". These are the clocks which hardware needs to be
> > > > +                      enabled before enabling certain power domains.
> > > 
> > > 
> > > Clock ethif only exist on mt2701 so it is not required on mt8173.
> > 
> > You are right. Each SoC needs different clock for each power domain.
> > Here list all subsystems of available SoCs.
> 
> Binding should list required clocks for each specific platform. How
> about this:
> 
> - clock, clock-names: clocks according to the common clock binding.
> 		      These are the clocks which hardware needs to be
>                       enabled before enabling certain power domains.
>   	Required clocks for mt2701: "mm", "mfg", "ethif"
> 	Required clocks for mt8173: "mm", "mfg", "venc", "venc_lt"

OK. I'll follow your suggestion in next patch.


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
