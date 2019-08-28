From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/3] dt-bindings: Convert Arm Mali GPUs to DT schema
Date: Wed, 28 Aug 2019 16:44:59 -0500
Message-ID: <20190828214502.12293-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series converts the various Arm Mali GPU bindings to use the DT
schema format.

The Midgard and Bifrost bindings generate warnings on 'interrupt-names'
because there's all different ordering. The Utgard binding generates 
warnings on Rockchip platforms because 'clock-names' order is reversed.

v2:
 - Make 'clocks' always required.

Rob

Rob Herring (3):
  dt-bindings: Convert Arm Mali Midgard GPU to DT schema
  dt-bindings: Convert Arm Mali Bifrost GPU to DT schema
  dt-bindings: Convert Arm Mali Utgard GPU to DT schema

 .../bindings/gpu/arm,mali-bifrost.txt         |  92 ----------
 .../bindings/gpu/arm,mali-bifrost.yaml        | 116 ++++++++++++
 .../bindings/gpu/arm,mali-midgard.txt         | 119 -------------
 .../bindings/gpu/arm,mali-midgard.yaml        | 165 +++++++++++++++++
 .../bindings/gpu/arm,mali-utgard.txt          | 129 --------------
 .../bindings/gpu/arm,mali-utgard.yaml         | 168 ++++++++++++++++++
 6 files changed, 449 insertions(+), 340 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml

-- 
2.20.1
