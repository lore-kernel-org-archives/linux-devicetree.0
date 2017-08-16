From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [RFC PATCH 0/3] PCI: rockchip: Move PCIE_WAKE handling into rockchip pcie driver
Date: Wed, 16 Aug 2017 15:52:21 +0800
Message-ID: <20170816075224.31734-1-jeffy.chen@rock-chips.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, bhelgaas@google.com
Cc: shawn.lin@rock-chips.com, briannorris@chromium.org, dianders@chromium.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Currently we are handling pcie wake in mrvl wifi driver. But Brian
suggests to move it into rockchip pcie driver.

Tested on my chromebook bob(with cros 4.4 kernel and mrvl wifi).



Jeffy Chen (3):
  PCI: rockchip: Add support for pcie wake irq
  dt-bindings: PCI: rockchip: Add support for pcie wake irq
  arm64: dts: rockchip: Handle pcie wake in pcie driver for Gru

 .../devicetree/bindings/pci/rockchip-pcie.txt      | 11 ++--
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       | 17 ++++---
 drivers/pci/host/pcie-rockchip.c                   | 58 ++++++++++++++++++++++
 3 files changed, 76 insertions(+), 10 deletions(-)

-- 
2.11.0
