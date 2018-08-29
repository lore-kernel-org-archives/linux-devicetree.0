From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH 1/4] clock: aspeed: Add VIDEO reset index definition
Date: Wed, 29 Aug 2018 16:09:30 -0500
Message-ID: <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, Eddie James <eajames@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Add an index into the array of resets kept in the Aspeed clock driver.
This isn't a HW bit definition.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 include/dt-bindings/clock/aspeed-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index f437386..15a9059 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -50,5 +50,6 @@
 #define ASPEED_RESET_I2C		7
 #define ASPEED_RESET_AHB		8
 #define ASPEED_RESET_CRT1		9
+#define ASPEED_RESET_VIDEO		10
 
 #endif
-- 
1.8.3.1
