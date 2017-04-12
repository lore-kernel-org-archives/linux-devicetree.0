From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 3/3] of: Make of_match_node() an inline stub for CONFIG_OF=n
Date: Tue, 11 Apr 2017 21:41:56 -0700
Message-ID: <20170412044156.17351-4-f.fainelli@gmail.com>
References: <20170412044156.17351-1-f.fainelli@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20170412044156.17351-1-f.fainelli@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, Florian Fainelli <f.fainelli@gmail.com>, Lee Jones <lee.jones@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Make of_match_node() an inline function when CONFIG_OF=n which allows the
compiler to eliminate warnings about unused variables.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 include/linux/of.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 21e6323de0f3..2803a85e81ec 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -839,7 +839,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 #define of_match_ptr(_ptr)	NULL
-#define of_match_node(_matches, _node)	NULL
+static inline const struct of_device_id *of_match_node(
+	const struct of_device_id *matches, const struct device_node *node)
+{
+	return NULL;
+}
 #endif /* CONFIG_OF */
 
 /* Default string compare functions, Allow arch asm/prom.h to override */
-- 
2.9.3
