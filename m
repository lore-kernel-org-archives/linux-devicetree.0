From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 0/3] arm64: dts: add more nodes and properities for hi3798cv200-poplar board
Date: Wed, 18 Oct 2017 07:22:05 -0400
Message-ID: <1508325728-55823-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, project-aspen-dev@linaro.org, hermit.wangheming@hisilicon.com, xuejiancheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add more devices nodes and properties for poplar board, involving ir, emmc and pinctrl nodes.

Younian Wang (2):
  arm64: dts: hisilicon: supplement properties of ir node for poplar
    board
  arm64: dts: hisilicon: add pinctrl nodes for hi3798cv200-poplar board

tianshuliang (1):
  arm64: dts: hisilicon: supplement properties of emmc nodes for
    hi3798cv200-poplar board

 .../boot/dts/hisilicon/hi3798cv200-poplar.dts      |  13 +
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi     |  81 ++-
 arch/arm64/boot/dts/hisilicon/poplar-pinctrl.dtsi  | 651 +++++++++++++++++++++
 3 files changed, 742 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/hisilicon/poplar-pinctrl.dtsi

-- 
2.7.4
