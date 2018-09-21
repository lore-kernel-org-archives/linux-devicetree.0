From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/5] drm: rcar-du: Add R8A7744 support
Date: Fri, 21 Sep 2018 19:08:30 +0100
Message-ID: <1537553311-8831-5-git-send-email-fabrizio.castro@bp.renesas.com>
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

From: Biju Das <biju.das@bp.renesas.com>

Add support for the R8A7744 DU (which is very similar to the R8A7743 DU);
it has 1 DPAD (RGB) output and 1 LVDS output.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index c07d3f1..2c3d0e5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -321,6 +321,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
+	{ .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
 	{ .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
 	{ .compatible = "renesas,du-r8a77470", .data = &rzg1_du_r8a77470_info },
 	{ .compatible = "renesas,du-r8a7779", .data = &rcar_du_r8a7779_info },
-- 
2.7.4
