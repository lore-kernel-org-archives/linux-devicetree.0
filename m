From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 4/4] drm/msm/dsi: Add support for MSM8998 DSI controller
Date: Thu, 30 May 2019 09:00:59 -0700
Message-ID: <20190530160059.2929-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: robh+dt@kernel.org, mark.rutland@arm.com, sibis@codeaurora.org, chandanu@codeaurora.org, abhinavk@codeaurora.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The DSI controller on the MSM8998 SoC is a 6G v2.0.0 controller which is
very similar to the v2.0.1 of SDM845.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index dcdfb1bb54f9..7dd17b59c69d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -118,6 +118,25 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const char * const dsi_msm8998_bus_clk_names[] = {
+	"iface", "bus", "core",
+};
+
+static const struct msm_dsi_config msm8998_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 2,
+		.regs = {
+			{"vdd", 367000, 16 },	/* 0.9 V */
+			{"vdda", 62800, 2 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_msm8998_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
+	.io_start = { 0xc994000, 0xc996000 },
+	.num_dsi = 2,
+};
+
 static const char * const dsi_sdm845_bus_clk_names[] = {
 	"iface", "bus",
 };
@@ -186,6 +205,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8916_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_1,
 		&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
+		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 16c507911110..4f63b57b19dc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3	0x10030000
 #define MSM_DSI_6G_VER_MINOR_V1_3_1	0x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
+#define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
-- 
2.17.1
