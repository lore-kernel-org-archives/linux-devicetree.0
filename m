From: Scott Branden <sbranden@broadcom.com>
Subject: [PATCH v3 1/2] hwrng: iproc-rng200 - Add device tree bindings
Date: Wed, 4 Mar 2015 12:42:13 -0800
Message-ID: <1425501734-14025-2-git-send-email-sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
 <1425501734-14025-1-git-send-email-sbranden@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1425501734-14025-1-git-send-email-sbranden@broadcom.com>
Sender: linux-crypto-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Grant Likely <grant.likely@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org

Documents the IPROC random number generator device tree bindings
used in some Broadcom chipsets.

Reviewed-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Scott Branden <sbranden@broadcom.com>
---
 .../devicetree/bindings/hwrng/brcm,iproc-rng200.txt          | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt

diff --git a/Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt b/Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt
new file mode 100644
index 0000000..e25a456
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwrng/brcm,iproc-rng200.txt
@@ -0,0 +1,12 @@
+HWRNG support for the iproc-rng200 driver
+
+Required properties:
+- compatible : "brcm,iproc-rng200"
+- reg : base address and size of control register block
+
+Example:
+
+rng {
+        compatible = "brcm,iproc-rng200";
+        reg = <0x18032000 0x28>;
+};
-- 
2.3.0
