From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: [PATCH 0/5] Add CDTech 4.3" and 7" to panel-simple
Date: Tue, 31 Jul 2018 01:11:12 +0200
Message-ID: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Giulio Benetti <giulio.benetti@micronovasrl.com>
List-Id: devicetree@vger.kernel.org

Add CDTech 4.3" S043WQ26H-CT7 support
Add CDTech 7" S070WV95-CT16 support

Giulio Benetti (5):
  dt-bindings: Add vendor prefix for CDTech(H.K.) Electronics Limited
  drm/panel: add panel CDTech S070WV95-CT16 to panel-simple
  dt-bindings: Add CDTech S070WV95-CT16 panel bindings
  drm/panel: add panel CDTech S043WQ26H-CT7 to panel-simple
  dt-bindings: Add CDTech S043WQ26H-CT7 panel bindings

 .../display/panel/cdtech,s043wq26h-ct7.txt    | 12 ++++
 .../display/panel/cdtech,s070wv95-ct16.txt    | 12 ++++
 .../devicetree/bindings/vendor-prefixes.txt   |  1 +
 drivers/gpu/drm/panel/panel-simple.c          | 55 +++++++++++++++++++
 4 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s043wq26h-ct7.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/cdtech,s070wv95-ct16.txt

-- 
2.17.1
