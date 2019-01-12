From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 5/6] ARM: dts: bcm2837-rpi-3-b-plus: Clarify label for
 STATUS_LED
Date: Sat, 12 Jan 2019 13:43:27 +0100
Message-ID: <1547297008-2740-6-git-send-email-stefan.wahren@i2se.com>
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

The RPI 3 B+ provides control to both LEDs (PWR and ACT). So append
the first letter of the LED color (like in the schematics) in order
to clarify this.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
index 7d65013..d3ec6cd 100644
--- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
@@ -42,7 +42,7 @@
 		#gpio-cells = <2>;
 		gpio-line-names = "BT_ON",
 				  "WL_ON",
-				  "STATUS_LED",
+				  "STATUS_LED_R",
 				  "LAN_RUN",
 				  "",
 				  "CAM_GPIO0",
-- 
2.7.4
