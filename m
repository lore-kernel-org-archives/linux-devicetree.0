From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v2 0/5] Panel rotation patches
Date: Mon, 10 Jun 2019 21:03:45 -0700
Message-ID: <20190611040350.90064-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds the plumbing for reading panel rotation from the devicetree
and sets up adding a panel property for the panel orientation on
Mediatek SoCs when a rotation is present.

v2 changes:
fixed build errors in i915

Derek Basehore (5):
  drm/panel: Add helper for reading DT rotation
  dt-bindings: display/panel: Expand rotation documentation
  drm/panel: Add attach/detach callbacks
  drm/connector: Split out orientation quirk detection
  drm/mtk: add panel orientation property

 .../bindings/display/panel/panel.txt          | 32 +++++++++++
 drivers/gpu/drm/drm_connector.c               | 16 ++----
 drivers/gpu/drm/drm_panel.c                   | 55 +++++++++++++++++++
 drivers/gpu/drm/i915/vlv_dsi.c                | 13 +++--
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  8 +++
 include/drm/drm_connector.h                   |  2 +-
 include/drm/drm_panel.h                       | 11 ++++
 7 files changed, 120 insertions(+), 17 deletions(-)

-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
