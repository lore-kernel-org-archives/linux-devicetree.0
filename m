From: zhiyong tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 3/3] arm: dts: mt2701: Add auxadc node.
Date: Mon, 22 Aug 2016 14:22:08 +0800
Message-ID: <1471846928.16635.3.camel@mhfsdcap03>
References: <1471504297-26947-1-git-send-email-zhiyong.tao@mediatek.com>
         <1471504297-26947-4-git-send-email-zhiyong.tao@mediatek.com>
         <c238236c-2445-7802-6f2e-2f4776778c36@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c238236c-2445-7802-6f2e-2f4776778c36-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 2016-08-21 at 19:58 +0100, Jonathan Cameron wrote:
> On 18/08/16 08:11, Zhiyong Tao wrote:
> > The commit adds auxadc nodes to the Mediatek MT2701 dtsi file.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > This patch dependents on "Add clock support for Mediatek MT2701"[1].
> > Please accept this patch together with [1].
> > [1]http://lists.infradead.org/pipermail/linux-mediatek/2016-August/006620.html

Dear Jonathan,

This patch dependents on "Add clock support for Mediatek MT2701"[1]. 
We will refresh it again to Matthias when [1] is merged. 
[1]http://lists.infradead.org/pipermail/linux-mediatek/2016-August/006620.html

Thanks.

> Guessing this is working it's way ultimately through arm-soc.  Patches
> 1 and 2 are now heading through the iio / staging-iio route and should be
> merging in the next merge window if nothing odd happens.
> 
> Thanks,
> 
> Jonathan
> > ---
> >  arch/arm/boot/dts/mt2701.dtsi |    9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> > index 7eab6f4..8e6a18c 100644
> > --- a/arch/arm/boot/dts/mt2701.dtsi
> > +++ b/arch/arm/boot/dts/mt2701.dtsi
> > @@ -175,6 +175,15 @@
> >  		      <0 0x10216000 0 0x2000>;
> >  	};
> >  
> > +	auxadc: adc@11001000 {
> > +		compatible = "mediatek,mt2701-auxadc";
> > +		reg = <0 0x11001000 0 0x1000>;
> > +		clocks = <&pericfg CLK_PERI_AUXADC>;
> > +		clock-names = "main";
> > +		#io-channel-cells = <1>;
> > +		status = "disabled";
> > +	};
> > +
> >  	uart0: serial@11002000 {
> >  		compatible = "mediatek,mt2701-uart",
> >  			     "mediatek,mt6577-uart";
> > 
> 
