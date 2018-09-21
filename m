From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/5] drm: rcar-du: Add r8a77470 support
Date: Fri, 21 Sep 2018 19:08:29 +0100
Message-ID: <1537553311-8831-4-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 02aee6c..c07d3f1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -77,6 +77,31 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 	},
 };
 
+static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
+	.gen = 2,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
+		  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
+	.channels_mask = BIT(1) | BIT(0),
+	.routes = {
+		/*
+		 * R8A77470 has two RGB outputs, one LVDS output, and
+		 * one analog video output (unsupported)
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DPAD1] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0) | BIT(1),
+			.port = 2,
+		},
+	},
+};
+
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
 	.gen = 2,
 	.features = 0,
@@ -297,6 +322,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
 	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
+	{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
 	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
 	{ .compatible = "renesas,du-r8a7790", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7791", .data = &rcar_du_r8a7791_info },
-- 
2.7.4
