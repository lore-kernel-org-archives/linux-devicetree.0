From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 03/16] tegra: fdt: Add pwm binding and node
Date: Mon,  8 Oct 2012 14:42:23 -0700
Message-ID: <1349732556-30700-4-git-send-email-sjg@chromium.org>
References: <1349732556-30700-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1349732556-30700-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding will apparently soon be in linux-next. Bring it in now
since we need to do something, and may as well try to target what
Linux will have.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Update Tegra PWM binding s/duty cycle/period/

Changes in v3:
- Add new commit for pwm binding and node

 arch/arm/dts/tegra20.dtsi                    |    7 +++++++
 doc/device-tree-bindings/pwm/tegra20-pwm.txt |   18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/pwm/tegra20-pwm.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index d936b1e..3221bc9 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -211,4 +211,11 @@
 		compatible = "nvidia,tegra20-nand";
 		reg = <0x70008000 0x100>;
 	};
+
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
+
 };
diff --git a/doc/device-tree-bindings/pwm/tegra20-pwm.txt b/doc/device-tree-bindings/pwm/tegra20-pwm.txt
new file mode 100644
index 0000000..01438ec
--- /dev/null
+++ b/doc/device-tree-bindings/pwm/tegra20-pwm.txt
@@ -0,0 +1,18 @@
+Tegra SoC PWFM controller
+
+Required properties:
+- compatible: should be one of:
+  - "nvidia,tegra20-pwm"
+  - "nvidia,tegra30-pwm"
+- reg: physical base address and length of the controller's registers
+- #pwm-cells: On Tegra the number of cells used to specify a PWM is 2. The
+  first cell specifies the per-chip index of the PWM to use and the second
+  cell is the period in nanoseconds.
+
+Example:
+
+	pwm: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwm";
+		reg = <0x7000a000 0x100>;
+		#pwm-cells = <2>;
+	};
-- 
1.7.7.3
