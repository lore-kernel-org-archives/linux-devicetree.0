From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2] dt-bindings: Check the examples against the schemas
Date: Thu, 13 Jun 2019 08:42:10 -0600
Message-ID: <20190613144210.22181-2-robh@kernel.org>
References: <20190613144210.22181-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613144210.22181-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

Currently, the binding examples are just built with dtc. dtc recently
gained the support necessary to output the examples in YAML format
(commit 87963ee20693 ("livetree: add missing type markers in generated
overlay properties"). Now just switch the output format and the examples
will be checked against the schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 8a2774b5834b..6b0dfd5c17ba 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -25,7 +25,7 @@ DT_DOCS = $(shell \
 DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
 
 extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-y += $(patsubst $(src)/%.yaml,%.example.dtb, $(DT_SCHEMA_FILES))
+extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 
 $(obj)/$(DT_TMP_SCHEMA): $(DT_SCHEMA_FILES) FORCE
 	$(call if_changed,mk_schema)
-- 
2.20.1
