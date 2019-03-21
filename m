From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 0/4] drm/panel: Add Novatek NT35596 panel
Date: Thu, 21 Mar 2019 19:29:51 +0530
Message-ID: <20190321135955.25661-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, Ryan Pannell <ryan@osukl.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

This is v2 series for Novatek NT35596 panel driver. here is previous
series set[2]

Since there is no proper programming guide for NT35596 IC, the driver 
init sequence is referenced from [1] but analyzed based on datasheet.

NT35596 support several regulators on the chip, among those ony 4
regulators like VCI, VDDI/DVDD, AVDD, AVEE are used during power-on
sequence. Right now driver added code for 3-regulator based power-on
sequence since MTF050FHDI-03 panel support. This power-on sequence may
be moved to panel_desc in future, if there is any new panel would come
up with other type of sequence.

Changes for v2:
- control enable/disable calls using enable, prepare flags
- comment on delays
- move 120ms delay on power-on since it is part of power-on sequence
- fix driver name as novatek-nt35596

[2] https://patchwork.freedesktop.org/series/57490/#rev1
[1] https://android.googlesource.com/kernel/msm/+/android-msm-shamu-3.10-lollipop-mr1/arch/arm/boot/dts/qcom/dsi-panel-nt35596-1080p-video.dtsi

Any inputs?
Jagan.

Jagan Teki (4):
  dt-bindings: Add vendor prefix for novatek
  dt-bindings: Add vendor prefix for microtech
  dt-bindings: display: Add Novatek NT35596 panel documentation
  drm/panel: Add Novatek NT35596 panel driver

 .../display/panel/novatek,nt35596.txt         |  32 +
 .../devicetree/bindings/vendor-prefixes.txt   |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt35596.c | 895 ++++++++++++++++++
 6 files changed, 949 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596.txt
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt35596.c

-- 
2.18.0.321.gffc6fa0e3
