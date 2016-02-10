From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 1/6] arm64: Select COMMON_CLK_IPROC,
 PINCTRL and GPIOLIB for iProc SoCs
Date: Wed, 10 Feb 2016 11:40:46 +0530
Message-ID: <1455084651-29325-2-git-send-email-anup.patel@broadcom.com>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ray Jui <rjui@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Kumar Gala <galak@codeaurora.org>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We select COMMON_CLK_IPROC, PINCTRL, and GPIOLIB in arm64 Kconfig
for ARCH_BCM_IPROC so that we can use COMMON_CLK, PINCTRL and GPIOLIB
with iProc SoC drivers.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Signed-off-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>
---
 arch/arm64/Kconfig.platforms | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 21074f6..e20b50c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -2,6 +2,9 @@ menu "Platform selection"
 
 config ARCH_BCM_IPROC
 	bool "Broadcom iProc SoC Family"
+	select COMMON_CLK_IPROC
+	select PINCTRL
+	select ARCH_REQUIRE_GPIOLIB
 	help
 	  This enables support for Broadcom iProc based SoCs
 
-- 
1.9.1
