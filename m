From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 3/3] arm64: alpine: select EDAC_AL_MC
Date: Wed, 4 Sep 2019 16:32:23 +0300
Message-ID: <1567603943-25316-4-git-send-email-talel@amazon.com>
References: <1567603943-25316-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567603943-25316-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, talel@amazon.com, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

Amazon's Annapurna Labs SoCs supports memory error detection and
correction.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 4778c77..d2809b9 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -25,6 +25,7 @@ config ARCH_SUNXI
 config ARCH_ALPINE
 	bool "Annapurna Labs Alpine platform"
 	select ALPINE_MSI if PCI
+	select EDAC_AL_MC
 	help
 	  This enables support for the Annapurna Labs Alpine
 	  Soc family.
-- 
2.7.4
