From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 00/15] Conversion of panel bindings to DT schema
Date: Mon, 24 Jun 2019 15:56:34 -0600
Message-ID: <20190624215649.8939-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

This series converts the common panel bindings to DT schema format. 
Besides the conversion of common panel properties, a few panel bindings 
are converted here as well. These are all the ones with references to 
panel-common.txt or panel-lvds.txt.

Rob

Rob Herring (15):
  dt-bindings: display: rockchip-lvds: Remove panel references
  dt-bindings: display: Convert common panel bindings to DT schema
  dt-bindings: display: Convert ampire,am-480272h3tmqw-t01h panel to DT
    schema
  dt-bindings: display: Convert armadeus,st0700-adapt panel to DT schema
  dt-bindings: display: Convert bananapi,s070wv20-ct16 panel to DT
    schema
  dt-bindings: display: Convert dlc,dlc0700yzg-1 panel to DT schema
  dt-bindings: display: Convert pda,91-00156-a0 panel to DT schema
  dt-bindings: display: Convert raspberrypi,7inch-touchscreen panel to
    DT schema
  dt-bindings: display: Convert tfc,s9700rtwv43tr-01b panel to DT schema
  dt-bindings: display: Convert tpo,tpg110 panel to DT schema
  dt-bindings: display: Convert panel-lvds to DT schema
  dt-bindings: display: Convert innolux,ee101ia-01 panel to DT schema
  dt-bindings: display: Convert mitsubishi,aa104xd12 panel to DT schema
  dt-bindings: display: Convert mitsubishi,aa121td01 panel to DT schema
  dt-bindings: display: Convert sgd,gktw70sdae4se panel to DT schema

 .../panel/ampire,am-480272h3tmqw-t01h.txt     |  26 ---
 .../panel/ampire,am-480272h3tmqw-t01h.yaml    |  42 +++++
 .../display/panel/arm,versatile-tft-panel.txt |   2 +-
 .../display/panel/armadeus,st0700-adapt.txt   |   9 --
 .../display/panel/armadeus,st0700-adapt.yaml  |  27 ++++
 .../display/panel/bananapi,s070wv20-ct16.txt  |  12 --
 .../display/panel/bananapi,s070wv20-ct16.yaml |  24 +++
 .../display/panel/dlc,dlc0700yzg-1.txt        |  13 --
 .../display/panel/dlc,dlc0700yzg-1.yaml       |  28 ++++
 .../display/panel/innolux,ee101ia-01d.txt     |   7 -
 .../display/panel/innolux,ee101ia-01d.yaml    |  22 +++
 .../bindings/display/panel/lvds.yaml          | 107 +++++++++++++
 .../display/panel/mitsubishi,aa104xd12.txt    |  47 ------
 .../display/panel/mitsubishi,aa104xd12.yaml   |  71 +++++++++
 .../display/panel/mitsubishi,aa121td01.txt    |  47 ------
 .../display/panel/mitsubishi,aa121td01.yaml   |  69 ++++++++
 .../bindings/display/panel/panel-common.txt   | 101 ------------
 .../bindings/display/panel/panel-common.yaml  | 149 ++++++++++++++++++
 .../bindings/display/panel/panel-lvds.txt     | 121 --------------
 .../bindings/display/panel/panel.txt          |   4 -
 .../display/panel/pda,91-00156-a0.txt         |  14 --
 .../display/panel/pda,91-00156-a0.yaml        |  25 +++
 .../panel/raspberrypi,7inch-touchscreen.txt   |  49 ------
 .../panel/raspberrypi,7inch-touchscreen.yaml  |  71 +++++++++
 .../display/panel/sgd,gktw70sdae4se.txt       |  41 -----
 .../display/panel/sgd,gktw70sdae4se.yaml      |  63 ++++++++
 .../bindings/display/panel/simple-panel.txt   |  29 +---
 .../display/panel/tfc,s9700rtwv43tr-01b.txt   |  15 --
 .../display/panel/tfc,s9700rtwv43tr-01b.yaml  |  30 ++++
 .../bindings/display/panel/tpo,tpg110.txt     |  70 --------
 .../bindings/display/panel/tpo,tpg110.yaml    | 101 ++++++++++++
 .../display/rockchip/rockchip-lvds.txt        |  11 --
 32 files changed, 831 insertions(+), 616 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/ampire,am-480272h3tmqw-t01h.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/armadeus,st0700-adapt.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/armadeus,st0700-adapt.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/lvds.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-common.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-lvds.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/panel.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscreen.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tfc,s9700rtwv43tr-01b.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/tpo,tpg110.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml

-- 
2.20.1
