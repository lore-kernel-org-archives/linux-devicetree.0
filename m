From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 10/13] drm/sun4i: hdmi: Add A31 specific DDC
 register definitions
Date: Tue, 26 Sep 2017 14:59:16 +0800
Message-ID: <20170926065919.24446-11-wens@csie.org>
References: <20170926065919.24446-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUHVU7HAKGQEUIAVR5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170926065919.24446-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The DDC block for the HDMI controller is different on the A31.

This patch adds the register definitions.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index b1124a8f9f05..da4ea9efc6fa 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -153,6 +153,37 @@
 
 #define SUN4I_HDMI_DDC_FIFO_SIZE	16
 
+/* A31 specific */
+#define SUN6I_HDMI_DDC_CTRL_REG		0x500
+#define SUN6I_HDMI_DDC_CTRL_RESET		BIT(31)
+#define SUN6I_HDMI_DDC_CTRL_START_CMD		BIT(27)
+#define SUN6I_HDMI_DDC_CTRL_SDA_ENABLE		BIT(6)
+#define SUN6I_HDMI_DDC_CTRL_SCL_ENABLE		BIT(4)
+#define SUN6I_HDMI_DDC_CTRL_ENABLE		BIT(0)
+
+#define SUN6I_HDMI_DDC_CMD_REG		0x508
+#define SUN6I_HDMI_DDC_CMD_BYTE_COUNT(count)	((count) << 16)
+/* command types in lower 3 bits are the same as sun4i */
+
+#define SUN6I_HDMI_DDC_ADDR_REG		0x50c
+#define SUN6I_HDMI_DDC_ADDR_SEGMENT(seg)	(((seg) & 0xff) << 24)
+#define SUN6I_HDMI_DDC_ADDR_EDDC(addr)		(((addr) & 0xff) << 16)
+#define SUN6I_HDMI_DDC_ADDR_OFFSET(off)		(((off) & 0xff) << 8)
+#define SUN6I_HDMI_DDC_ADDR_SLAVE(addr)		(((addr) & 0xff) << 1)
+
+#define SUN6I_HDMI_DDC_INT_STATUS_REG	0x514
+#define SUN6I_HDMI_DDC_INT_STATUS_TIMEOUT	BIT(8)
+/* lower 8 bits are the same as sun4i */
+
+#define SUN6I_HDMI_DDC_FIFO_CTRL_REG	0x518
+#define SUN6I_HDMI_DDC_FIFO_CTRL_CLEAR		BIT(15)
+/* lower 9 bits are the same as sun4i */
+
+#define SUN6I_HDMI_DDC_CLK_REG		0x520
+/* DDC CLK bit fields are the same, but the formula is not */
+
+#define SUN6I_HDMI_DDC_FIFO_DATA_REG	0x580
+
 enum sun4i_hdmi_pkt_type {
 	SUN4I_HDMI_PKT_AVI = 2,
 	SUN4I_HDMI_PKT_END = 15,
-- 
2.14.1
