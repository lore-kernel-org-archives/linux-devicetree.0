From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [PATCH 2/3] ARM: dts: sun7i: Add RGB666 pins definition
Date: Thu, 12 Apr 2018 00:22:09 +0200
Message-ID: <e7f68882-c333-12ac-c122-20b0d7b65666@micronovasrl.com>
References: <20180410213129.24049-1-contact@paulk.fr>
 <20180410213129.24049-2-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180410213129.24049-2-contact@paulk.fr>
Content-Language: it
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <contact@paulk.fr>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

Il 10/04/2018 23:31, Paul Kocialkowski ha scritto:
> This adds the pins definition for RGB666 LCD panels on the A20. It was
> imported from the A33 definition, that concernes the same set of pins.
> 
> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> ---
>   arch/arm/boot/dts/sun7i-a20.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index e529e4ff2174..f46af8675cfa 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -781,6 +781,14 @@
>   				function = "ir1";
>   			};
>   
> +			lcd_rgb666_pins: lcd_rgb666@0 {

I point you to this Thread and back:
https://lists.freedesktop.org/archives/dri-devel/2018-March/170688.html

I did the same for rgb888, so good part is discussed.

IMHO I would:
- call lcd0_rgb666_pins, since this is for LCD0 interface
- same as above, call lcd0-rgb666, take care about using "-" instad of 
"_" that can cause DTC warnings.
- remove @0 since only this set can achieve LCD0 RGB666, and I
   don't think there will be other combinations.

Kind regards

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale € 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642


> +				pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> +				       "PD10", "PD11", "PD12", "PD13", "PD14", "PD15",
> +				       "PD18", "PD19", "PD20", "PD21", "PD22", "PD23",
> +				       "PD24", "PD25", "PD26", "PD27";
> +				function = "lcd0";
> +			};
> +
>   			mmc0_pins_a: mmc0@0 {
>   				pins = "PF0", "PF1", "PF2",
>   				       "PF3", "PF4", "PF5";
> 
