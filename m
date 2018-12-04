From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 3/3] arm64: dts: broadcom: Add reference to RPi 3 A+
Date: Tue,  4 Dec 2018 19:58:19 +0100
Message-ID: <1543949899-13380-4-git-send-email-stefan.wahren@i2se.com>
References: <1543949899-13380-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1543949899-13380-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds a reference to the dts of the Raspberry Pi 3 A+,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 arch/arm64/boot/dts/broadcom/Makefile                 | 3 ++-
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 667ca98..d1d31cc 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_BCM2835) += bcm2837-rpi-3-b.dtb \
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2837-rpi-3-a-plus.dtb \
+			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
new file mode 100644
index 0000000..f0ec56a
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "arm/bcm2837-rpi-3-a-plus.dts"
-- 
2.7.4
