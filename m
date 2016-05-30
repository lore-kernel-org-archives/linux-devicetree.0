From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: drop "arm,amba-bus" in favor of "simple-bus" part 2
Date: Mon, 30 May 2016 12:19:21 +0200
Message-ID: <3072536.5uGCiTBfGN@diego>
References: <1464574353-31477-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464574353-31477-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanho Min <chanho.min-Hm3cg6mZ9cc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 30. Mai 2016, 11:12:33 schrieb Masahiro Yamada:
> Tree-wide replacement was done by commit 2ef7d5f342c1 (ARM, ARM64:
> dts: drop "arm,amba-bus" in favor of "simple-bus"), but we have some
> new users of "arm,amba-bus" at Linux 4.7-rc1.  Eliminate them now.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>

For the Rockchip part,
Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
> 
> In order to not leave these compatible strings for the release,
> is it OK to apply this patch for Linux 4.7 ?
> 
> 
> 
>  arch/arm64/boot/dts/lg/lg1312.dtsi       | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/lg/lg1312.dtsi
> b/arch/arm64/boot/dts/lg/lg1312.dtsi index 3a4e9a2..fbafa24 100644
> --- a/arch/arm64/boot/dts/lg/lg1312.dtsi
> +++ b/arch/arm64/boot/dts/lg/lg1312.dtsi
> @@ -125,7 +125,7 @@
>  		#size-cells = <1>;
>  		#interrupts-cells = <3>;
> 
> -		compatible = "arm,amba-bus";
> +		compatible = "simple-bus";
>  		interrupt-parent = <&gic>;
>  		ranges;
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index 46f325a..d7f8e06 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -163,7 +163,7 @@
>  	};
> 
>  	amba {
> -		compatible = "arm,amba-bus";
> +		compatible = "simple-bus";
>  		#address-cells = <2>;
>  		#size-cells = <2>;
>  		ranges;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
