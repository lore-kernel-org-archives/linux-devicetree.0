From: Peter Rosin <peda@lysator.liu.se>
Subject: [PATCH v2 0/3] drm/bridge: various small lvds-encoder things
Date: Wed, 19 Dec 2018 14:04:46 +0100
Message-ID: <20181219130449.31641-1-peda@lysator.liu.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Peter Rosin <peda@axentia.se>

Hi!

I'm not sure if I should have added the texas chips to the lvds_encoder_match
list in the driver, right next to the thine,thc63lvdm83d entry, but ended
up not doing that. That can always be added later, it needed...

Changes since v1:
- fork out the bindings for the texas chips into their own file in order
  to avoid clutter in the generic lvds-transmitter binding.
- added a patch to remove some surplus stuff in the generic lvds-transmitter
  binding.

Cheers,
Peter

Peter Rosin (3):
  dt-bindings: display: bridge: fork out ti,ds90c185 from
    lvds-transmitter
  dt-bindings: display: bridge: lvds-transmitter: cleanup example
  drm/bridge: add pwdn-gpios support to the lvds-encoder

 .../bindings/display/bridge/lvds-transmitter.txt   | 10 +---
 .../bindings/display/bridge/ti,ds90c185.txt        | 55 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/lvds-encoder.c              | 34 +++++++++++++
 3 files changed, 90 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt

-- 
2.11.0
