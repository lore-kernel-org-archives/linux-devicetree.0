From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: Add LG lp120up1 panel bindings
Date: Mon, 22 Feb 2016 19:01:43 +0800
Message-ID: <1456138904-15258-1-git-send-email-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <treding@nvidia.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Inki Dae <inki.dae@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Sean Paul <seanpaul@chromium.org>, Vincent Palatin <vpalatin@chromium.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengu>
List-Id: devicetree@vger.kernel.org

Add documentation for lp120up1 panel

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
 - add Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/lg,lp120up1.txt         |    7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt

diff --git a/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt b/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
new file mode 100644
index 0000000..8c5de69
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,lp120up1.txt
@@ -0,0 +1,7 @@
+LG 12.0" (1920x1280 pixels) TFT LCD panel
+
+Required properties:
+- compatible: should be "lg,lp120up1"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
1.7.9.5
