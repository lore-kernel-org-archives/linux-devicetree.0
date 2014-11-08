From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH V5 5/7] dw-hdmi: add support for multi byte register width
 access
Date: Sat,  8 Nov 2014 13:31:06 +0800
Message-ID: <1415424666-7663-1-git-send-email-andy.yan@rock-chips.com>
References: <1415424410-7364-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415424410-7364-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ykk@rock-chips.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Grant Likely <grant.likely@linaro.org>, Andy yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On rockchip rk3288, only word(32-bit) accesses are
permitted for hdmi registers.  Byte width accesses (writeb,
readb) generate an imprecise external abort.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/gpu/drm/bridge/dw_hdmi.c | 57 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/dw_hdmi.c b/drivers/gpu/drm/bridge/dw_hdmi.c
index e9e73a7..52158ee 100644
--- a/drivers/gpu/drm/bridge/dw_hdmi.c
+++ b/drivers/gpu/drm/bridge/dw_hdmi.c
@@ -126,16 +126,39 @@ struct dw_hdmi {
 
 	unsigned int sample_rate;
 	int ratio;
+	void (*write)(u8 val, void __iomem *addr);
+	u8 (*read)(void __iomem *addr);
+	int reg_shift;
 };
 
+static void dw_hdmi_writel(u8 val, void __iomem *addr)
+{
+	writel(val, addr);
+}
+
+static u8 dw_hdmi_readl(void __iomem *addr)
+{
+	return readl(addr);
+}
+
+static void dw_hdmi_writeb(u8 val, void __iomem *addr)
+{
+	writeb(val, addr);
+}
+
+static u8 dw_hdmi_readb(void __iomem *addr)
+{
+	return readb(addr);
+}
+
 static inline void hdmi_writeb(struct dw_hdmi *hdmi, u8 val, int offset)
 {
-	writeb(val, hdmi->regs + offset);
+	hdmi->write(val, hdmi->regs + (offset << hdmi->reg_shift));
 }
 
 static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
 {
-	return readb(hdmi->regs + offset);
+	return hdmi->read(hdmi->regs + (offset << hdmi->reg_shift));
 }
 
 static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
@@ -1499,6 +1522,36 @@ static int dw_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *ddc_node;
 	struct resource *iores;
 	int ret, irq;
+	u32 val = 1;
+
+	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
+
+	hdmi->plat_data = plat_data;
+	hdmi->dev = &pdev->dev;
+	hdmi->dev_type = plat_data->dev_type;
+	hdmi->sample_rate = 48000;
+	hdmi->ratio = 100;
+	hdmi->encoder = encoder;
+
+	of_property_read_u32(np, "reg-io-width", &val);
+
+	switch (val) {
+	case 4:
+		hdmi->write = dw_hdmi_writel;
+		hdmi->read = dw_hdmi_readl;
+		hdmi->reg_shift = 2;
+		break;
+	case 1:
+		hdmi->write = dw_hdmi_writeb;
+		hdmi->read = dw_hdmi_readb;
+		hdmi->reg_shift = 0;
+		break;
+	default:
+		dev_err(dev, "reg-io-width must be 1 or 4\n");
+		return -EINVAL;
+	}
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
-- 
1.9.1
