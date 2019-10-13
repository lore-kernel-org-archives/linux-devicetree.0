From: Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue
Date: Sun, 13 Oct 2019 12:53:23 +0200
Message-ID: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pavel Machek <pavel@ucw.cz>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
List-Id: devicetree@vger.kernel.org

bcm2835-rpi.dtsi defines the behavior of the ACT LED, which is available
on all Raspberry Pi boards. But there is no driver for this particual
GPIO on CM3 in mainline yet, so this node was left incomplete without
the actual GPIO definition. Since commit 025bf37725f1 ("gpio: Fix return
value mismatch of function gpiod_get_from_of_node()") this causing probe
issues of the leds-gpio driver for users of the CM3 dtsi file.

  leds-gpio: probe of leds failed with error -2

Until we have the necessary GPIO driver hide the ACT node for CM3
to avoid this.

Reported-by: Fredrik Yhlen <fredrik.yhlen@endian.se>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Fixes: a54fe8a6cf66 ("ARM: dts: add Raspberry Pi Compute Module 3 and IO board")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

Hi,

i'm not sure the behavior change in leds-gpio was intended.

Regards
Stefan

diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
index 7c3cb7e..925cb37 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
@@ -9,6 +9,14 @@
 		reg = <0 0x40000000>;
 	};

+	leds {
+		/*
+		 * Since there is no upstream GPIO driver yet,
+		 * remove the incomplete node.
+		 */
+		/delete-node/ act;
+	};
+
 	reg_3v3: fixed-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "3V3";
--
2.7.4
