From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 3/6] ARM: dts: bcm2835: Fix labels for GPIO 0,1
Date: Sat, 12 Jan 2019 13:43:25 +0100
Message-ID: <1547297008-2740-4-git-send-email-stefan.wahren@i2se.com>
References: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>
Cc: Gottfried Haider <gottfried.haider@gmail.com>, devicetree@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

According to the schematics for all RPis with a 40 pin header,
the GPIOs 0 and 1 are labeled as ID_SD and ID_SC. In order to
clarify that is a I2C bus, append the third letter.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-zero.dts   | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
index 2cd9c5e..db8a601 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -31,8 +31,8 @@
 	 * "FOO" = GPIO line named "FOO" on the schematic
 	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
 	 */
-	gpio-line-names = "SDA0",
-			  "SCL0",
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
 			  "SDA1",
 			  "SCL1",
 			  "GPIO_GCLK",
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index cfbdaac..1e40d67 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -33,8 +33,8 @@
 	 * "FOO" = GPIO line named "FOO" on the schematic
 	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
 	 */
-	gpio-line-names = "SDA0",
-			  "SCL0",
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
 			  "SDA1",
 			  "SCL1",
 			  "GPIO_GCLK",
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
index 644d907..5765d34 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -40,8 +40,8 @@
 	 * "FOO" = GPIO line named "FOO" on the schematic
 	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
 	 */
-	gpio-line-names = "GPIO0",
-			  "GPIO1",
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
 			  "SDA1",
 			  "SCL1",
 			  "GPIO_GCLK",
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
index 00323ba..3b35a8a 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
@@ -28,8 +28,8 @@
 	 * "FOO" = GPIO line named "FOO" on the schematic
 	 * "FOO_N" = GPIO line named "FOO" on schematic, active low
 	 */
-	gpio-line-names = "SDA0",
-			  "SCL0",
+	gpio-line-names = "ID_SDA",
+			  "ID_SCL",
 			  "SDA1",
 			  "SCL1",
 			  "GPIO_GCLK",
-- 
2.7.4
