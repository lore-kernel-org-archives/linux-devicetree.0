From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v2 1/2] Doc: devicetree: bindings: Add vendor prefix entry - lwn
Date: Tue,  3 Jan 2017 00:43:37 +0100
Message-ID: <1483400618-16845-1-git-send-email-lukma@denx.de>
References: <1482794396-16153-1-git-send-email-l.majewski@majess.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482794396-16153-1-git-send-email-l.majewski@majess.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, "Zerlauth Karl (LWN)" <Karl.Zerlauth@liebherr.com>, Lukasz Majewski <l.majewski@majess.pl>, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

This patch adds entry for LWN - the Liebherr-Werk Nenzing GmbH company to
vendor-prefixes.txt file.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
Changes for v2:
- New patch

---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f0a48ea..dd8b2eb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -158,6 +158,7 @@ lg	LG Corporation
 linux	Linux-specific binding
 lltc	Linear Technology Corporation
 lsi	LSI Corp. (LSI Logic)
+lwn	Liebherr-Werk Nenzing GmbH
 marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
 meas	Measurement Specialties
-- 
2.1.4
