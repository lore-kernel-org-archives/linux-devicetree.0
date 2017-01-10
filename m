From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add "rockchip, grf" property for
 RK3399 PMUCRU/CRU
Date: Tue, 10 Jan 2017 10:37:25 +0800
Message-ID: <7c0ebe60-ac6e-0f82-bb5f-97919f812a56@rock-chips.com>
References: <1484011661-13474-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1484011661-13474-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>, heiko@sntech.de
Cc: shawn.lin@rock-chips.com, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Michael Turquette <mturquette@baylibre.com>, Brian Norris <briannorris@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Will Deacon <will.deacon@arm.com>, dianders@google.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, David Wu <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On 2017/1/10 9:27, Xing Zheng wrote:
> The structure rockchip_clk_provider needs to refer the GRF regmap
> in somewhere, if the CRU node has not "rockchip,grf" property,
> calling syscon_regmap_lookup_by_phandle will return an invalid GRF
> regmap, and the MUXGRF type clock will be not supported.
>
> Therefore, we need to add them.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
> Changes in v3:
> - add optional roperty rockchip,grf in rockchip,rk3399-cru.txt
>
> Changes in v2:
> - referring pmugrf for PMUGRU
> - fix the typo "invaild" in COMMIT message
>
>  Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt | 5 +++++
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi                        | 2 ++
>  2 files changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
> index 3888dd3..f476b3d 100644
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
> @@ -13,6 +13,11 @@ Required Properties:
>  - #clock-cells: should be 1.
>  - #reset-cells: should be 1.
>
> +Optional Properties:
> +
> +- rockchip,grf: phandle to the syscon managing the "general register files"
> +  If missing pll rates are not changable, due to the missing pll lock status.
> +

It twists my tongue w/o proper punctuation:)

- rockchip,grf: phandle to the syscon managing the "general register 
files". If missing, pll rates are not changable due to the missing pll
lock status.


>  Each clock is assigned an identifier and client nodes can use this identifier
>  to specify the clock which they consume. All available clocks are defined as
>  preprocessor macros in the dt-bindings/clock/rk3399-cru.h headers and can be
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index c928015..081621b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1077,6 +1077,7 @@
>  	pmucru: pmu-clock-controller@ff750000 {
>  		compatible = "rockchip,rk3399-pmucru";
>  		reg = <0x0 0xff750000 0x0 0x1000>;
> +		rockchip,grf = <&pmugrf>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  		assigned-clocks = <&pmucru PLL_PPLL>;
> @@ -1086,6 +1087,7 @@
>  	cru: clock-controller@ff760000 {
>  		compatible = "rockchip,rk3399-cru";
>  		reg = <0x0 0xff760000 0x0 0x1000>;
> +		rockchip,grf = <&grf>;
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
>  		assigned-clocks =
>


-- 
Best Regards
Shawn Lin

