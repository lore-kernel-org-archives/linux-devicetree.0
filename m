From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v10 4/4] nvmem: Add DT binding documentation for Vybrid OCOTP driver
Date: Mon,  7 Sep 2015 13:51:38 +0530
Message-ID: <1cec2239c020d4519aad38f42f09bf26b3d2854a.1441609625.git.maitysanchayan@gmail.com>
References: <cover.1441609625.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1441609625.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1441609625.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1441609625.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the devicetree bindings for the Freescale Vybrid On-Chip
OTP driver.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/nvmem/vf610-ocotp.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt b/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
new file mode 100644
index 0000000..56ed481
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/vf610-ocotp.txt
@@ -0,0 +1,19 @@
+On-Chip OTP Memory for Freescale Vybrid
+
+Required Properties:
+  compatible:
+  - "fsl,vf610-ocotp" for VF5xx/VF6xx
+  #address-cells : Should be 1
+  #size-cells : Should be 1
+  reg : Address and length of OTP controller and fuse map registers
+  clocks : ipg clock we associate with the OCOTP peripheral
+
+Example for Vybrid VF5xx/VF6xx:
+
+	ocotp: ocotp@400a5000 {
+		compatible = "fsl,vf610-ocotp";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x400a5000 0xCF0>;
+		clocks = <&clks VF610_CLK_OCOTP>;
+	};
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
