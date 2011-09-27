From: Rajendra Nayak <rnayak@ti.com>
Subject: Re: [PATCH 08/13] arm/dts: OMAP4: Add i2c controller nodes
Date: Tue, 27 Sep 2011 11:12:49 +0530
Message-ID: <4E816259.4050606@ti.com>
References: <1317055821-20652-1-git-send-email-b-cousson@ti.com> <1317055821-20652-9-git-send-email-b-cousson@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1317055821-20652-9-git-send-email-b-cousson@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <b-cousson@ti.com>
Cc: tony@atomide.com, grant.likely@secretlab.ca, paul@pwsan.com, khilman@ti.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, "G, Manjunath Kondaiah" <manjugk@ti.com>
List-Id: devicetree@vger.kernel.org

On Monday 26 September 2011 10:20 PM, Benoit Cousson wrote:
> Add i2c controllers nodes into the main ocp bus.
>
> Signed-off-by: Benoit Cousson<b-cousson@ti.com>
> Cc: G, Manjunath Kondaiah<manjugk@ti.com>
> ---
>   arch/arm/boot/dts/omap4.dtsi |   32 ++++++++++++++++++++++++++++++++
>   1 files changed, 32 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
> index bb19bca..447f482 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -21,6 +21,10 @@
>   	interrupt-parent =<&gic>;
>
>   	aliases {
> +		i2c1 =&i2c1;
> +		i2c2 =&i2c2;
> +		i2c3 =&i2c3;
> +		i2c4 =&i2c4;
>   	};
>
>   	cpus {
> @@ -173,5 +177,33 @@
>   			#gpio-cells =<2>;
>   			gpio-controller;
>   		};
> +
> +		i2c1: i2c@1 {
> +			compatible = "ti,omap3-i2c";

This is a little confusing as omap4.dtsi has
compatible "ti,omap3-i2c" nodes in it.

> +			#address-cells =<1>;
> +			#size-cells =<0>;
> +			ti,hwmods = "i2c1";
> +		};
> +
> +		i2c2: i2c@2 {
> +			compatible = "ti,omap3-i2c";
> +			#address-cells =<1>;
> +			#size-cells =<0>;
> +			ti,hwmods = "i2c2";
> +		};
> +
> +		i2c3: i2c@3 {
> +			compatible = "ti,omap3-i2c";
> +			#address-cells =<1>;
> +			#size-cells =<0>;
> +			ti,hwmods = "i2c3";
> +		};
> +
> +		i2c4: i2c@4 {
> +			compatible = "ti,omap3-i2c";
> +			#address-cells =<1>;
> +			#size-cells =<0>;
> +			ti,hwmods = "i2c4";
> +		};
>   	};
>   };

