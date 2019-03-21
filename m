From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 2/4] dt-bindings: Add vendor prefix for microtech
Date: Thu, 21 Mar 2019 19:29:53 +0530
Message-ID: <20190321135955.25661-3-jagan@amarulasolutions.com>
References: <20190321135955.25661-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321135955.25661-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, Ryan Pannell <ryan@osukl.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for microtech, known as
Microtech Technology Company Limited. a known producer for
Liquid Crytal Display modules and Touch Panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index caa7dbae750b..9e0b83e61414 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -249,6 +249,7 @@ micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
 microcrystal	Micro Crystal AG
 micron	Micron Technology Inc.
+microtech	Microtech Technology Company Limited
 mikroe		MikroElektronika d.o.o.
 minix	MINIX Technology Ltd.
 miramems	MiraMEMS Sensing Technology Co., Ltd.
-- 
2.18.0.321.gffc6fa0e3
