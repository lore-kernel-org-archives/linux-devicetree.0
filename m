From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: atlas7: use general dt-binding for hwspinlock
Date: Thu, 28 May 2015 16:30:53 -0500
Message-ID: <5567890D.30906@ti.com>
References: <1432628911-18555-1-git-send-email-21cnbao@gmail.com> <1432628911-18555-3-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432628911-18555-3-git-send-email-21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: workgroup.linux-kQvG35nSl+M@public.gmane.org, Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Barry,

On 05/26/2015 03:28 AM, Barry Song wrote:
> From: Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>
> 
> This patch moves to use generic dt-binding for hwspinlock providers and
> clients.
> add #hwlock-cells for the provider and hwlocks for clients.
> 
> Cc: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
> Cc: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
> Signed-off-by: Wei Chen <Wei.Chen-kQvG35nSl+M@public.gmane.org>
> Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
> ---
>  arch/arm/boot/dts/atlas7.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/atlas7.dtsi b/arch/arm/boot/dts/atlas7.dtsi
> index a753178..66d3f0e 100644
> --- a/arch/arm/boot/dts/atlas7.dtsi
> +++ b/arch/arm/boot/dts/atlas7.dtsi
> @@ -84,17 +84,17 @@
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  
> -			hwspinlock {
> +			hwlock: hwspinlock {
>  				compatible = "sirf,hwspinlock";
>  				reg = <0x13240000 0x00010000>;

An unrelated question here, why the reg is same for all the child nodes
of the  parent ipc node? If this is partitioned properly, then the
driver can be simplified a bit by using platform_get_resource and
devm_ioremap_resource?

> -
> -				num-spinlocks = <30>;
> +				#hwlock-cells = <1>;
>  			};
>  
>  			ns_m3_rproc@0 {
>  				compatible = "sirf,ns2m30-rproc";
>  				reg = <0x13240000 0x00010000>;
>  				interrupts = <0 123 0>;
> +				hwlocks = <&hwlock 0>, <&hwlock 1>;

Does this need to be added for the other nodes like ns_m3_rproc@1 as well?

regards
Suman

>  			};
>  
>  			ns_m3_rproc@1 {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
