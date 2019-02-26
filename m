From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix for oceanic
Date: Tue, 26 Feb 2019 11:32:39 +0530
Message-ID: <20190226060240.8783-1-jagan@amarulasolutions.com>
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
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index f42e12eb9d64..5b551407f487 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -285,6 +285,7 @@ nuvoton	Nuvoton Technology Corporation
 nvd	New Vision Display
 nvidia	NVIDIA
 nxp	NXP Semiconductors
+oceanic	Oceanic Systems (UK) Ltd.
 okaya	Okaya Electric America, Inc.
 oki	Oki Electric Industry Co., Ltd.
 olimex	OLIMEX Ltd.
-- 
2.18.0.321.gffc6fa0e3
