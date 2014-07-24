From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 07/11] Documentation: devicetree: Fix Xilinx VDMA specification
Date: Fri, 25 Jul 2014 01:00:16 +0200
Message-ID: <1406242820-20140-8-git-send-email-afaerber@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406242820-20140-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The specification requires xlnx,data-width, but example and driver use
xlnx,datawidth. Change the specification to match the implementation.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New
=20
 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.t=
xt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
index 1405ed0..e4c4d47 100644
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
1.9.3
