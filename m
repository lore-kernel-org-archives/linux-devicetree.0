From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v3 0/5] drm/bridge: various small lvds-encoder things
Date: Sat, 29 Dec 2018 07:07:09 +0000
Message-ID: <20181229070649.21308-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Peter Rosin <peda@axentia.se>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi!

I'm not sure if I should have added the texas chips to the lvds_encoder_mat=
ch
list in the driver, right next to the thine,thc63lvdm83d entry, but ended
up not doing that. That can always be added later, if needed...

Changes since v2:
- changed from pwdn-gpios to powerdown-gpios after discussion with Rob with
  new patch 3/5 updating the thine,thc63lvdm83d binding as well as a
  consequence
- added patch 4/5 which helps keep lines shorter in the lvds-encoder driver
- added tag from Rob on patch 2/5

Changes since v1:
- fork out the bindings for the texas chips into their own file in order
  to avoid clutter in the generic lvds-transmitter binding.
- added a patch to remove some surplus stuff in the generic lvds-transmitte=
r
  binding.

Cheers,
Peter

Peter Rosin (5):
  dt-bindings: display: bridge: fork out ti,ds90c185 from
    lvds-transmitter
  dt-bindings: display: bridge: lvds-transmitter: cleanup example
  dt-bindings: display: bridge: thc63lvdm83d: use standard
    powerdown-gpios
  drm/bridge: lvds-encoder: add dev helper variable in .probe()
  drm/bridge: lvds-encoder: add powerdown-gpios support

 .../bindings/display/bridge/lvds-transmitter.txt   | 10 +---
 .../bindings/display/bridge/thine,thc63lvdm83d.txt |  2 +-
 .../bindings/display/bridge/ti,ds90c185.txt        | 55 ++++++++++++++++++=
++++
 drivers/gpu/drm/bridge/lvds-encoder.c              | 53 +++++++++++++++++-=
---
 4 files changed, 100 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds9=
0c185.txt

--=20
2.11.0
