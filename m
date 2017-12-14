From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: ARM: Mediatek: Fix ethsys documentation
Date: Thu, 14 Dec 2017 12:10:07 +0100
Message-ID: <b92fd3bd-c61a-ae58-49ef-8727af065ec1@gmail.com>
References: <20171201120708.30129-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171201120708.30129-1-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen, Michael,

On 12/01/2017 01:07 PM, Matthias Brugger wrote:
> The ethsys registers a reset controller, so we need to specify a
> reset cell. This patch fixes the documentation.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> index 7aa3fa167668..6cc7840ff37a 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> @@ -20,4 +20,5 @@ ethsys: clock-controller@1b000000 {
>  	compatible = "mediatek,mt2701-ethsys", "syscon";
>  	reg = <0 0x1b000000 0 0x1000>;
>  	#clock-cells = <1>;
> +	#reset-cells = <1>;
>  };
> 

Will you take this patch through the clk tree, or shall I take it through my SoC
tree?

Regards,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
