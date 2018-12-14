From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH v2 00/15] ARM: sunxi: Enable Broadcom-based Bluetooth
 controllers
Date: Fri, 14 Dec 2018 13:42:08 +0100
Message-ID: <20181214124208.e72glckgcgbfyc4f@core.my.home>
References: <20181115093603.26729-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181115093603.26729-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Loic Poulain <loic.poulain@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 05:35:48PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v2 of my Broadcom-based Bluetooth controllers on Allwinner SoC-
> based SBCs series.
> 
> Changes since v1:
> 
>   - Collected tags
>   - Re-organize dt binding clocks and clock-names properties
>   - Simplify check for deferred probe when getting clocks
>   - Add explanation of Cubietruck's clk_out_a pinmux setting placement
>     to commit message.
>   - Add missing "uart-has-rtscts" property to Cubietruck device tree
>
> [snip]

Hello,

I've tested your patch series on TBS A711 / BCM20702A1 with the following DTS:


 /* There's the BT part of the AP6210 connected to that UART */
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm20702a1";
+		clocks = <&ac100_rtc 1>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_vbat>;
+		vddio-supply = <&reg_dldo1>;
+		device-wakeup-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+		host-wakeup-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* PL5 */
+		shutdown-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+		max-speed = <1500000>;
+	};
 };


And it works. :)

Tested-by: Ondrej Jirman <megous@megous.com>


Thank you and regards,
  o.
