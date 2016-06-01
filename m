From: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 09/32] bcm2837-rpi-3-b.dts for 32bit arm
Date: Wed,  1 Jun 2016 23:43:18 +0200
Message-ID: <1464817421-8519-10-git-send-email-kraxel@redhat.com>
References: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464817421-8519-1-git-send-email-kraxel@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-rpi-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Kumar Gala <galak@codeaurora.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

---
 arch/arm/boot/dts/Makefile            | 3 ++-
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-3-b.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 06b6c2d..16de98f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -66,7 +66,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b-rev2.dtb \
 	bcm2835-rpi-b-plus.dtb \
 	bcm2835-rpi-a-plus.dtb \
-	bcm2836-rpi-2-b.dtb
+	bcm2836-rpi-2-b.dtb \
+	bcm2837-rpi-3-b.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
new file mode 100644
index 0000000..36178a6
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -0,0 +1 @@
+#include "../../../arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts"
-- 
1.8.3.1
