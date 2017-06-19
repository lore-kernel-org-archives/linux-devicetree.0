From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/3] dt-bindings: add Libre Technology vendor prefix
Date: Mon, 19 Jun 2017 11:04:38 +0200
Message-ID: <20170619090440.27099-2-jbrunet@baylibre.com>
References: <20170619090440.27099-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170619090440.27099-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Shenzhen Libre Technology Co., Ltd is a single board computer
manufacturer

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index ee2e10f2ae41..bf83fd25a1df 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -173,6 +173,7 @@ lantiq	Lantiq Semiconductor
 lego	LEGO Systems A/S
 lenovo	Lenovo Group Ltd.
 lg	LG Corporation
+libretech	Shenzhen Libre Technology Co., Ltd
 licheepi	Lichee Pi
 linaro	Linaro Limited
 linux	Linux-specific binding
-- 
2.9.4
