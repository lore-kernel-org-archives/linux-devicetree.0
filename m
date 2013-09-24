From: Benoit Cousson <bcousson@baylibre.com>
Subject: [RFC 14/15] scripts/dtc: validate dts against schema bindings
Date: Tue, 24 Sep 2013 18:52:20 +0200
Message-ID: <1380041541-17529-15-git-send-email-bcousson@baylibre.com>
References: <1380041541-17529-1-git-send-email-bcousson@baylibre.com>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1380041541-17529-1-git-send-email-bcousson@baylibre.com>
Sender: linux-omap-owner@vger.kernel.org
To: olof@lixom.net, devicetree@vger.kernel.org, tomasz.figa@gmail.com, swarren@wwwdotorg.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: khilman@linaro.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fparent@baylibre.com, Benoit Cousson <bcousson@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Fabien Parent <fparent@baylibre.com>

Add the path of the bindings schema directory on the command line used
for compiling the dts files. The dts files will be validated against all the
matching schemas found.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Benoit Cousson <bcousson@baylibre.com>
---
 scripts/Makefile.lib | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 49392ec..358dd69 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -264,6 +264,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
+		-M $(objtree)/bindings \
 		-i $(dir $<) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
-- 
1.8.1.2

