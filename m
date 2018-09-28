From: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Subject: [PATCH v2 2/7] dt-bindings: stm32-dmamux: Add one cell to support DMA/MDMA chain
Date: Fri, 28 Sep 2018 10:36:29 +0200
Message-ID: <1538123794-17085-3-git-send-email-pierre-yves.mordret@st.com>
References: <1538123794-17085-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538123794-17085-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
List-Id: devicetree@vger.kernel.org

From: M'boumba Cedric Madianga <cedric.madianga@gmail.com>

Add one cell to support DMA/MDMA chaining.

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
---
  Version history:
    v1:
       * Initial
---
---
 Documentation/devicetree/bindings/dma/stm32-dmamux.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
index 1b893b2..5e92b59 100644
--- a/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
+++ b/Documentation/devicetree/bindings/dma/stm32-dmamux.txt
@@ -4,9 +4,9 @@ Required properties:
 - compatible:	"st,stm32h7-dmamux"
 - reg:		Memory map for accessing module
 - #dma-cells:	Should be set to <3>.
-		First parameter is request line number.
-		Second is DMA channel configuration
-		Third is Fifo threshold
+-		First parameter is request line number.
+-		Second is DMA channel configuration
+-		Third is a 32bit bitfield
 		For more details about the three cells, please see
 		stm32-dma.txt documentation binding file
 - dma-masters:	Phandle pointing to the DMA controllers.
-- 
2.7.4
