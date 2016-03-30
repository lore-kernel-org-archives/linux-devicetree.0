From: "Imre Kaloz" <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: mvebu: Correct unit address for linksys
Date: Wed, 30 Mar 2016 11:05:37 +0200
Message-ID: <op.ye4rjnln2s3iss@ecaz>
References: <1459270660-30411-1-git-send-email-patrick@puiterwijk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459270660-30411-1-git-send-email-patrick-TjDN7UKZo3m+BTG0ijDn3Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Patrick Uiterwijk <patrick-TjDN7UKZo3m+BTG0ijDn3Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Right, a165c3b63b6f24fdc47c270db5f8b1a48b69c1b6 was merged sooner then  
this board setup file.

Acked-by: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

On Tue, 29 Mar 2016 18:57:40 +0200, Patrick Uiterwijk  
<patrick-TjDN7UKZo3m+BTG0ijDn3Q@public.gmane.org> wrote:

> The USB2 port for Armada 38x is defined to be at 58000, not at
> 50000.
>
> Signed-off-by: Patrick Uiterwijk <patrick-TjDN7UKZo3m+BTG0ijDn3Q@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-385-linksys.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armada-385-linksys.dtsi  
> b/arch/arm/boot/dts/armada-385-linksys.dtsi
> index 3710755..85d2c37 100644
> --- a/arch/arm/boot/dts/armada-385-linksys.dtsi
> +++ b/arch/arm/boot/dts/armada-385-linksys.dtsi
> @@ -117,7 +117,7 @@
>  			};
> 			/* USB part of the eSATA/USB 2.0 port */
> -			usb@50000 {
> +			usb@58000 {
>  				status = "okay";
>  			};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
