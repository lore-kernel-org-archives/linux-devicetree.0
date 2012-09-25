From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [RFC PATCH 2/3] ARM: use cmd_dtc_cpp for compilation of *.dts-cpp to
 *.dtb
Date: Tue, 25 Sep 2012 13:06:37 -0600
Message-ID: <1348599998-2729-3-git-send-email-swarren@wwwdotorg.org>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348599998-2729-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This allows DT source files to use the C pre-processor. A new file
extension is introduced for this purpose, since use of the pre-processor
must be optional; any property or node name that starts with "#" must be
escaped to prevent the pre-processor attempting to interpret it as a
directive. For this reason, skeleton.dtsi-cpp is introduced for *.dts-cpp
to include.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/Makefile              |    3 +++
 arch/arm/boot/dts/skeleton.dtsi-cpp |   13 +++++++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/skeleton.dtsi-cpp

diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index 3fdab01..c5d7fca 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -65,6 +65,9 @@ targets += $(dtb-y)
 $(obj)/%.dtb: $(src)/dts/%.dts FORCE
 	$(call if_changed_dep,dtc)
 
+$(obj)/%.dtb: $(src)/dts/%.dts-cpp FORCE
+	$(call if_changed_dep,dtc_cpp)
+
 $(obj)/dtbs: $(addprefix $(obj)/, $(dtb-y))
 
 clean-files := *.dtb
diff --git a/arch/arm/boot/dts/skeleton.dtsi-cpp b/arch/arm/boot/dts/skeleton.dtsi-cpp
new file mode 100644
index 0000000..8bf6729
--- /dev/null
+++ b/arch/arm/boot/dts/skeleton.dtsi-cpp
@@ -0,0 +1,13 @@
+/*
+ * Skeleton device tree; the bare minimum needed to boot; just include and
+ * add a compatible value.  The bootloader will typically populate the memory
+ * node.
+ */
+
+/ {
+	\#address-cells = <1>;
+	\#size-cells = <1>;
+	chosen { };
+	aliases { };
+	memory { device_type = "memory"; reg = <0 0>; };
+};
-- 
1.7.0.4
