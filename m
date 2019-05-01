From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Update schema project location to devicetree.org github group
Date: Wed,  1 May 2019 13:23:32 -0500
Message-ID: <20190501182332.29094-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, maxime.ripard@bootlin.com, grant.likely@arm.com
List-Id: devicetree@vger.kernel.org

The DT schema tools are moving from my personal GH repo to the
devicetree.org group on GH. The new location is here:

https://github.com/devicetree-org/dt-schema.git

The old repo will be kept as a mirror.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/writing-schema.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/writing-schema.md b/Documentation/devicetree/writing-schema.md
index a3652d33a48f..dc032db36262 100644
--- a/Documentation/devicetree/writing-schema.md
+++ b/Documentation/devicetree/writing-schema.md
@@ -97,7 +97,7 @@ The DT schema project must be installed in order to validate the DT schema
 binding documents and validate DTS files using the DT schema. The DT schema
 project can be installed with pip:
 
-`pip3 install git+https://github.com/robherring/yaml-bindings.git@master`
+`pip3 install git+https://github.com/devicetree-org/dt-schema.git@master`
 
 dtc must also be built with YAML output support enabled. This requires that
 libyaml and its headers be installed on the host system.
-- 
2.20.1
