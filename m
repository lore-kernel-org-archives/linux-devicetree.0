From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/2] dt-bindings: rng: Document BCM7211 RNG compatible string
Date: Fri, 10 May 2019 10:31:10 -0700
Message-ID: <20190510173112.2196-2-f.fainelli@gmail.com>
References: <20190510173112.2196-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510173112.2196-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com, wahrenst@gmx.net, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org, mpm@selenic.com, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM IPROC ARM
        ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

BCM7211 features a RNG200 block, document its compatible string.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
index 0014da9145af..c223e54452da 100644
--- a/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
+++ b/Documentation/devicetree/bindings/rng/brcm,iproc-rng200.txt
@@ -2,6 +2,7 @@ HWRNG support for the iproc-rng200 driver
 
 Required properties:
 - compatible : Must be one of:
+	       "brcm,bcm7211-rng200"
 	       "brcm,bcm7278-rng200"
 	       "brcm,iproc-rng200"
 - reg : base address and size of control register block
-- 
2.17.1
