From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 22/23] tegra: fdt: Add EMC data for Tegra2
	Seaboard
Date: Thu,  5 Apr 2012 14:55:15 -0700
Message-ID: <1333662916-17958-23-git-send-email-sjg@chromium.org>
References: <1333662916-17958-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1333662916-17958-6-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

This adds timings for T20 and T25 Seaboards, using the bindings found here:

http://patchwork.ozlabs.org/patch/132928/

We supply both full speed options for normal running, and half speed options
for testing / development.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v4:
- Remove T20 memory timings - we only support T25 Seaboards

 board/nvidia/dts/tegra2-seaboard.dts |   37 ++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 6ba3ec4..08ada8c 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -89,4 +89,41 @@
 	i2c@7000c500 {
 		clock-frequency = <100000>;
 	};
+
+	emc@7000f400 {
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
