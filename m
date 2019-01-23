From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v2 2/3] dt-bindings: crypto: document Exynos5433 SlimSSS
Date: Wed, 23 Jan 2019 17:55:32 +0100
Message-ID: <20190123165533.29645-3-k.konieczny@partner.samsung.com>
References: <20190123165533.29645-1-k.konieczny@partner.samsung.com>
        <CGME20190123165551eucas1p2bb80cfe58535b5f665271c7448cffc30@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123165533.29645-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Document DT bindings for crypto Samsung Exynos5433 SlimSSS (Slim Security
SubSystem) IP.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 .../devicetree/bindings/crypto/samsung-sss.txt     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/samsung-sss.txt b/Documentation/devicetree/bindings/crypto/samsung-sss.txt
index 7a5ca56683cc..d9af679d38ab 100644
--- a/Documentation/devicetree/bindings/crypto/samsung-sss.txt
+++ b/Documentation/devicetree/bindings/crypto/samsung-sss.txt
@@ -1,4 +1,4 @@
-Samsung SoC SSS (Security SubSystem) module
+Samsung SoC SSS (Security SubSystem) and SlimSSS module
 
 The SSS module in S5PV210 SoC supports the following:
 -- Feeder (FeedCtrl)
@@ -15,6 +15,12 @@ supports the following also:
 -- True Random Number Generator (TRNG)
 -- Secure Key Manager
 
+Exynos5433 has both SSS and SlimSSS module.
+SlimSSS in Exynos5433 supports:
+-- Feeder (FeedCtrl)
+-- Advanced Encryption Standard (AES)
+-- SHA-1/SHA-256/HMAC (SHA-1/SHA-256)
+
 Required properties:
 
 - compatible : Should contain entries for this and backward compatible
@@ -22,11 +28,13 @@ Required properties:
   - "samsung,s5pv210-secss" for S5PV210 SoC.
   - "samsung,exynos4210-secss" for Exynos4210, Exynos4212, Exynos4412, Exynos5250,
 		Exynos5260 and Exynos5420 SoCs.
+  - "samsung,exynos5433-slim-sss" for Exynos5433 SoCs.
 - reg : Offset and length of the register set for the module
 - interrupts : interrupt specifiers of SSS module interrupts (one feed
 		control interrupt).
 
 - clocks : list of clock phandle and specifier pairs for all clocks  listed in
 		clock-names property.
-- clock-names : list of device clock input names; should contain one entry
-		"secss".
+- clock-names : list of device clock input names; should contain "pclk" and
+		"aclk" for slim-sss in Exynos5433, and one entry "secss" for
+		other compatibles.
-- 
2.20.0
