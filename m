From: Felipe Balbi <balbi@ti.com>
Subject: [PATCH] arm: boot: dts: build keystone devicetree blob
Date: Wed, 12 Mar 2014 10:48:50 -0500
Message-ID: <1394639330-1288-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux@arm.linux.org.uk, devicetree@vger.kernel.org, Linux ARM Kernel Mailing List <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Felipe Balbi <balbi@ti.com>
List-Id: devicetree@vger.kernel.org

Currently, even when building keystone only
kernel builds, DTB won't get build because
we lack a Makefile rule to get it compiled.

This patch adds that rule so mainline kernel
users have a chance to use up-to-date DTB on
keystone 2 platforms.

Signed-off-by: Felipe Balbi <balbi@ti.com>
---

note that I just tried this on top of linux-next
(commit 69d5cdda16b3c9767b82d80b07edb9bb056448e3)
and, even though dtb builds fine, I still couldn't
get keystone_defconfig uImage to boot fine.

It's probably my LOADADDR which is wrong.

Santosh, what's the LOADADDR I should be using
for keystone boots ?

 arch/arm/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ae208a6..52c5231 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -82,6 +82,7 @@ dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb \
 	ecx-2000.dtb
 dtb-$(CONFIG_ARCH_INTEGRATOR) += integratorap.dtb \
 	integratorcp.dtb
+dtb-$(CONFIG_ARCH_KEYSTONE) += k2hk-evm.dtb
 kirkwood := \
 	kirkwood-b3.dtb \
 	kirkwood-cloudbox.dtb \
-- 
1.9.0.167.g384364b
