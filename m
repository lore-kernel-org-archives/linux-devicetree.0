From: Ronen Krupnik <ronenk@amazon.com>
Subject: [PATCH 0/2] Amazon Annapurna Labs Alpine v3 device-tree
Date: Sun, 28 Jul 2019 22:51:33 +0300
Message-ID: <20190728195135.12661-1-ronenk@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, barakw@amazon.com, dwmw@amazon.co.uk, benh@amazon.com, jonnyc@amazon.com, talel@amazon.com, hhhawa@amazon.com, hanochu@amazon.com, Ronen Krupnik <ronenk@amazon.com>
List-Id: devicetree@vger.kernel.org

This series introduces the device tree for Amazon Annapurna Labs Alpine v3
SoC and Evaluation Board.

Ronen Krupnik (2):
  dt-bindings: amazon: add Amazon Annapurna Labs Alpine support
  arm64: dts: amazon: add Amazon Annapurna Labs Alpine v3 support

 .../devicetree/bindings/arm/amazon,alpine.txt |  23 ++
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/amazon/Makefile           |   1 +
 arch/arm64/boot/dts/amazon/alpine-v3-evp.dts  |  23 ++
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi     | 371 ++++++++++++++++++
 5 files changed, 419 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amazon,alpine.txt
 create mode 100644 arch/arm64/boot/dts/amazon/Makefile
 create mode 100644 arch/arm64/boot/dts/amazon/alpine-v3-evp.dts
 create mode 100644 arch/arm64/boot/dts/amazon/alpine-v3.dtsi

-- 
2.21.0
