From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: auxadc: Add binding document for
 Mediatek auxadc.
Date: Sat, 16 Jul 2016 14:31:25 -0500
Message-ID: <20160716193125.GA14506@rob-hp-laptop>
References: <1468219197-9572-1-git-send-email-zhiyong.tao@mediatek.com>
 <1468219197-9572-2-git-send-email-zhiyong.tao@mediatek.com>
 <1468291396.419.15.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468291396.419.15.camel@mhfsdcap03>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhiyong tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dawei.chien-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 12, 2016 at 10:43:16AM +0800, zhiyong tao wrote:
> On Mon, 2016-07-11 at 14:39 +0800, Zhiyong Tao wrote:
> > The commit adds the device tree binding documentation for the mediatek
> > auxadc found on Mediatek MT2701.
> > Thermal gets auxadc sample data by iio device.
> > So the commit changes auxadc device tree binding documentation from
> > /soc/mediatek/auxadc.txt to /iio/adc/mt6577_auxadc.txt.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> 
> I forgot that I should use the command 'git format-patch -M' to submit
> this patch. The follow information is the patch after executing the
> above command. If the patch needs to be resent, please help to notify
> me. I will resend the patch quickly.
> The follow information:
> 
>  .../auxadc.txt => iio/adc/mt6577_auxadc.txt}       |   16
> +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/{soc/mediatek/auxadc.txt =>
> iio/adc/mt6577_auxadc.txt} (50%)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
> b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> similarity index 50%
> rename from Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
> rename to Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> index bdb7829..bc23792 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/auxadc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/mt6577_auxadc.txt
> @@ -1,4 +1,4 @@
> -MediaTek AUXADC
> +* Mediatek AUXADC - Analog to Digital Converter on Mediatek mobile soc
> (mt65xx/mt81xx/mt27xx)
>  ===============
> 
>  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> @@ -10,12 +10,18 @@
> Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>  for the Thermal Controller which holds a phandle to the AUXADC.
> 
>  Required properties:
> -- compatible: Must be "mediatek,mt8173-auxadc"
> -- reg: Address range of the AUXADC unit
> +  - compatible: "mediatek,mt2701-auxadc" or "mediatek,mt8173-auxadc"

It's preferred to list one per line, but this is fine unless you resend.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
