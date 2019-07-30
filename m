From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Fix generated example files getting added to schemas
Date: Tue, 30 Jul 2019 08:59:35 -0600
Message-ID: <20190730145935.26248-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
List-Id: devicetree@vger.kernel.org

Commit 837158b847a4 ("dt-bindings: Check the examples against the
schemas") started generating YAML encoded DT files to validate the
examples against the schema. When running 'make dt_binding_check' in
tree after the 1st time, the generated example .dt.yaml files are
mistakenly added to the list of schema files. Exclude *.example.dt.yaml
files from the search for schema files.

Fixes: 837158b847a4 ("dt-bindings: Check the examples against the schemas")
Reported-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 6b0dfd5c17ba..5138a2f6232a 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -19,7 +19,9 @@ quiet_cmd_mk_schema = SCHEMA  $@
 
 DT_DOCS = $(shell \
 	cd $(srctree)/$(src) && \
-	find * \( -name '*.yaml' ! -name $(DT_TMP_SCHEMA) \) \
+	find * \( -name '*.yaml' ! \
+		-name $(DT_TMP_SCHEMA) ! \
+		-name '*.example.dt.yaml' \) \
 	)
 
 DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
-- 
2.20.1
