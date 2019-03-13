From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] dt-bindings: meson: Add G12A display bindings
Date: Wed, 13 Mar 2019 15:10:27 +0100
Message-ID: <20190313141030.5958-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds the G12A specific bindings for the Display VPU
and VPU Power Control.

The Amlogic Meson G12A Display module is based on the Meson GXM SoC
with an updated Plane Blender, thus VPU architecture and interconnect
is the same.

Implementation then DT nodes will come in a further patchsets.

Neil Armstrong (3):
  dt-bindings: display: amlogic,meson-vpu: Add G12A compatible and ports
  dt-bindings: display: amlogic,meson-dw-hdmi: Add G12A compatible and
    ports
  dt-bindings: power: amlogic,meson-gx-pwrc: Add G12A compatible

 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
 .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
 .../devicetree/bindings/power/amlogic,meson-gx-pwrc.txt       | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.20.1
