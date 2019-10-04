From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 14/21] media: ti-vpe: vpdma: Use fixed type for address in descriptor
Date: Fri, 4 Oct 2019 11:29:45 -0500
Message-ID: <20191004162952.4963-15-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

Using dma_addr_t as the type to hold address inside of a fix sized
descriptor used by the vpdma firmware is prone to fail when the expected
width is 32 bits and suddenly when CONFIG_LPAE is enabled the data size
is now 64 bits shifted the remaining members of the descriptor in memory
which confuses the firmware.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpdma_priv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/vpdma_priv.h b/drivers/media/platform/ti-vpe/vpdma_priv.h
index d8ae3e1cd54d..0bbee45338bd 100644
--- a/drivers/media/platform/ti-vpe/vpdma_priv.h
+++ b/drivers/media/platform/ti-vpe/vpdma_priv.h
@@ -166,11 +166,11 @@ struct vpdma_dtd {
 		u32		xfer_length_height;
 		u32		w1;
 	};
-	dma_addr_t		start_addr;
+	u32			start_addr;
 	u32			pkt_ctl;
 	union {
 		u32		frame_width_height;	/* inbound */
-		dma_addr_t	desc_write_addr;	/* outbound */
+		u32		desc_write_addr;	/* outbound */
 	};
 	union {
 		u32		start_h_v;		/* inbound */
-- 
2.17.1
