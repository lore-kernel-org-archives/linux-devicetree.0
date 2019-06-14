From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: truly: Add MSM8998 MTP panel
Date: Fri, 14 Jun 2019 12:02:20 -0700
Message-ID: <20190614190220.34568-1-jeffrey.l.hugo@gmail.com>
References: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, sam@ravnborg.org
Cc: bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The MSM8998 MTP uses the Truly display driver for its panel, but the
configuration differs slightly from the existing SDM845.  Add a compatible
to account for the differences.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../devicetree/bindings/display/truly,nt35597.txt          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/truly,nt35597.txt b/Documentation/devicetree/bindings/display/truly,nt35597.txt
index f39c77ee36ea..fda36c1ad3c3 100644
--- a/Documentation/devicetree/bindings/display/truly,nt35597.txt
+++ b/Documentation/devicetree/bindings/display/truly,nt35597.txt
@@ -1,10 +1,11 @@
 Truly model NT35597 DSI display driver
 
-The Truly NT35597 is a generic display driver, currently only configured
-for use in the 2K display on the Qualcomm SDM845 MTP board.
+The Truly NT35597 is a generic display driver used for the Qualcomm reference
+platforms.
 
 Required properties:
-- compatible: should be "truly,nt35597-2K-display"
+- compatible: should be "truly,nt35597-2K-display" (SDM845)
+	      "truly,nt35597-wqhd-cmd-dsc-display" (MSM8998)
 - vdda-supply: phandle of the regulator that provides the supply voltage
   Power IC supply
 - vdispp-supply: phandle of the regulator that provides the supply voltage
-- 
2.17.1
