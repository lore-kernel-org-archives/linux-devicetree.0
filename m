From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v8 2/9] staging: imx-drm: imx-hdmi: return defer if can't get
 ddc i2c adapter
Date: Wed, 12 Nov 2014 20:01:36 +0800
Message-ID: <1415793696-5168-1-git-send-email-andy.yan@rock-chips.com>
References: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Andy yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

drm driver may probe before the i2c bus, so the driver should
defer probing until it is available

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- defer probe ddc i2c adapter

Changes in v3: None
Changes in v2: None

 drivers/staging/imx-drm/imx-hdmi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/imx-drm/imx-hdmi.c b/drivers/staging/imx-drm/imx-hdmi.c
index 79daec4..c2b035a 100644
--- a/drivers/staging/imx-drm/imx-hdmi.c
+++ b/drivers/staging/imx-drm/imx-hdmi.c
@@ -1611,8 +1611,11 @@ static int imx_hdmi_bind(struct device *dev, struct device *master, void *data)
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
 		hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
-		if (!hdmi->ddc)
+		if (!hdmi->ddc) {
 			dev_dbg(hdmi->dev, "failed to read ddc node\n");
+			of_node_put(ddc_node);
+			return -EPROBE_DEFER;
+		}
 
 		of_node_put(ddc_node);
 	} else {
-- 
1.9.1
