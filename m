Return-Path: <dinguyen@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 2/2] arm64: defconfig: include the Agilex platform to the arm64 defconfig
Date: Fri,  5 Apr 2019 10:50:39 -0500
Message-Id: <20190405155039.8957-2-dinguyen@kernel.org>
In-Reply-To: <20190405155039.8957-1-dinguyen@kernel.org>
References: <20190405155039.8957-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: devicetree@vger.kernel.org
Cc: dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com
List-ID: <devicetree@vger.kernel.org>

Build the Agilex platform in the standard arm64 defconfig.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2d9c39033c1a..1864a94f106c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -29,6 +29,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
+CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_BCM2835=y
-- 
2.20.0
