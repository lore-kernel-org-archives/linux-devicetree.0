From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v3 11/12] drm/panel: simple: Add boe,tv080wum-nl0 simple panel device tree binding
Date: Thu, 19 Nov 2015 11:35:29 +0800
Message-ID: <1447904131-29328-12-git-send-email-zyw@rock-chips.com>
References: <1447904131-29328-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447904131-29328-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, linux-rockchip@lists.infradead.org, Mark Yao <mark.yao@rock-chips.com>
Cc: Chris Zhong <zyw@rock-chips.com>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This binding specifies a set of common properties for display panels. It
can be used as a basis by bindings for specific panels.
Bindings for three specific panels are provided to show how the
simple panel binding can be used.

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

Changes in v3:
move boe,tv080wum-nl0.txt to bindings/display/panel/

Changes in v2:
As Thierry.Reding comment, add a documentation for this panel.

 .../devicetree/bindings/display/panel/boe,tv080wum-nl0.txt         | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt b/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
new file mode 100644
index 0000000..50be5e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv080wum-nl0.txt
@@ -0,0 +1,7 @@
+Boe Corporation 8.0" WUXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "boe,tv080wum-nl0"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
2.6.3
