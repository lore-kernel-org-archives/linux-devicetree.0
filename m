From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: arm: mediatek: add MT7622 string to
 the PMIC wrapper doc
Date: Wed, 19 Jul 2017 10:54:45 +0800
Message-ID: <1500432885.19736.11.camel@mtkswgap22>
References: <cover.1500368529.git.sean.wang@mediatek.com>
         <fff9908edae7da7958ac43dfe9fa98b26c03a4e3.1500368529.git.sean.wang@mediatek.com>
         <1500393672.8739.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500393672.8739.1.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-07-19 at 00:01 +0800, Yingjoe Chen wrote:
> On Tue, 2017-07-18 at 17:49 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> > index 107700d..2d6d4a9 100644
> > --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> > +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> > @@ -35,6 +35,10 @@ Required properties in pwrap device node.
> >    "wrap": Main module clock
> >  - clocks: Must contain an entry for each entry in clock-names.
> >  
> > +Required properties in pwrap device node
> > +- compatible:
> > +	"mediatek,mt7622-pwrap" for MT7622 SoCs
> > +
> 
> Sean,
> 
> Why mt7622 need to be separated from others?
> 
> 
> Joe.C
> 
Hi, Joe.C

many thanks

It should be one of copy-n-past error, it will be fixed up with moving 
up to the existing group of compatible string.


	Sean
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
