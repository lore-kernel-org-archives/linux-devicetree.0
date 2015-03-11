From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] ARM: imx6qdl-sabresd: set swbst_reg as vbus's parent
 reg
Date: Wed, 11 Mar 2015 09:24:25 +0800
Message-ID: <20150311012424.GW20455@dragon>
References: <1425629061-8995-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425629061-8995-1-git-send-email-peter.chen@freescale.com>
Sender: stable-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 06, 2015 at 04:04:20PM +0800, Peter Chen wrote:
> USB vbus 5V is from PMIC SWBST, so set swbst_reg as vbus's
> parent reg, it fixed a bug that the voltage of vbus is incorrect
> due to swbst_reg is disabled after boots up.
> 
> Cc: stable <stable@vger.kernel.org>

It's more idiomatic to put the line in this way:

Cc: stable@vger.kernel.org

Changed it and applied both patches.

Shawn

> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index f1cd214..a626e6d 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -35,6 +35,7 @@
>  			regulator-max-microvolt = <5000000>;
>  			gpio = <&gpio3 22 0>;
>  			enable-active-high;
> +			vin-supply = <&swbst_reg>;
>  		};
>  
>  		reg_usb_h1_vbus: regulator@1 {
> @@ -45,6 +46,7 @@
>  			regulator-max-microvolt = <5000000>;
>  			gpio = <&gpio1 29 0>;
>  			enable-active-high;
> +			vin-supply = <&swbst_reg>;
>  		};
>  
>  		reg_audio: regulator@2 {
> -- 
> 1.9.1
> 
