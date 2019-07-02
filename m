From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH 0/3] drm/bridge: sii902x: fix audio mclk management
Date: Tue, 2 Jul 2019 17:47:03 +0200
Message-ID: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.hajda@samsung.com, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@st.com, jsarha@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix audio master clock use for Silab sii902x HDMI transceiver.
Make audio master clock optional, as this clock is not mandatory.

Olivier Moysan (3):
  drm/bridge: sii902x: fix missing reference to mclk clock
  dt-bindings: display: sii902x: Change audio mclk binding
  drm/bridge: sii902x: make audio mclk optional

 .../devicetree/bindings/display/bridge/sii902x.txt |  5 ++-
 drivers/gpu/drm/bridge/sii902x.c                   | 40 +++++++++++++---------
 2 files changed, 26 insertions(+), 19 deletions(-)

-- 
2.7.4
