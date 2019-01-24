From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v3 lora-next 0/4] net: lora: Add documentation for SX130x and SX125x parts
Date: Thu, 24 Jan 2019 14:53:05 +0000
Message-ID: <20190124145309.21698-1-ben.whitten@lairdtech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Whitten <ben.whitten@lairdtech.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds documentation for the SX130x and SX125x chips.
We are using the yaml binding format and this series builds with
'make dt_binding_check'.

This series is split such that the basic documentation can be taken
without clock components, as there is an ongoing problem running clk
over spi backed regmaps on certain spi controller drivers [1]

Thanks,
Ben Whitten

v2 -> v3
* Added the clock input and output names
* Limited the radio-spi node children names to radio@
* Fixed fallback compatible for SX1308 -> SX1301
v1 -> v2
* Dropped reset-gpios, radio-spi from required.
* Dropped spi-max-frequency from binding.
* Changed compatible to allow fallback from SX1308 to SX1301.
* Wording changes in commit and descriptions.
* Dual licence
* Incorperate Robs comments on child node and spi wrapper

[1] http://lists.infradead.org/pipermail/linux-lpwan/2018-December/000063.html


Ben Whitten (4):
  dt-bindings: lora: sx130x: add basic documentation
  dt-bindings: lora: sx125x: add basic documentation
  dt-bindings: lora: sx125x: add clock bindings
  dt-bindings: lora: sx130x: add clock bindings

 .../bindings/net/lora/semtech,sx125x.yaml     |  77 +++++++++
 .../bindings/net/lora/semtech,sx130x.yaml     | 151 ++++++++++++++++++
 2 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
 create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml

-- 
2.17.1
