From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Tue, 20 Aug 2019 14:59:56 -0500
Message-ID: <20190820195959.6126-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series converts the various Arm Mali GPU bindings to use the DT
schema format.

The Midgard and Bifrost bindings generate warnings on 'interrupt-names'
because there's all different ordering. The Utgard binding generates 
warnings on Rockchip platforms because 'clock-names' order is reversed.

Rob

Rob Herring (3):
  dt-bindings: Convert Arm Mali Midgard GPU to DT schema
  dt-bindings: Convert Arm Mali Bifrost GPU to DT schema
  dt-bindings: Convert Arm Mali Utgard GPU to DT schema

 .../bindings/gpu/arm,mali-bifrost.txt         |  92 ----------
 .../bindings/gpu/arm,mali-bifrost.yaml        | 115 ++++++++++++
 .../bindings/gpu/arm,mali-midgard.txt         | 119 -------------
 .../bindings/gpu/arm,mali-midgard.yaml        | 165 +++++++++++++++++
 .../bindings/gpu/arm,mali-utgard.txt          | 129 --------------
 .../bindings/gpu/arm,mali-utgard.yaml         | 166 ++++++++++++++++++
 6 files changed, 446 insertions(+), 340 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml

-- 
2.20.1
