From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Fix dt_binding_check target for in tree builds
Date: Tue, 22 Jan 2019 09:52:42 -0600
Message-ID: <20190122155242.2770-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On in tree builds, subsequent builds will incorrectly include
the intermediate file 'processed-schema.yaml' with the input schema
files resulting in a build error. Update the find command to ignore
processed-schema.yaml.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 6e5cef0ed6fb..50daa0b3b032 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -17,7 +17,11 @@ extra-y += $(DT_TMP_SCHEMA)
 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@ $(filter-out FORCE, $^)
 
-DT_DOCS = $(shell cd $(srctree)/$(src) && find * -name '*.yaml')
+DT_DOCS = $(shell \
+	cd $(srctree)/$(src) && \
+	find * \( -name '*.yaml' ! -name $(DT_TMP_SCHEMA) \) \
+	)
+
 DT_SCHEMA_FILES ?= $(addprefix $(src)/,$(DT_DOCS))
 
 extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-- 
2.19.1
