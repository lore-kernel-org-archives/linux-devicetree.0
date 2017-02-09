From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 08/10] soc: mediatek: add MT6797 power dt-bindings
Date: Thu, 9 Feb 2017 09:32:10 +0800
Message-ID: <1486603930.29572.1.camel@mtkswgap22>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
         <1486383336-16892-9-git-send-email-mars.cheng@mediatek.com>
         <20170209003741.nxcdxah5ydcj6v33@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170209003741.nxcdxah5ydcj6v33@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chieh-Jay Liu <Chieh-Jay.Liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-02-08 at 18:37 -0600, Rob Herring wrote:
> On Mon, Feb 06, 2017 at 08:15:34PM +0800, Mars Cheng wrote:
> > This adds power dt-bindings for MT6797
> 
> Some consistency in the subject for bindings please.

Got it, will use the format like "dt-bindings: xxx: xxx" to send patch
set v3

Thanks.

> 
> > 
> > Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Kevin-CW Chen <kevin-cw.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/soc/mediatek/scpsys.txt    |    6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > index 16fe94d..b1d165b 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> > @@ -9,11 +9,14 @@ domain control.
> >  
> >  The driver implements the Generic PM domain bindings described in
> >  power/power_domain.txt. It provides the power domains defined in
> > -include/dt-bindings/power/mt8173-power.h and mt2701-power.h.
> > +- include/dt-bindings/power/mt8173-power.h
> > +- include/dt-bindings/power/mt6797-power.h
> > +- include/dt-bindings/power/mt2701-power.h
> >  
> >  Required properties:
> >  - compatible: Should be one of:
> >  	- "mediatek,mt2701-scpsys"
> > +	- "mediatek,mt6797-scpsys"
> >  	- "mediatek,mt8173-scpsys"
> >  - #power-domain-cells: Must be 1
> >  - reg: Address range of the SCPSYS unit
> > @@ -22,6 +25,7 @@ Required properties:
> >                        These are clocks which hardware needs to be
> >                        enabled before enabling certain power domains.
> >  	Required clocks for MT2701: "mm", "mfg", "ethif"
> > +	Required clocks for MT6797: "mm", "mfg", "vdec"
> >  	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
> >  
> >  Optional properties:
> > -- 
> > 1.7.9.5
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
