From: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v4 3/4] dt-bindings: stm32-dma: add a property to handle STM32 DMAMUX
Date: Thu, 7 Sep 2017 13:52:47 +0200
Message-ID: <1504785168-26572-4-git-send-email-pierre-yves.mordret@st.com>
References: <1504785168-26572-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504785168-26572-1-git-send-email-pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

STM32 DMA controller has to exposed its number of request line to be
addressed via STM32 DMAMUX.

Signed-off-by: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>
---
 Version history:
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
