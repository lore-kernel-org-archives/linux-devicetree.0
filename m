From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage
Date: Thu, 12 Jan 2017 16:52:06 -0800
Message-ID: <m2r3476atl.fsf@baylibre.com>
References: <1482319894-656-1-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482319894-656-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome
        Brunet's message of "Wed, 21 Dec 2016 12:31:34 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> OdroidC2 GbE link breaks under heavy tx transfer. This happens even if the
> MAC does not enable Energy Efficient Ethernet (No Low Power state Idle on
> the Tx path). The problem seems to come from the phy Rx path, entering the
> LPI state.
>
> Disabling EEE advertisement on the phy prevent this feature to be
> negociated with the link partner and solve the issue.
>
> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>
> This patch is based on Linus recent master branch [0]
> This patch depends on the series [1] which has been merged in this branch.
>
> 0: ba6d973f78eb ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net")
> 1: http://lkml.kernel.org/r/1480326409-25419-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
>    Fix integration of eee-broken-modes
>    
>  arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 238fbeacd330..d8933e9e9a5a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -147,6 +147,18 @@
>  	status = "okay";
>  	pinctrl-0 = <&eth_rgmii_pins>;
>  	pinctrl-names = "default";
> +	phy-handle = <&eth_phy0>;
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		eth_phy0: ethernet-phy@0 {
> +			reg = <0>;
> +			eee-broken-1000t;
> +		};
> +	};

There's already an MDIO node in the meson-gx.dtsi (using the same
compatible), shouldn't you just override that and add the new
properties?

What would make things easier is if the names were like Martin used in
his reset patch, so that when I merge them together it's not a major
conflict.

Thanks,

Kevin

[1] https://patchwork.kernel.org/patch/9459409/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
