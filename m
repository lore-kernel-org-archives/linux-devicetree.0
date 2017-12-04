From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v5 2/6] dt-bindings: Add vendor prefix for Solomon Goldentek Display Corporation
Date: Mon,  4 Dec 2017 10:21:06 +0100
Message-ID: <1512379270-27436-3-git-send-email-narmstrong@baylibre.com>
References: <1512379270-27436-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512379270-27436-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Solomon Goldentek Display Corporation is a Taiwanese LCD/LCM manufacturer.
Company Site: http://www.goldentek.com.tw

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 0994bdd..b0d3bef 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -305,6 +305,7 @@ seagate	Seagate Technology PLC
 semtech	Semtech Corporation
 sensirion	Sensirion AG
 sff	Small Form Factor Committee
+sgd	Solomon Goldentek Display Corporation
 sgx	SGX Sensortech
 sharp	Sharp Corporation
 shimafuji	Shimafuji Electric, Inc.
-- 
2.7.4
