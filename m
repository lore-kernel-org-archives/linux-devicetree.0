From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 2/9] ARM: dts: bcm2837: Add missing GPIOs of Expander
Date: Sat, 21 Apr 2018 13:28:35 +0200
Message-ID: <1524310122-9439-3-git-send-email-stefan.wahren@i2se.com>
References: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524310122-9439-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

After commit a98d90e7d588 ("gpio: raspberrypi-exp: Driver for RPi3 GPIO
expander via mailbox service") we are able to control the rest of the
GPIOs of the RPi 3. So add all the missing parts (ACT LED,
Wifi & BT control, HDMI detect) to the DT.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
index cc39b6f..c318bcb 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -20,9 +20,14 @@
 
 	leds {
 		act {
-			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
+			gpios = <&expgpio 2 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&expgpio 1 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &firmware {
@@ -48,6 +53,10 @@
 	status = "okay";
 };
 
+&hdmi {
+	hpd-gpios = <&expgpio 4 GPIO_ACTIVE_LOW>;
+};
+
 /* uart0 communicates with the BT module */
 &uart0 {
 	pinctrl-names = "default";
@@ -57,6 +66,7 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		max-speed = <2000000>;
+		shutdown-gpios = <&expgpio 0 GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -69,11 +79,19 @@
 
 /* SDHCI is used to control the SDIO for wireless */
 &sdhci {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&emmc_gpio34>;
 	status = "okay";
 	bus-width = <4>;
 	non-removable;
+	mmc-pwrseq = <&wifi_pwrseq>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
 };
 
 /* SDHOST is used to drive the SD card */
-- 
2.7.4
