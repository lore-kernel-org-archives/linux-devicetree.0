From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 22/23] tegra: fdt: Add EMC data for Tegra2 Seaboard
Date: Mon,  2 Apr 2012 16:19:02 -0700
Message-ID: <1333408743-28720-23-git-send-email-sjg@chromium.org>
References: <1333408743-28720-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1333408743-28720-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds timings for T20 and T25 Seaboards, using the bindings found here:

http://patchwork.ozlabs.org/patch/132928/

We supply both full speed options for normal running, and half speed options
for testing / development.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 board/nvidia/dts/tegra2-seaboard.dts |   72 ++++++++++++++++++++++++++++++++++
 1 files changed, 72 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 6ba3ec4..31e0f9d 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -89,4 +89,76 @@
 	i2c@7000c500 {
 		clock-frequency = <100000>;
 	};
+
+	emc@7000f400 {
+		emc-table@166500 {
+			reg = <166500>;
+			compatible = "nvidia,tegra20-emc-table";
+			clock-frequency = < 166500 >;
+			nvidia,emc-registers = < 0x0000000a 0x00000021
+				0x00000008 0x00000003 0x00000004 0x00000004
+				0x00000002 0x0000000c 0x00000003 0x00000003
+				0x00000002 0x00000001 0x00000004 0x00000005
+				0x00000004 0x00000009 0x0000000d 0x000004df
+				0x00000000 0x00000003 0x00000003 0x00000003
+				0x00000003 0x00000001 0x0000000a 0x000000c8
+				0x00000003 0x00000006 0x00000004 0x0000000f
+				0x00000002 0x00000000 0x00000000 0x00000002
+				0x00000000 0x00000000 0x00000083 0xa04004ae
+				0x007fd010 0x00000000 0x00000000 0x00000000
+				0x00000000 0x00000000 0x00000000 0x00000000 >;
+		};
+		emc-table@333000 {
+			reg = <333000>;
+			compatible = "nvidia,tegra20-emc-table";
+			clock-frequency = < 333000 >;
+			nvidia,emc-registers = < 0x00000014 0x00000041
+				0x0000000f 0x00000005 0x00000004 0x00000005
+				0x00000003 0x0000000c 0x00000005 0x00000005
+				0x00000003 0x00000001 0x00000004 0x00000005
+				0x00000004 0x00000009 0x0000000d 0x000009ff
+				0x00000000 0x00000003 0x00000003 0x00000005
+				0x00000005 0x00000001 0x0000000f 0x000000c8
+				0x00000003 0x0000000c 0x00000006 0x0000000f
+				0x00000002 0x00000000 0x00000000 0x00000002
+				0x00000000 0x00000000 0x00000083 0xe034048b
+				0x007e8010 0x00000000 0x00000000 0x00000000
+				0x00000000 0x00000000 0x00000000 0x00000000 >;
+		};
+
+		emc-table@190000 {
+			reg = < 190000 >;
+			compatible = "nvidia,tegra20-emc-table";
+			clock-frequency = < 190000 >;
+			nvidia,emc-registers = < 0x0000000c 0x00000026
+				0x00000009 0x00000003 0x00000004 0x00000004
+				0x00000002 0x0000000c 0x00000003 0x00000003
+				0x00000002 0x00000001 0x00000004 0x00000005
+				0x00000004 0x00000009 0x0000000d 0x0000059f
+				0x00000000 0x00000003 0x00000003 0x00000003
+				0x00000003 0x00000001 0x0000000b 0x000000c8
+				0x00000003 0x00000007 0x00000004 0x0000000f
+				0x00000002 0x00000000 0x00000000 0x00000002
+				0x00000000 0x00000000 0x00000083 0xa06204ae
+				0x007dc010 0x00000000 0x00000000 0x00000000
+				0x00000000 0x00000000 0x00000000 0x00000000 >;
+		};
+		emc-table@380000 {
+			reg = < 380000 >;
+			compatible = "nvidia,tegra20-emc-table";
+			clock-frequency = < 380000 >;
+			nvidia,emc-registers = < 0x00000017 0x0000004b
+				0x00000012 0x00000006 0x00000004 0x00000005
+				0x00000003 0x0000000c 0x00000006 0x00000006
+				0x00000003 0x00000001 0x00000004 0x00000005
+				0x00000004 0x00000009 0x0000000d 0x00000b5f
+				0x00000000 0x00000003 0x00000003 0x00000006
+				0x00000006 0x00000001 0x00000011 0x000000c8
+				0x00000003 0x0000000e 0x00000007 0x0000000f
+				0x00000002 0x00000000 0x00000000 0x00000002
+				0x00000000 0x00000000 0x00000083 0xe044048b
+				0x007d8010 0x00000000 0x00000000 0x00000000
+				0x00000000 0x00000000 0x00000000 0x00000000 >;
+		};
+	};
 };
-- 
1.7.7.3
