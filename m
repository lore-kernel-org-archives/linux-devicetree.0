From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v4 2/3] dt-bindings: crypto: document Exynos5433 SlimSSS
Date: Fri, 22 Feb 2019 13:21:43 +0100
Message-ID: <20190222122144.19024-3-k.konieczny@partner.samsung.com>
References: <20190222122144.19024-1-k.konieczny@partner.samsung.com>
        <CGME20190222122204eucas1p15e0e00e9b044d41d44c0d2e55cb6af9c@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222122144.19024-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Document DT bindings for crypto Samsung Exynos5433 SlimSSS (Slim Security
SubSystem) IP.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 .../bindings/crypto/samsung-slimsss.txt       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/samsung-slimsss.txt

diff --git a/Documentation/devicetree/bindings/crypto/samsung-slimsss.txt b/Documentation/devicetree/bindings/crypto/samsung-slimsss.txt
new file mode 100644
index 000000000000..7ec9a5a7727a
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/samsung-slimsss.txt
@@ -0,0 +1,19 @@
+Samsung SoC SlimSSS (Slim Security SubSystem) module
+
+The SlimSSS module in Exynos5433 SoC supports the following:
+-- Feeder (FeedCtrl)
+-- Advanced Encryption Standard (AES) with ECB,CBC,CTR,XTS and (CBC/XTS)/CTS
+-- SHA-1/SHA-256 and (SHA-1/SHA-256)/HMAC
+
+Required properties:
+
+- compatible : Should contain entry for slimSSS version:
+  - "samsung,exynos5433-slim-sss" for Exynos5433 SoC.
+- reg : Offset and length of the register set for the module
+- interrupts : interrupt specifiers of SlimSSS module interrupts (one feed
+		control interrupt).
+
+- clocks : list of clock phandle and specifier pairs for all clocks listed in
+		clock-names property.
+- clock-names : list of device clock input names; should contain "pclk" and
+		"aclk" for slim-sss in Exynos5433.
-- 
2.20.1
