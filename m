From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/6] dma: pl08x: Add Faraday FTDMAC020 to compatible list
Date: Sat,  8 Apr 2017 14:04:53 +0200
Message-ID: <20170408120457.22750-2-linus.walleij@linaro.org>
References: <20170408120457.22750-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170408120457.22750-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuo-Jung Su <dantesu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This augments the PL08x bindings to include the Faraday Technology
FTDMAC020 DMA engine, as it is clearly a derivative of the PL08x
PrimeCell. Also specify that it needs the special peripheral ID
specified to work properly.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Seeking a DT maintainer ACK on this.
---
 Documentation/devicetree/bindings/dma/arm-pl08x.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl08x.txt b/Documentation/devicetree/bindings/dma/arm-pl08x.txt
index 8a0097a029d3..0ba81f79266f 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl08x.txt
+++ b/Documentation/devicetree/bindings/dma/arm-pl08x.txt
@@ -3,6 +3,11 @@
 Required properties:
 - compatible: "arm,pl080", "arm,primecell";
 	      "arm,pl081", "arm,primecell";
+	      "faraday,ftdmac020", "arm,primecell"
+- arm,primecell-periphid: on the FTDMAC020 the primecell ID is not hard-coded
+  in the hardware and must be specified here as <0x0003b080>. This number
+  follows the PrimeCell standard numbering using the JEP106 vendor code 0x38
+  for Faraday Technology.
 - reg: Address range of the PL08x registers
 - interrupt: The PL08x interrupt number
 - clocks: The clock running the IP core clock
@@ -20,8 +25,8 @@ Optional properties:
 - dma-requests: contains the total number of DMA requests supported by the DMAC
 - memcpy-burst-size: the size of the bursts for memcpy: 1, 4, 8, 16, 32
   64, 128 or 256 bytes are legal values
-- memcpy-bus-width: the bus width used for memcpy: 8, 16 or 32 are legal
-  values
+- memcpy-bus-width: the bus width used for memcpy in bits: 8, 16 or 32 are legal
+  values, the Faraday FTDMAC020 can also accept 64 bits
 
 Clients
 Required properties:
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
