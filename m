From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v6 41/41] ARM: dts: da850: Add clocks
Date: Mon, 22 Jan 2018 11:14:11 -0600
Message-ID: <20a164e1-2d78-8905-cada-ca02dbf3e5c3@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-42-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516468460-4908-42-git-send-email-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/20/2018 11:14 AM, David Lechner wrote:
> This adds clock provider nodes for da850 and wires them up to all of the
> devices.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v6 changes:
> - updated for device tree bindings changes earlier in this series
> - use single async2 clock instead of duplicate fixed factor clocks
> - add clock-names property to mdio node
> 
>   arch/arm/boot/dts/da850.dtsi | 162 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 162 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi

...

>   		pmx_core: pinmux@14120 {
>   			compatible = "pinctrl-single";
>   			reg = <0x14120 0x50>;
> @@ -264,8 +325,43 @@
>   			usb_phy: usb-phy {
>   				compatible = "ti,da830-usb-phy";
>   				#phy-cells = <1>;
> +				clocks = <&usb_phy_clk 0>, <&usb_phy_clk 1>;
> +				clock-names = "usb20_phy", "usb11_phy";

This should be:
				clock-names = "usb0_clk48", "usb1_clk48";

>   				status = "disabled";
>   			};
