From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: rockchip: add core dtsi file for rk3399 SoCs
Date: Thu, 21 Apr 2016 14:48:26 -0700
Message-ID: <20160421214826.GA69116@google.com>
References: <1461122150-9042-1-git-send-email-jay.xu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461122150-9042-1-git-send-email-jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rockchip-discuss-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Apr 20, 2016 at 11:15:50AM +0800, Jianqun Xu wrote:
> This patch adds core dtsi file for rk3399 found on Rockchip
> rk3399 SoCs, tested on rk3399 evb.
> 
> Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi | 1744 ++++++++++++++++++++++++++++++
>  1 file changed, 1744 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> new file mode 100644
> index 0000000..fa6fc2c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -0,0 +1,1744 @@
[...]

> +	emmc_phy: phy {
> +		compatible = "rockchip,rk3399-emmc-phy";
> +		reg-offset = <0xf780>;

This property is not documented. The current doc says we "require" reg,
but you're kinda misusing it, I believe. At any rate, the current phy
driver won't probe without 'reg'.

> +		#phy-cells = <0>;
> +		rockchip,grf = <&grf>;
> +		status = "disabled";
> +	};

[...]

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
