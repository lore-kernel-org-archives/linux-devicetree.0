From: David Lechner <david@lechnology.com>
Subject: [PATCH v6 29/41] ARM: davinci_all_defconfig: remove CONFIG_DAVINCI_RESET_CLOCKS
Date: Sat, 20 Jan 2018 11:14:08 -0600
Message-ID: <1516468460-4908-30-git-send-email-david@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1516468460-4908-1-git-send-email-david@lechnology.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>
List-Id: devicetree@vger.kernel.org

This removes CONFIG_DAVINCI_RESET_CLOCKS. The option has been removed from
the kernel.

Signed-off-by: David Lechner <david@lechnology.com>
---

v6 changes:
- none

 arch/arm/configs/davinci_all_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 026154c..94d8946 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -31,7 +31,6 @@ CONFIG_MACH_MITYOMAPL138=y
 CONFIG_MACH_OMAPL138_HAWKBOARD=y
 CONFIG_DAVINCI_MUX_DEBUG=y
 CONFIG_DAVINCI_MUX_WARNINGS=y
-CONFIG_DAVINCI_RESET_CLOCKS=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 CONFIG_CMA=y
-- 
2.7.4

