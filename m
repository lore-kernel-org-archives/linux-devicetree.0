From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 07/10] tegra: fdt: Add keyboard definitions for Seaboard
Date: Tue, 17 Apr 2012 12:01:34 -0700
Message-ID: <1334689297-13489-8-git-send-email-sjg@chromium.org>
References: <1334689297-13489-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334689297-13489-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Anton Staff <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Anton Staff <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Seaboard uses a QUERTY keyboard. We add key codes for this to
enable key scanning to work.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Remove status = "okay" since this is the default anyway

Changes in v3:
- Move to new Linux device tree mapping for Tegra keyboard

 board/nvidia/dts/tegra2-seaboard.dts |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 72a5f5d..db72ef2 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -142,4 +142,31 @@
 			nvidia,page-spare-bytes = <64>;
 		};
 	};
+
+	kbc@7000e200 {
+		linux,keymap = <0x00020011 0x0003001f 0x0004001e 0x0005002c
+			0x000701d0 0x0107007d 0x02060064 0x02070038 0x03000006
+			0x03010005 0x03020013 0x03030012 0x03040021 0x03050020
+			0x0306002d 0x04000008 0x04010007 0x04020014 0x04030023
+			0x04040022 0x0405002f 0x0406002e 0x04070039 0x0500000a
+			0x05010009 0x05020016 0x05030015 0x05040024 0x05050031
+			0x05060030 0x0507002b 0x0600000c 0x0601000b 0x06020018
+			0x06030017 0x06040026 0x06050025 0x06060033 0x06070032
+			0x0701000d 0x0702001b 0x0703001c 0x0707008b 0x08040036
+			0x0805002a 0x09050061 0x0907001d 0x0b00001a 0x0b010019
+			0x0b020028 0x0b030027 0x0b040035 0x0b050034 0x0c000044
+			0x0c010043 0x0c02000e 0x0c030004 0x0c040003 0x0c050067
+			0x0c0600d2 0x0c070077 0x0d00006e 0x0d01006f 0x0d030068
+			0x0d04006d 0x0d05006a 0x0d06006c 0x0d070069 0x0e000057
+			0x0e010058 0x0e020042 0x0e030010 0x0e04003e 0x0e05003d
+			0x0e060002 0x0e070041 0x0f000001 0x0f010029 0x0f02003f
+			0x0f03000f 0x0f04003b 0x0f05003c 0x0f06003a 0x0f070040
+			0x14000047 0x15000049 0x15010048 0x1502004b 0x1504004f
+			0x16010062 0x1602004d 0x1603004c 0x16040051 0x16050050
+			0x16070052 0x1b010037 0x1b03004a 0x1b04004e 0x1b050053
+			0x1c050073 0x1d030066 0x1d04006b 0x1d0500e0 0x1d060072
+			0x1d0700e1 0x1e000045 0x1e010046 0x1e020071
+			0x1f04008a>;
+		linux,fn-keymap = <0x05040002>;
+	};
 };
-- 
1.7.7.3
