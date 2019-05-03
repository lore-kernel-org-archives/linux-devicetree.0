From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v3 10/10] powerpc: tsi108: support of_get_mac_address new ERR_PTR error
Date: Fri,  3 May 2019 09:56:07 +0200
Message-ID: <1556870168-26864-11-git-send-email-ynezz@true.cz>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556870168-26864-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There was NVMEM support added to of_get_mac_address, so it could now
return NULL and ERR_PTR encoded error values, so we need to adjust all
current users of of_get_mac_address to this new fact.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 arch/powerpc/sysdev/tsi108_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/tsi108_dev.c b/arch/powerpc/sysdev/tsi108_dev.c
index 1f1af12..2e54405 100644
--- a/arch/powerpc/sysdev/tsi108_dev.c
+++ b/arch/powerpc/sysdev/tsi108_dev.c
@@ -105,7 +105,7 @@ static int __init tsi108_eth_of_init(void)
 		}
 
 		mac_addr = of_get_mac_address(np);
-		if (mac_addr)
+		if (!IS_ERR_OR_NULL(mac_addr))
 			memcpy(tsi_eth_data.mac_addr, mac_addr, 6);
 
 		ph = of_get_property(np, "mdio-handle", NULL);
-- 
1.9.1
