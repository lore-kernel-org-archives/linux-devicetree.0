From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 7/7] of: Document simplified graph binding for single port devices
Date: Thu, 27 Feb 2014 18:35:40 +0100
Message-ID: <1393522540-22887-8-git-send-email-p.zabel@pengutronix.de>
References: <1393522540-22887-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393522540-22887-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

For simple devices with only one port, it can be made implicit.
The endpoint node can be a direct child of the device node.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/devicetree/bindings/graph.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentation/devicetree/bindings/graph.txt
index 554865b..6dfaff8 100644
--- a/Documentation/devicetree/bindings/graph.txt
+++ b/Documentation/devicetree/bindings/graph.txt
@@ -84,6 +84,14 @@ device {
         };
 };
 
+For devices with only a single port and a single endpoint, this can be further
+simplified by making the port implicit, and adding the endpoint node as a direct
+child of the device node.
+
+device {
+	endpoint { ... };
+};
+
 Links between endpoints
 -----------------------
 
-- 
1.8.5.3
