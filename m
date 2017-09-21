From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v5 3/4] dt-bindings: stm32-dma: add a property to handle STM32 DMAMUX
Date: Thu, 21 Sep 2017 17:29:20 +0200
Message-ID: <1506007761-11621-4-git-send-email-pierre-yves.mordret@st.com>
References: <1506007761-11621-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506007761-11621-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

STM32 DMA controller has to exposed its number of request line to be
addressed via STM32 DMAMUX.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
 Version history:
    v5:
    v4:
        * get rid of st,dmamux property
        * number of DMA requests is exposed for DMAMUX
    v3:
        * None
    v2:
        * Typo fix
---
---
 Documentation/devicetree/bindings/dma/stm32-dma.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/stm32-dma.txt b/Documentation/devicetree/bindings/dma/stm32-dma.txt
index 4408af6..77542e1 100644
--- a/Documentation/devicetree/bindings/dma/stm32-dma.txt
+++ b/Documentation/devicetree/bindings/dma/stm32-dma.txt
@@ -13,6 +13,7 @@ Required properties:
 - #dma-cells : Must be <4>. See DMA client paragraph for more details.
 
 Optional properties:
+- dma-requests : Number of DMA requests supported.
 - resets: Reference to a reset controller asserting the DMA controller
 - st,mem2mem: boolean; if defined, it indicates that the controller supports
   memory-to-memory transfer
@@ -34,12 +35,13 @@ Example:
 		#dma-cells = <4>;
 		st,mem2mem;
 		resets = <&rcc 150>;
+		dma-requests = <8>;
 	};
 
 * DMA client
 
 DMA clients connected to the STM32 DMA controller must use the format
-described in the dma.txt file, using a five-cell specifier for each
+described in the dma.txt file, using a four-cell specifier for each
 channel: a phandle to the DMA controller plus the following four integer cells:
 
 1. The channel id
-- 
2.7.4
