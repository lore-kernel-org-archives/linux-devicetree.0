From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH V4 RFC 1/3] DT: nvmem: add binding for mxs-ocotp
Date: Sun, 19 Jul 2015 22:04:57 +0000
Message-ID: <1437343499-16422-2-git-send-email-stefan.wahren@i2se.com>
References: <1437343499-16422-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437343499-16422-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the devicetree bindings for the Freescale MXS On Chip
OTP driver.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 .../devicetree/bindings/nvmem/mxs-ocotp.txt        |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt

diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
new file mode 100644
index 0000000..cd2a8cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
@@ -0,0 +1,24 @@
+On-Chip OTP Memory for Freescale i.MX23/i.MX28
+
+Required properties:
+- compatible:
+  - "fsl,imx23-ocotp" for i.MX23
+  - "fsl,imx28-ocotp" for i.MX28
+- #address-cells : Should be 1
+- #size-cells : Should be 1
+- reg : Address and length of OTP controller registers
+- clocks : Should contain a reference to the HBus clock
+
+= Data cells =
+Are child nodes of mxs-ocotp, bindings of which as described in
+bindings/nvmem/nvmem.txt
+
+Example for i.MX28:
+
+	ocotp: ocotp@8002c000 {
+		compatible = "fsl,imx28-ocotp", "fsl,ocotp";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x8002c000 0x2000>;
+		clocks = <&clks 25>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
