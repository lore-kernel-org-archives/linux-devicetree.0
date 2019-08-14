From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v2 03/15] drm/mxsfb: Add defines for the rest of registers
Date: Wed, 14 Aug 2019 13:48:39 +0300
Message-ID: <1565779731-1300-4-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some of the existing registers in this controller are not defined, but
also not used. Add them to the register definitions, so that they can be
easily used in future improvements or fixes.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_regs.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 932d7ea..71426aa 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -14,19 +14,31 @@
 
 #define LCDC_CTRL			0x00
 #define LCDC_CTRL1			0x10
+#define LCDC_V4_CTRL2			0x20
 #define LCDC_V3_TRANSFER_COUNT		0x20
 #define LCDC_V4_TRANSFER_COUNT		0x30
 #define LCDC_V4_CUR_BUF			0x40
 #define LCDC_V4_NEXT_BUF		0x50
 #define LCDC_V3_CUR_BUF			0x30
 #define LCDC_V3_NEXT_BUF		0x40
+#define LCDC_TIMING			0x60
 #define LCDC_VDCTRL0			0x70
 #define LCDC_VDCTRL1			0x80
 #define LCDC_VDCTRL2			0x90
 #define LCDC_VDCTRL3			0xa0
 #define LCDC_VDCTRL4			0xb0
+#define LCDC_DVICTRL0			0xc0
+#define LCDC_DVICTRL1			0xd0
+#define LCDC_DVICTRL2			0xe0
+#define LCDC_DVICTRL3			0xf0
+#define LCDC_DVICTRL4			0x100
+#define LCDC_V4_DATA			0x180
+#define LCDC_V3_DATA			0x1b0
 #define LCDC_V4_DEBUG0			0x1d0
 #define LCDC_V3_DEBUG0			0x1f0
+#define LCDC_AS_CTRL			0x210
+#define LCDC_AS_BUF			0x220
+#define LCDC_AS_NEXT_BUF		0x230
 
 #define CTRL_SFTRST			(1 << 31)
 #define CTRL_CLKGATE			(1 << 30)
@@ -45,12 +57,15 @@
 #define CTRL_DF24			(1 << 1)
 #define CTRL_RUN			(1 << 0)
 
+#define CTRL1_RECOVERY_ON_UNDERFLOW	(1 << 24)
 #define CTRL1_FIFO_CLEAR		(1 << 21)
 #define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
 #define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
 #define CTRL1_CUR_FRAME_DONE_IRQ_EN	(1 << 13)
 #define CTRL1_CUR_FRAME_DONE_IRQ	(1 << 9)
 
+#define CTRL2_OUTSTANDING_REQS__REQ_16		(4 << 21)
+
 #define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
 #define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
 #define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)
-- 
2.7.4
