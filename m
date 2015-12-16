From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 7/8] ARM: bcm2835: Add a compat string for bcm2836 machine probe
Date: Wed, 16 Dec 2015 15:55:14 -0800
Message-ID: <1450310115-22163-8-git-send-email-eric@anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450310115-22163-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

Supporting the 2836 requires using the new interrupt controller, which
we have support for.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/mach-bcm/board_bcm2835.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-bcm/board_bcm2835.c b/arch/arm/mach-bcm/board_bcm2835.c
index 0f7b9ea..834d676 100644
--- a/arch/arm/mach-bcm/board_bcm2835.c
+++ b/arch/arm/mach-bcm/board_bcm2835.c
@@ -36,7 +36,12 @@ static void __init bcm2835_init(void)
 }
 
 static const char * const bcm2835_compat[] = {
+#ifdef CONFIG_ARCH_MULTI_V6
 	"brcm,bcm2835",
+#endif
+#ifdef CONFIG_ARCH_MULTI_V7
+	"brcm,bcm2836",
+#endif
 	NULL
 };
 
-- 
2.6.2
