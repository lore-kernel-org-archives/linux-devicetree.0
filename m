From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 10/20] x86: fdt: Create basic .dtsi file for coreboot
Date: Sat,  3 Nov 2012 14:41:32 -0700
Message-ID: <1351978902-23719-11-git-send-email-sjg@chromium.org>
References: <1351978902-23719-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351978902-23719-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Stefan Reinauer <reinauer-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Graeme Russ <graeme.russ-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This contains just the minimum information for a coreboot-based board.

Signed-off-by: Stefan Reinauer <reinauer-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/x86/dts/coreboot.dtsi |   16 ++++++++++++++++
 arch/x86/dts/skeleton.dtsi |   13 +++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 arch/x86/dts/coreboot.dtsi
 create mode 100644 arch/x86/dts/skeleton.dtsi

diff --git a/arch/x86/dts/coreboot.dtsi b/arch/x86/dts/coreboot.dtsi
new file mode 100644
index 0000000..4862a59
--- /dev/null
+++ b/arch/x86/dts/coreboot.dtsi
@@ -0,0 +1,16 @@
+/include/ "skeleton.dtsi"
+
+/ {
+	aliases {
+		console = "/serial";
+	};
+
+	serial {
+		compatible = "ns16550";
+		reg-shift = <1>;
+		io-mapped = <1>;
+		multiplier = <1>;
+		baudrate = <115200>;
+		status = "disabled";
+	};
+};
diff --git a/arch/x86/dts/skeleton.dtsi b/arch/x86/dts/skeleton.dtsi
new file mode 100644
index 0000000..b41d241
--- /dev/null
+++ b/arch/x86/dts/skeleton.dtsi
@@ -0,0 +1,13 @@
+/*
+ * Skeleton device tree; the bare minimum needed to boot; just include and
+ * add a compatible value.  The bootloader will typically populate the memory
+ * node.
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	chosen { };
+	aliases { };
+	memory { device_type = "memory"; reg = <0 0>; };
+};
-- 
1.7.7.3
