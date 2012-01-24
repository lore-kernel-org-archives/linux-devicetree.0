From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 10/18] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Tue, 24 Jan 2012 15:21:04 -0800
Message-ID: <1327447272-30182-11-git-send-email-sjg@chromium.org>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327447272-30182-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds clock references to the USB part of the device tree for U-Boot.

The USB timing information may vary between boards sometimes, but for
now we hard-code it in C. This is because all current T2x boards use
the same values, we will deal with T3x later and we first need to agree
on the format for this timing information in the fdt and may in fact
decide that it has no place there.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Add dr_mode property to control host/device/otg mode
- Add nvidia,has-legacy-mode property per review comments
- Change device tree comment style from // to /* */

 arch/arm/dts/tegra20.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index ec75747..b2e3a40 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -176,6 +176,9 @@
 		reg = <0xc5000000 0x4000>;
 		interrupts = < 52 >;
 		phy_type = "utmi";
+		clocks = <&periph_clk 22>;	/* PERIPH_ID_USBD */
+		dr_mode = "otg";
+		nvidia,has-legacy-mode;
 	};
 
 	usb@c5004000 {
@@ -183,6 +186,8 @@
 		reg = <0xc5004000 0x4000>;
 		interrupts = < 53 >;
 		phy_type = "ulpi";
+		clocks = <&periph_clk 58>;	/* PERIPH_ID_USB2 */
+		dr_mode = "host";
 	};
 
 	usb@c5008000 {
@@ -190,6 +195,8 @@
 		reg = <0xc5008000 0x4000>;
 		interrupts = < 129 >;
 		phy_type = "utmi";
+		clocks = <&periph_clk 59>;	/* PERIPH_ID_USB3 */
+		dr_mode = "otg";
 	};
 
 };
-- 
1.7.7.3
