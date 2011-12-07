From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 09/16] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Tue,  6 Dec 2011 17:24:08 -0800
Message-ID: <1323221055-20113-10-git-send-email-sjg@chromium.org>
References: <1323221055-20113-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323221055-20113-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This adds peripheral IDs to the USB part of the device tree for U-Boot.

The peripheral IDs provide easy access to clock registers. We will likely
remove this in favor of a full clock tree when it is available in the
kernel (but probably still retain the peripheral ID, just move it into
a clock node).

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
index 6146d24..27e3127 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -149,6 +149,7 @@
 		reg = <0xc5000000 0x4000>;
 		interrupts = < 52 >;
 		phy_type = "utmi";
+		u-boot,periph-id = <22>;	// PERIPH_ID_USBD
 	};
 
 	usb@c5004000 {
@@ -156,6 +157,7 @@
 		reg = <0xc5004000 0x4000>;
 		interrupts = < 53 >;
 		phy_type = "ulpi";
+		u-boot,periph-id = <58>;	// PERIPH_ID_USB2
 	};
 
 	usb@c5008000 {
@@ -163,6 +165,7 @@
 		reg = <0xc5008000 0x4000>;
 		interrupts = < 129 >;
 		phy_type = "utmi";
+		u-boot,periph-id = <59>;	// PERIPH_ID_USB3
 	};
 
 };
-- 
1.7.3.1
