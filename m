From: afzal mohammed <afzal.mohd.ma@gmail.com>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I
 laptop
Date: Mon, 19 Mar 2018 12:47:23 +0530
Message-ID: <20180319071723.GA854@afzalpc>
References: <20180315162510.11669-1-harald@ccbib.org>
 <20180315162510.11669-6-harald@ccbib.org>
 <20180318202251.5gpv6sblfr4edxmj@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180318202251.5gpv6sblfr4edxmj@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Harald Geyer <harald@ccbib.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Sun, Mar 18, 2018 at 09:22:51PM +0100, Maxime Ripard wrote:
> The first part is supposed to be the name of the boards. I did sed
> s/leds/teres-i/, and applied, together with all the patches but the
> PWM (so I had to drop the backlight node as well).
> 
> Please coordinate with Andre about who should send the PWM support.

Assuming that these patches were applied to your sunxi/dt64-for-4.17
branch, since PWM support patch is missing, there is a build error,

arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts:129.1-5 Label or path pwm not found

Diff at the end cures it.

(there is another H6 pine 64 DT build error related to header file
missing)

afzal


--->8---
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index b3c7ef6b6fe5..d9baab3dc96b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -126,12 +126,6 @@
        status = "okay";
 };
 
-&pwm {
-       pinctrl-names = "default";
-       pinctrl-0 = <&pwm_pin>;
-       status = "okay";
-};
-
 &ohci1 {
        status = "okay";
 };
