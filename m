From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] of_net: fix of_get_mac_address retval if compiled without CONFIG_OF
Date: Sun, 19 May 2019 14:18:44 +0200
Message-ID: <1558268324-5596-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

of_get_mac_address prior to commit d01f449c008a ("of_net: add NVMEM
support to of_get_mac_address") could return only valid pointer or NULL,
after this change it could return only valid pointer or ERR_PTR encoded
error value, but I've forget to change the return value of
of_get_mac_address in case where the kernel is compiled without
CONFIG_OF, so I'm doing so now.

Cc: Mirko Lindner <mlindner@marvell.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
Reported-by: Octavio Alvarez <octallk1@alvarezp.org>
Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 include/linux/of_net.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_net.h b/include/linux/of_net.h
index 9cd72aab76fe..0f0346e6829c 100644
--- a/include/linux/of_net.h
+++ b/include/linux/of_net.h
@@ -22,7 +22,7 @@ static inline int of_get_phy_mode(struct device_node *np)
 
 static inline const void *of_get_mac_address(struct device_node *np)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct net_device *of_find_net_device_by_node(struct device_node *np)
-- 
1.9.1
