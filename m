From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v3 2/2] dt-bindings: Add an entry for Purism SPC
Date: Mon, 15 Apr 2019 09:03:46 -0700
Message-ID: <20190415160346.7324-3-angus@akkea.ca>
References: <20190415160346.7324-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415160346.7324-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an entry for Purism, SPC

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 40f632db7bc2..44ba42e48007 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -331,6 +331,7 @@ poslab	Poslab Technology Co., Ltd.
 powervr	PowerVR (deprecated, use img)
 probox2	PROBOX2 (by W2COMP Co., Ltd.)
 pulsedlight	PulsedLight, Inc
+purism	Purism, SPC
 qca	Qualcomm Atheros, Inc.
 qcom	Qualcomm Technologies, Inc
 qemu	QEMU, a generic and open source machine emulator and virtualizer
-- 
2.17.1
