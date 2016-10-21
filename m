From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 0/2] Add new resets for pcie-rockchip
Date: Fri, 21 Oct 2016 10:43:54 +0800
Message-ID: <1477017836-19317-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Brian Norris <briannorris@chromium.org>, linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: devicetree@vger.kernel.org


Hi Bjorn and Heiko,

Sorry for updating pcie-rockchip so frequently under this development
cycle. This patch is going to fix a urgent issue of missing control for
pm_rst, aclk_rst and pclk_rst. These three resets was controlled by rom code
but now the driver will take over it in order to solve some weird issues
found by MP test. Thanks to that it is still under MP test internally, so
the backward compatibility of dtb won't be a big deal.

And there are still some on-going patches for pcie-rockchip on linux-pci
wasn't merged. All of them was also rebased on your next branch, so hope there
is no conflict if you wish to pick them(including this patch 1), otherwise I could
rebase all of them again. :)



Shawn Lin (2):
  PCI: rockchip: Add three new resets as required properties
  arm64: dts: rockchip: add three new resets for rk3399 PCIe controller

 .../devicetree/bindings/pci/rockchip-pcie.txt      | 11 ++--
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  7 ++-
 drivers/pci/host/pcie-rockchip.c                   | 62 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 5 deletions(-)

-- 
2.3.7
