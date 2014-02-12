From: Laura Abbott <lauraa@codeaurora.org>
Subject: [RFC/PATCH 2/3] arm: Add ARCH_WANT_OF_RANDOMNESS
Date: Tue, 11 Feb 2014 17:33:24 -0800
Message-ID: <1392168805-14200-3-git-send-email-lauraa@codeaurora.org>
References: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1392168805-14200-1-git-send-email-lauraa@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Laura Abbott <lauraa@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

The stack canary for ARM is currently the same across reboots
due to lack of randomness early enough. Add ARCH_WANT_OF_RANDOMNESS
to allow devices to add whatever randomness they need.

Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
---
 arch/arm/Kconfig              |    3 +++
 arch/arm/kernel/vmlinux.lds.S |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e254198..7ab0db1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -222,6 +222,9 @@ config NEED_RET_TO_USER
 config ARCH_MTD_XIP
 	bool
 
+config ARCH_WANT_OF_RANDOMNESS
+	def_bool n
+
 config VECTORS_BASE
 	hex
 	default 0xffff0000 if MMU || CPU_HIGH_VECTOR
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index 7bcee5c..2198258 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -202,6 +202,7 @@ SECTIONS
 		INIT_SETUP(16)
 		INIT_CALLS
 		CON_INITCALL
+		EARLY_RANDOM_FUNCS
 		SECURITY_INITCALL
 		INIT_RAM_FS
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
