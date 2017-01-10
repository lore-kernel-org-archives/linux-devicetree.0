From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: Add document bindings
 for mtk-cir
Date: Tue, 10 Jan 2017 10:35:54 +0800
Message-ID: <1484015754.4057.4.camel@mtkswgap22>
References: <1483632384-8107-1-git-send-email-sean.wang@mediatek.com>
         <1483632384-8107-2-git-send-email-sean.wang@mediatek.com>
         <20170109183214.xonv52sn3fo4exqp@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170109183214.xonv52sn3fo4exqp@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, keyhaede-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

thanks for your effort for reviewing. I added comments inline.

On Mon, 2017-01-09 at 12:32 -0600, Rob Herring wrote:
> On Fri, Jan 06, 2017 at 12:06:23AM +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > This patch adds documentation for devicetree bindings for
> > Mediatek IR controller.
> > 
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/mtk-cir.txt          | 23 ++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 linux-4.8.rc1_p0/Documentation/devicetree/bindings/media/mtk-cir.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mtk-cir.txt b/Documentation/devicetree/bindings/media/mtk-cir.txt
> > new file mode 100644
> > index 0000000..bbedd71
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mtk-cir.txt
> > @@ -0,0 +1,23 @@
> > +Device-Tree bindings for Mediatek IR controller found in Mediatek SoC family
> > +
> > +Required properties:
> > +- compatible	    : "mediatek,mt7623-ir"
> > +- clocks	    : list of clock specifiers, corresponding to
> > +		      entries in clock-names property;
> > +- clock-names	    : should contain "clk" entries;
> > +- interrupts	    : should contain IR IRQ number;
> > +- reg		    : should contain IO map address for IR.
> > +
> > +Optional properties:
> > +- linux,rc-map-name : Remote control map name.
> 
> Would 'label' be appropriate here instead? If not, this needs to be 
> documented in a common location and explained better.
> 
I checked with how the way applied in other IR drivers is and found that
most IR driver also use the same label to identify the scan/key table
they prefer to use such as gpio-ir-recv, ir-hix5hd2, meson-ir and
sunxi-cir or use hard coding inside the driver. So I thought it should
be appropriate here currently.

> > +
> > +Example:
> > +
> > +cir: cir@0x10013000 {
> 
> Drop the '0x'.
> 

okay, I will.

> > +	compatible = "mediatek,mt7623-ir";
> > +	reg = <0 0x10013000 0 0x1000>;
> > +	interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
> > +	clocks = <&infracfg CLK_INFRA_IRRX>;
> > +	clock-names = "clk";
> > +	linux,rc-map-name = "rc-rc6-mce";
> > +};
> > -- 
> > 1.9.1
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
