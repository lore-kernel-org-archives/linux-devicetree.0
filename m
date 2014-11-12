From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH RESEND] Documentation: devicetree: Fix Xilinx VDMA specification
Date: Wed, 12 Nov 2014 14:51:16 +0100
Message-ID: <1415800277-6817-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The specification requires xlnx,data-width, but example and driver use
xlnx,datawidth. Change the specification to match the implementation.

Reviewed-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
=46ixes: eebeac03db93 ("dma: Add Xilinx Video DMA DT Binding Documentat=
ion")
Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 This appears to have fallen through the cracks... resending to dmaengi=
ne.

 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.t=
xt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
index 1405ed071bb4..e4c4d47f8137 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
@@ -25,7 +25,7 @@ Required child node properties:
 - compatible: It should be either "xlnx,axi-vdma-mm2s-channel" or
 	"xlnx,axi-vdma-s2mm-channel".
 - interrupts: Should contain per channel VDMA interrupts.
-- xlnx,data-width: Should contain the stream data width, take values
+- xlnx,datawidth: Should contain the stream data width, take values
 	{32,64...1024}.
=20
 Optional child node properties:
--=20
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
