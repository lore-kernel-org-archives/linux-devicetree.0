From: Constantine Shulyupin <const@MakeLinux.com>
Subject: [PATCH v1 RESEND] of: Add vendor prefix for Nuvoton
Date: Thu,  6 Aug 2015 01:20:56 +0300
Message-ID: <1438813259-32745-1-git-send-email-const@MakeLinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Antony Pavlov <antonynpavlov@gmail.com>, Hayato Suzuki <hytszk@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Constantine Shulyupin <const@MakeLinux.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 181b53e..449805a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -149,6 +149,7 @@ netxeon		Shenzhen Netxeon Technology CO., LTD
 newhaven	Newhaven Display International
 nintendo	Nintendo
 nokia	Nokia
+nuvoton	Nuvoton Technology Corporation
 nvidia	NVIDIA
 nxp	NXP Semiconductors
 onnn	ON Semiconductor Corp.
-- 
1.9.1
