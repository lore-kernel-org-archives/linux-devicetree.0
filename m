From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/3] drm/bridge: various small lvds-encoder things
Date: Tue, 18 Dec 2018 23:19:11 +0000
Message-ID: <20181218231850.3572-1-peda@axentia.se>
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

These patches are useful for me. Please consider merging.

Cheers,
Peter

Peter Rosin (3):
  dt-bindings: display: bridge: lvds-transmitter: add ti,ds90c187
  dt-bindings: display: bridge: lvds-transmitter: add pwdn-gpios
  drm/bridge: add pwdn-gpios support to the lvds-encoder

 .../bindings/display/bridge/lvds-transmitter.txt   |  4 +++
 drivers/gpu/drm/bridge/lvds-encoder.c              | 34 ++++++++++++++++++=
++++
 2 files changed, 38 insertions(+)

--=20
2.11.0
