From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/8] dt-bindings: Add a binding for Mediatek Video Processor
Date: Thu, 4 Feb 2016 19:34:56 +0800
Message-ID: <1454585703-42428-2-git-send-email-tiffany.lin@mediatek.com>
References: <1454585703-42428-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454585703-42428-1-git-send-email-tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add a DT binding documentation of Video Processor Unit for the
MT8173 SoC from Mediatek.


Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/mediatek-vpu.txt     |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-vpu.txt b/Documentation/devicetree/bindings/media/mediatek-vpu.txt
new file mode 100644
index 0000000..2a5bac3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vpu.txt
@@ -0,0 +1,31 @@
+* Mediatek Video Processor Unit
+
+Video Processor Unit is a HW video controller. It controls HW Codec including
+H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).
+
+Required properties:
+  - compatible: "mediatek,mt8173-vpu"
+  - reg: Must contain an entry for each entry in reg-names.
+  - reg-names: Must include the following entries:
+    "tcm": tcm base
+    "cfg_reg": Main configuration registers base
+  - interrupts: interrupt number to the cpu.
+  - clocks : clock name from clock manager
+  - clock-names: must be main. It is the main clock of VPU
+
+Optional properties:
+  - memory-region: phandle to a node describing memory (see
+    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
+    to be used for VPU extended memory; if not present, VPU may be located
+    anywhere in the memory
+
+Example:
+	vpu: vpu@10020000 {
+		compatible = "mediatek,mt8173-vpu";
+		reg = <0 0x10020000 0 0x30000>,
+		      <0 0x10050000 0 0x100>;
+		reg-names = "tcm", "cfg_reg";
+		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&topckgen TOP_SCP_SEL>;
+		clock-names = "main";
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
