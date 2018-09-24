From: Liviu Dudau <liviu@dudau.co.uk>
Subject: [PATCH] arm64: dts: broadcom: Use the .dtb name in the rule,
 rather than .dts
Date: Mon, 24 Sep 2018 11:22:28 +0100
Message-ID: <20180924102228.19656-1-liviu@dudau.co.uk>
References: <b42d2e57-8bcd-0d6a-7a4d-aeefedcdd5f3@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b42d2e57-8bcd-0d6a-7a4d-aeefedcdd5f3@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Commit a7eb26392b893 ("arm64: dts: broadcom: Add reference to Compute
Module IO Board V3") adds the bcm2837-rpi-cm3-io3.dts file as a target
in the Makefile, rather than the .dtb name. This will skip the
generation of the .dtb file at compile time and will fail the dtbs_install
target.

Fixes: a7eb26392b893 ("arm64: dts: broadcom: Add reference to Compute
Module IO Board V3")

Signed-off-by: Liviu Dudau <liviu@dudau.co.uk>
---
 arch/arm64/boot/dts/broadcom/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 3d98f5f5ab88..667ca989c11b 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_BCM2835) += bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
-			      bcm2837-rpi-cm3-io3.dts
+			      bcm2837-rpi-cm3-io3.dtb
 
 subdir-y	+= northstar2
 subdir-y	+= stingray
-- 
2.18.0
