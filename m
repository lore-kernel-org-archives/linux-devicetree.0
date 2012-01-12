From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 12/20] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Wed, 11 Jan 2012 20:33:01 -0800
Message-ID: <1326342789-5781-13-git-send-email-sjg@chromium.org>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326342789-5781-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds clock references to the USB part of the device tree for U-Boot.

The USB timing information may vary between boards sometimes, but for
now we hard-code it in C. This is because all current T2x boards use
the same values, we will deal with T3x later and we first need to agree
on the format for this timing information in the fdt and may in fact
decide that it has no place there.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/dts/tegra20.dtsi |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 68eae12..ca7b523 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -176,6 +176,7 @@
 		reg = <0xc5000000 0x4000>;
 		interrupts = < 52 >;
 		phy_type = "utmi";
+		clocks = <&periph_clk 22>;	// PERIPH_ID_USBD
 	};
 
 	usb@c5004000 {
@@ -183,6 +184,7 @@
 		reg = <0xc5004000 0x4000>;
 		interrupts = < 53 >;
 		phy_type = "ulpi";
+		clocks = <&periph_clk 58>;	// PERIPH_ID_USB2
 	};
 
 	usb@c5008000 {
@@ -190,6 +192,7 @@
 		reg = <0xc5008000 0x4000>;
 		interrupts = < 129 >;
 		phy_type = "utmi";
+		clocks = <&periph_clk 59>;	// PERIPH_ID_USB3
 	};
 
 };
-- 
1.7.7.3
