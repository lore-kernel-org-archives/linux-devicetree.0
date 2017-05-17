From: icenowy@aosc.io
Subject: Re: [PATCH v7 11/13] ARM: sun8i: v3s: add device nodes for DE2
 display pipeline
Date: Wed, 17 May 2017 17:27:00 +0800
Message-ID: <45e3b368b80fb74f33b18afcc3f783c5@aosc.io>
References: <20170514163045.40366-1-icenowy@aosc.io>
 <20170514163045.40366-12-icenowy@aosc.io>
 <20170515092400.nzxmocrdqgt4u476@flea.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170515092400.nzxmocrdqgt4u476@flea.home>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

在 2017-05-15 17:24，Maxime Ripard 写道：
> On Mon, May 15, 2017 at 12:30:43AM +0800, Icenowy Zheng wrote:
>> +		de2_clocks: clock@1000000 {
> 
> display_clocks would be better there, we don't have to dissociate de1
> with de2

How about de_clocks ? (See A80 DTSI)

> 
>> +			compatible = "allwinner,sun8i-v3s-de2-clk";
>> +			reg = <0x01000000 0x100000>;
>> +			clocks = <&ccu CLK_DE>,
>> +				 <&ccu CLK_BUS_DE>;
>> +			clock-names = "mod",
>> +				      "bus";
>> +			resets = <&ccu RST_BUS_DE>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +		};
>> +
>> +		de2_mixer0: mixer@1100000 {
> 
> and mixer0 here is enough too.
> 
> Is there several of them? Why not just use mixer if there's only one?

Nope, here it's tagged 0 only for consistency with other SoCs.

> 
>> +			compatible = "allwinner,sun8i-v3s-de2-mixer";
>> +			reg = <0x01100000 0x100000>;
>> +			clocks = <&de2_clocks CLK_MIXER0>,
>> +				 <&de2_clocks CLK_BUS_MIXER0>;
>> +			clock-names = "mod",
>> +				      "bus";
>> +			resets = <&de2_clocks RST_MIXER0>;
>> +			assigned-clocks = <&de2_clocks CLK_MIXER0>;
>> +			assigned-clock-rates = <150000000>;
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				mixer0_out: port@1 {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					reg = <1>;
>> +
>> +					mixer0_out_tcon0: endpoint@0 {
>> +						reg = <0>;
>> +						remote-endpoint = <&tcon0_in_mixer0>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		tcon0: lcd-controller@1c0c000 {
>> +			compatible = "allwinner,sun8i-v3s-tcon";
>> +			reg = <0x01c0c000 0x1000>;
>> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&ccu CLK_BUS_TCON0>,
>> +				 <&ccu CLK_TCON0>;
>> +			clock-names = "ahb",
>> +				      "tcon-ch0";
>> +			clock-output-names = "tcon-pixel-clock";
>> +			resets = <&ccu RST_BUS_TCON0>;
>> +			reset-names = "lcd";
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				tcon0_in: port@0 {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					reg = <0>;
>> +
>> +					tcon0_in_mixer0: endpoint@0 {
>> +						reg = <0>;
>> +						remote-endpoint = <&mixer0_out_tcon0>;
>> +					};
>> +				};
>> +
>> +				tcon0_out: port@1 {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +					reg = <1>;
>> +				};
>> +			};
>> +		};
>> +
>> +
> 
> You have an extra new line here.
> 
> Maxime
