From: Ben Whitten <ben.whitten@gmail.com>
Subject: [PATCH v2 lora-next 0/4] net: lora: Add documentation for SX130x and SX125x parts
Date: Tue, 22 Jan 2019 18:07:25 +0000
Message-ID: <20190122180729.1834-1-ben.whitten@lairdtech.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-lpwan@lists.infradead.org, robh@kernel.org, Ben Whitten <ben.whitten@lairdtech.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds documentation for the SX130x and SX125x chips.
We are using the yaml binding format and this series builds with
'make dt_binding_check'.

Thanks,
Ben Whitten

Ben Whitten (4):
  dt-bindings: lora: sx130x: add basic documentation
  dt-bindings: lora: sx125x: add basic documentation
  dt-bindings: lora: sx125x: add clock bindings
  dt-bindings: lora: sx130x: add clock bindings

 .../bindings/net/lora/semtech,sx125x.yaml     |  72 ++++++++++
 .../bindings/net/lora/semtech,sx130x.yaml     | 133 ++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
 create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml

-- 
2.17.1
