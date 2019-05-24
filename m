From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 6/6] dt-bindings: move Atmel ECC508A I2C crypto processor
 to trivial-devices
Date: Fri, 24 May 2019 18:26:51 +0200
Message-ID: <20190524162651.28189-7-ard.biesheuvel@linaro.org>
References: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190524162651.28189-1-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Tudor Ambarus <tudor.ambarus@microchip.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Move the binding for the discrete Atmel I2C Elliptic Curve h/w crypto
module to trivial-devices.yaml, as it doesn't belong in atmel-crypto
which describes unrelated on-SoC peripherals.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 Documentation/devicetree/bindings/crypto/atmel-crypto.txt | 13 -------------
 Documentation/devicetree/bindings/trivial-devices.yaml    |  2 ++
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/atmel-crypto.txt b/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
index 6b458bb2440d..f2aab3dc2b52 100644
--- a/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
+++ b/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
@@ -66,16 +66,3 @@ sha@f8034000 {
 	dmas = <&dma1 2 17>;
 	dma-names = "tx";
 };
-
-* Eliptic Curve Cryptography (I2C)
-
-Required properties:
-- compatible : must be "atmel,atecc508a".
-- reg: I2C bus address of the device.
-- clock-frequency: must be present in the i2c controller node.
-
-Example:
-atecc508a@c0 {
-	compatible = "atmel,atecc508a";
-	reg = <0xC0>;
-};
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a572c3468226..2e742d399e87 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -54,6 +54,8 @@ properties:
           - atmel,at97sc3204t
             # i2c h/w symmetric crypto module
           - atmel,atsha204a
+            # i2c h/w elliptic curve crypto module
+          - atmel,atecc508a
             # CM32181: Ambient Light Sensor
           - capella,cm32181
             # CM3232: Ambient Light Sensor
-- 
2.20.1
