From: Damian Kos <dkos@cadence.com>
Subject: [PATCH v7 2/4] drm/dp: fix link probing for devices supporting DP 1.4+
Date: Wed, 30 Jan 2019 11:03:19 +0000
Message-ID: <1548846209-16406-3-git-send-email-dkos@cadence.com>
References: <1548846209-16406-1-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548846209-16406-1-git-send-email-dkos@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: dkos@cadence.com, rafalc@cadence.com, piotrs@cadence.com, quentin.schulz@bootlin.com, jbergsagel@ti.com, Quentin Schulz <quentin.schulz@free-electrons.com>
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@free-electrons.com>

DP 1.4 introduced a DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT bit in
DP_TRAINING_AUX_RD_INTERVAL register. If set, DPCD registers from
DP_DPCD_REV to DP_ADAPTER_CAP should be retrieved starting from
DP_DPCD_REV_EXTENDED. All registers are copied except DP_DPCD_REV,
DP_MAX_LINK_RATE and DP_DOWNSTREAMPORT_PRESENT which represent the
"true capabilities" of DPRX device.

Original DP_DPCD_REV, DP_MAX_LINK_RATE and DP_DOWNSTREAMPORT_PRESENT
might falsely return lower capabilities to "avoid interoperability
issues with some of the existing DP Source devices that malfunction
when they discover the higher capabilities within those three
registers.".

Before DP 1.4, DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT bit was reserved
and read 0 so it's safe to check against it even if DP revision is
<1.4

Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Signed-off-by: Damian Kos <dkos@cadence.com>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 54120b6319e7..4e36d708fdce 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -372,10 +372,38 @@ int drm_dp_link_probe(struct drm_dp_aux *aux, struct drm_dp_link *link)
 {
 	u8 values[3];
 	int err;
+	unsigned int addr;
 
 	memset(link, 0, sizeof(*link));
 
-	err = drm_dp_dpcd_read(aux, DP_DPCD_REV, values, sizeof(values));
+	/*
+	 * DP 1.4 introduced a DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT bit in
+	 * DP_TRAINING_AUX_RD_INTERVAL register. If set, DPCD registers from
+	 * DP_DPCD_REV to DP_ADAPTER_CAP should be retrieved starting from
+	 * DP_DPCD_REV_EXTENDED. All registers are copied except DP_DPCD_REV,
+	 * DP_MAX_LINK_RATE and DP_DOWNSTREAMPORT_PRESENT which represent the
+	 * "true capabilities" of DPRX device.
+	 *
+	 * Original DP_DPCD_REV, DP_MAX_LINK_RATE and DP_DOWNSTREAMPORT_PRESENT
+	 * might falsely return lower capabilities to "avoid interoperability
+	 * issues with some of the existing DP Source devices that malfunction
+	 * when they discover the higher capabilities within those three
+	 * registers.".
+	 *
+	 * Before DP 1.4, DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT bit was
+	 * reserved and read 0 so it's safe to check against it even if
+	 * DP revision is <1.4
+	 */
+	err = drm_dp_dpcd_readb(aux, DP_TRAINING_AUX_RD_INTERVAL, values);
+	if (err < 0)
+		return err;
+
+	if (values[0] & DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT)
+		addr = DP_DP13_DPCD_REV;
+	else
+		addr = DP_DPCD_REV;
+
+	err = drm_dp_dpcd_read(aux, addr, values, sizeof(values));
 	if (err < 0)
 		return err;
 
-- 
2.17.1
