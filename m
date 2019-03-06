From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 1/2] dt-bindings: Add vendor prefix for oceanic
Date: Wed,  6 Mar 2019 22:31:09 +0530
Message-ID: <20190306170110.27342-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Pannell <ryan@osukl.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add oceanic vendor prefix.

Oceanic Systems (UK) Ltd design and manufacture world-class marine
systems for control and monitoring vessels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index bb6f6e8a2eee..e32d460408dc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -287,6 +287,7 @@ nuvoton	Nuvoton Technology Corporation
 nvd	New Vision Display
 nvidia	NVIDIA
 nxp	NXP Semiconductors
+oceanic	Oceanic Systems (UK) Ltd.
 okaya	Okaya Electric America, Inc.
 oki	Oki Electric Industry Co., Ltd.
 olimex	OLIMEX Ltd.
-- 
2.18.0.321.gffc6fa0e3
