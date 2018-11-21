From: <Eugen.Hristev@microchip.com>
Subject: [PATCH 0/3] drm: Add panel support for PDA 91-00156-A0
Date: Wed, 21 Nov 2018 08:47:54 +0000
Message-ID: <1542789804-4584-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Cc: Cristian.Birsan@microchip.com, Eugen.Hristev@microchip.com
List-Id: devicetree@vger.kernel.org

Hello,

This patch series adds support for PDA (Precision Design Associates, Inc.)
vendor, and for the PDA 91-00156-A0 simple panel, together with the binding=
s.

The series is on top of http://anongit.freedesktop.org/git/drm/drm.git drm-=
next
branch.

Cristian Birsan (1):
  dt-bindings: drm/panel: simple: add support for PDA 91-00156-A0

Eugen Hristev (2):
  dt-bindings: add vendor prefix for PDA Precision Design Associates,
    Inc.
  drm/panel: simple: add support for PDA 91-00156-A0 panel

 .../bindings/display/panel/pda,91-00156-a0.txt     |  7 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++=
++++
 3 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-=
00156-a0.txt

--=20
2.7.4
