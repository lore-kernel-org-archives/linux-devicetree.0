From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v6 2/3] dt-bindings: Add an entry for Purism SPC
Date: Mon, 22 Apr 2019 08:30:02 -0700
Message-ID: <20190422153003.10223-3-angus@akkea.ca>
References: <20190422153003.10223-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422153003.10223-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus@akkea.ca
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?
List-Id: devicetree@vger.kernel.org

Add an entry for Purism, SPC

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index d058b5102664..81f097f26953 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -332,6 +332,7 @@ poslab	Poslab Technology Co., Ltd.
 powervr	PowerVR (deprecated, use img)
 probox2	PROBOX2 (by W2COMP Co., Ltd.)
 pulsedlight	PulsedLight, Inc
+purism	Purism, SPC
 qca	Qualcomm Atheros, Inc.
 qcom	Qualcomm Technologies, Inc
 qemu	QEMU, a generic and open source machine emulator and virtualizer
-- 
2.17.1
