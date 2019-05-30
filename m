From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/4] dt-bindings: msm/dsi: Add 10nm phy for msm8998 compatible
Date: Thu, 30 May 2019 09:00:23 -0700
Message-ID: <20190530160023.2773-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
Cc: sibis@codeaurora.org, chandanu@codeaurora.org, abhinavk@codeaurora.org, bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The DSI phy on MSM8998 is a 10nm design like SDM845, however it has some
slightly different quirks which need to be handled by drivers.  Provide
a separate compatible to assist in handling the specifics.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index 9ae946942720..af95586c898f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -88,6 +88,7 @@ Required properties:
   * "qcom,dsi-phy-28nm-8960"
   * "qcom,dsi-phy-14nm"
   * "qcom,dsi-phy-10nm"
+  * "qcom,dsi-phy-10nm-8998"
 - reg: Physical base address and length of the registers of PLL, PHY. Some
   revisions require the PHY regulator base address, whereas others require the
   PHY lane base address. See below for each PHY revision.
-- 
2.17.1
