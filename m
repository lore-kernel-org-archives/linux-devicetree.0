From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 1/4] dt-bindings: Add vendor prefix for novatek
Date: Thu, 21 Mar 2019 19:29:52 +0530
Message-ID: <20190321135955.25661-2-jagan@amarulasolutions.com>
References: <20190321135955.25661-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321135955.25661-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, Ryan Pannell <ryan@osukl.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for novatek.

Novatek Microelectronics Corp. is a leading fabless chip design
company specializing in the design, development and sales of a
wide range of display driver ICs & SoC solutions.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index e32d460408dc..caa7dbae750b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -281,6 +281,7 @@ nintendo	Nintendo
 nlt	NLT Technologies, Ltd.
 nokia	Nokia
 nordic	Nordic Semiconductor
+novatek	Novatek Microelectronics Corp.
 novtech NovTech, Inc.
 nutsboard	NutsBoard
 nuvoton	Nuvoton Technology Corporation
-- 
2.18.0.321.gffc6fa0e3
