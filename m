From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 3/4] ARM: dts: bcm2835-rpi-zero: Enable OTG mode
Date: Sun, 21 May 2017 18:44:38 +0200
Message-ID: <1495385079-3697-4-git-send-email-stefan.wahren@i2se.com>
References: <1495385079-3697-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495385079-3697-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Phil Elwell <phil@raspberrypi.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Since 635c21068cf ("usb: dwc2: gadget: Fix WARN_ON messages
during FIFO init") the dwc2 driver is able to handle OTG and gadget
mode for bcm2835. So enable this feature for the Raspberry Pi Zero.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi-zero.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
index cc8b832..79a20d5 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
@@ -12,7 +12,7 @@
 /dts-v1/;
 #include "bcm2835.dtsi"
 #include "bcm2835-rpi.dtsi"
-#include "bcm283x-rpi-usb-host.dtsi"
+#include "bcm283x-rpi-usb-otg.dtsi"
 
 / {
 	compatible = "raspberrypi,model-zero", "brcm,bcm2835";
-- 
2.7.4
