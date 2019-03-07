From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
Date: Thu,  7 Mar 2019 15:14:54 +0100
Message-ID: <20190307141455.23879-3-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307141455.23879-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a clock ID for the reference clock feeding the USB3+PCIe Combo PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index d7bf0830c87d..30303728fe09 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -132,5 +132,6 @@
 #define CLKID_MALI				175
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
+#define CLKID_PCIE_PLL				201
 
 #endif /* __G12A_CLKC_H */
-- 
2.20.1
