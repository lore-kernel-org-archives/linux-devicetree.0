From: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH 22/41] Documentation: dt: soc: fix spelling mistakes
Date: Mon, 25 Apr 2016 01:24:19 +0100
Message-ID: <1461543878-3639-23-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Murali Karicheri <m-karicheri2@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 .../devicetree/bindings/soc/ti/keystone-navigator-qmss.txt          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt b/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
index d1ce21a..64c66a5 100644
--- a/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
+++ b/Documentation/devicetree/bindings/soc/ti/keystone-navigator-qmss.txt
@@ -42,7 +42,7 @@ Required properties:
 - queue-pools	: child node classifying the queue ranges into pools.
 		  Queue ranges are grouped into 3 type of pools:
 		  - qpend	    : pool of qpend(interruptible) queues
-		  - general-purpose : pool of general queues, primarly used
+		  - general-purpose : pool of general queues, primarily used
 				      as free descriptor queues or the
 				      transmit DMA queues.
 		  - accumulator	    : pool of queues on PDSP accumulator channel
@@ -50,7 +50,7 @@ Required properties:
   -- qrange		: number of queues to use per queue range, specified as
 			  <"base queue #" "# of queues">.
   -- interrupts		: Optional property to specify the interrupt mapping
-			  for interruptible queues. The driver additionaly sets
+			  for interruptible queues. The driver additionally sets
 			  the interrupt affinity hint based on the cpu mask.
   -- qalloc-by-id	: Optional property to specify that the queues in this
 			  range can only be allocated by queue id.
@@ -80,7 +80,7 @@ Required properties:
 			  latency     : time to delay the interrupt, specified
 					in microseconds.
   -- multi-queue	: Optional property to specify that the channel has to
-			  monitor upto 32 queues starting at the base queue #.
+			  monitor up to 32 queues starting at the base queue #.
 - descriptor-regions	: child node describing the memory regions for keystone
 			  navigator packet DMA descriptors. The memory for
 			  descriptors will be allocated by the driver.
-- 
2.8.0
