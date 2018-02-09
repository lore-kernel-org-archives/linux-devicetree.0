From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: mediatek: add missing
 required #reset-cells
Date: Fri, 9 Feb 2018 11:38:56 +0800
Message-ID: <1518147536.9025.9.camel@mtkswgap22>
References: <cover.1517910489.git.sean.wang@mediatek.com>
         <d58fcf36319254d6de4c7fe100cbdca1bbec27a5.1517910489.git.sean.wang@mediatek.com>
         <391278e5-9b72-1142-0262-5d286fe17d8d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <391278e5-9b72-1142-0262-5d286fe17d8d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2018-02-07 at 11:45 +0100, Matthias Brugger wrote:
> 
> On 02/06/2018 10:52 AM, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > All ethsys, pciesys and ssusbsys internally include reset controller, so
> > explicitly add back these missing cell definitions to related bindings
> > and examples.
> > 
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt   | 2 ++
> >  Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt  | 2 ++
> >  Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt | 2 ++
> >  3 files changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> > index 7aa3fa1..8f5335b 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> > @@ -9,6 +9,7 @@ Required Properties:
> >  	- "mediatek,mt2701-ethsys", "syscon"
> >  	- "mediatek,mt7622-ethsys", "syscon"
> >  - #clock-cells: Must be 1
> > +- #reset-cells: Must be 1
> >  
> >  The ethsys controller uses the common clk binding from
> >  Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -20,4 +21,5 @@ ethsys: clock-controller@1b000000 {
> >  	compatible = "mediatek,mt2701-ethsys", "syscon";
> >  	reg = <0 0x1b000000 0 0x1000>;
> >  	#clock-cells = <1>;
> > +	#reset-cells = <1>;
> 
> The example is already fixed upstream, but I forgot the binding description,
> please rebase this patch.
> 
> And please don't forget to add all clock maintainers.
> 

okay, i will do it.

> Regards,
> Matthias
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
