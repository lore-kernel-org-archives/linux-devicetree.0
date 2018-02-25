From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 2/4] ARM: dts: bcm283x: Apply pull settings to Zero W relevant
 groups
Date: Sun, 25 Feb 2018 15:10:53 +0100
Message-ID: <1519567855-26105-3-git-send-email-stefan.wahren@i2se.com>
References: <1519567855-26105-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519567855-26105-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loic Poulain <loic.poulain@gmail.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis.oss@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Phil Elwell <phil@raspberrypi.org>, linux-bluetooth@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Instead of keeping the firmware's pull settings, we better apply
them via the devicetree pin control. Start with the RPi Zero W relevant
first to keep the effort low.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm283x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 8d9a0df..1a50b67 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -223,6 +223,7 @@
 			gpclk2_gpio43: gpclk2_gpio43 {
 				brcm,pins = <43>;
 				brcm,function = <BCM2835_FSEL_ALT0>;
+				brcm,pull = <BCM2835_PUD_OFF>;
 			};
 
 			i2c0_gpio0: i2c0_gpio0 {
@@ -335,10 +336,12 @@
 			uart0_ctsrts_gpio30: uart0_ctsrts_gpio30 {
 				brcm,pins = <30 31>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
+				brcm,pull = <BCM2835_PUD_UP BCM2835_PUD_OFF>;
 			};
 			uart0_gpio32: uart0_gpio32 {
 				brcm,pins = <32 33>;
 				brcm,function = <BCM2835_FSEL_ALT3>;
+				brcm,pull = <BCM2835_PUD_OFF BCM2835_PUD_UP>;
 			};
 			uart0_gpio36: uart0_gpio36 {
 				brcm,pins = <36 37>;
-- 
2.7.4
