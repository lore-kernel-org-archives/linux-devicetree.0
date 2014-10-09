From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH V4 7/7] ARM: multi_v7_defconfig: Enable ARCH_BCM_CYGNUS config
Date: Thu, 9 Oct 2014 15:44:31 -0700
Message-ID: <1412894671-5921-8-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
 <1412894671-5921-1-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412894671-5921-1-git-send-email-sbranden@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Russell King <linux@arm.linux.org.uk>, bcm-kernel-feedback-list@broadcom.com, Mike Turquette <mturquette@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Antti Palosaari <crope@iki.fi>
Cc: JD Zheng <jdzheng@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Enabled Broadcom Cygnus SoC family in multi_v7_defconfig by using
CONFIG_ARCH_BCM_CYGNUS=y.

Signed-off-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/configs/multi_v7_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 5fb95fb..d02f56d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -17,6 +17,7 @@ CONFIG_MACH_ARMADA_38X=y
 CONFIG_MACH_ARMADA_XP=y
 CONFIG_MACH_DOVE=y
 CONFIG_ARCH_BCM=y
+CONFIG_ARCH_BCM_CYGNUS=y
 CONFIG_ARCH_BCM_MOBILE=y
 CONFIG_ARCH_BCM_5301X=y
 CONFIG_ARCH_BRCMSTB=y
-- 
1.7.9.5
