From: Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: keystone: fix dt bindings to use post div
 register for mainpll
Date: Fri, 31 Jul 2015 10:20:02 -0400
Message-ID: <55BB8412.2000905@ti.com>
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com> <1432915453-409-2-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432915453-409-2-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ssantosh@kernel.org, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/29/2015 12:04 PM, Murali Karicheri wrote:
> All of the keystone devices have a separate register to hold post
> divider value for main pll clock. Currently the fixed-postdiv
> value used for k2hk/l/e SoCs works by sheer luck as u-boot happens to
> use a value of 2 for this. Now that we have fixed this in the pll
> clock driver change the dt bindings for the same.
>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
>   arch/arm/boot/dts/k2e-clocks.dtsi  | 5 ++---
>   arch/arm/boot/dts/k2hk-clocks.dtsi | 5 ++---
>   arch/arm/boot/dts/k2l-clocks.dtsi  | 5 ++---
>   3 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/k2e-clocks.dtsi b/arch/arm/boot/dts/k2e-clocks.dtsi
> index 4773d6a..d56d68f 100644
> --- a/arch/arm/boot/dts/k2e-clocks.dtsi
> +++ b/arch/arm/boot/dts/k2e-clocks.dtsi
> @@ -13,9 +13,8 @@ clocks {
>   		#clock-cells = <0>;
>   		compatible = "ti,keystone,main-pll-clock";
>   		clocks = <&refclksys>;
> -		reg = <0x02620350 4>, <0x02310110 4>;
> -		reg-names = "control", "multiplier";
> -		fixed-postdiv = <2>;
> +		reg = <0x02620350 4>, <0x02310110 4>, <0x02310108 4>;
> +		reg-names = "control", "multiplier", "post-divider";
>   	};
>
>   	papllclk: papllclk@2620358 {
> diff --git a/arch/arm/boot/dts/k2hk-clocks.dtsi b/arch/arm/boot/dts/k2hk-clocks.dtsi
> index d5adee3..af9b719 100644
> --- a/arch/arm/boot/dts/k2hk-clocks.dtsi
> +++ b/arch/arm/boot/dts/k2hk-clocks.dtsi
> @@ -22,9 +22,8 @@ clocks {
>   		#clock-cells = <0>;
>   		compatible = "ti,keystone,main-pll-clock";
>   		clocks = <&refclksys>;
> -		reg = <0x02620350 4>, <0x02310110 4>;
> -		reg-names = "control", "multiplier";
> -		fixed-postdiv = <2>;
> +		reg = <0x02620350 4>, <0x02310110 4>, <0x02310108 4>;
> +		reg-names = "control", "multiplier", "post-divider";
>   	};
>
>   	papllclk: papllclk@2620358 {
> diff --git a/arch/arm/boot/dts/k2l-clocks.dtsi b/arch/arm/boot/dts/k2l-clocks.dtsi
> index eb1e3e2..ef8464b 100644
> --- a/arch/arm/boot/dts/k2l-clocks.dtsi
> +++ b/arch/arm/boot/dts/k2l-clocks.dtsi
> @@ -22,9 +22,8 @@ clocks {
>   		#clock-cells = <0>;
>   		compatible = "ti,keystone,main-pll-clock";
>   		clocks = <&refclksys>;
> -		reg = <0x02620350 4>, <0x02310110 4>;
> -		reg-names = "control", "multiplier";
> -		fixed-postdiv = <2>;
> +		reg = <0x02620350 4>, <0x02310110 4>, <0x02310108 4>;
> +		reg-names = "control", "multiplier", "post-divider";
>   	};
>
>   	papllclk: papllclk@2620358 {
>
Santosh,

The clk driver update is already merged to v4.2-rc. Could you send this 
DT update as well for 4.2-rc?

Murali

-- 
Murali Karicheri
Linux Kernel, Keystone
