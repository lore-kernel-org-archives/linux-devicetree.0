From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 2/6] ARM: dts: bcm2835-rpi: Drop unnecessary
 #address-cells/#size-cells
Date: Sat, 12 Jan 2019 13:43:24 +0100
Message-ID: <1547297008-2740-3-git-send-email-stefan.wahren@i2se.com>
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

Compiling the bcm2835-rpi.dtsi with W=1 leads to the following warning:

Warning (avoid_unnecessary_addr_size): /soc/firmware: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property

Fix this by removing these unnecessary properties.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2835-rpi.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index e490f2a..715d50c 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -19,8 +19,6 @@
 	soc {
 		firmware: firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-bus";
-			#address-cells = <0>;
-			#size-cells = <0>;
 			mboxes = <&mailbox>;
 		};
 
-- 
2.7.4
