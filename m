From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v3 0/5] add some quirks for Rockchip usb2-phy and add rv1108 SoCs' support
Date: Thu,  3 Aug 2017 16:09:08 +0800
Message-ID: <1501747753-6983-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, kever.yang@rock-chips.com, andy.yan@rock-chips.com, wmc@rock-chips.com, Frank Wang <frank.wang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

These series of patches add companion_grf_quirk and otg_mux interrupt for
rockchip usb2-phy. In addition, this change also add rv1108 usb2-phy support.

Changes from v2:
 - Amend otg-mux interrupt to be auto-detectable and update related dt-bindings.

Changes from v1:
 - Send the dt-bindings as a separate patch and cc devicetree list.

Frank Wang (5):
  phy: rockchip-inno-usb2: add companion grf quirk
  dt-bindings: phy-rockchip-inno-usb2: add companion grf quirk
  phy: rockchip-inno-usb2: add support for otg-mux interrupt
  dt-bindings: phy-rockchip-inno-usb2: add otg-mux interrupt
  phy: rockchip-inno-usb2: add support of usb2-phy for rv1108 SoCs

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |  11 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 218 ++++++++++++++++-----
 2 files changed, 177 insertions(+), 52 deletions(-)

-- 
2.0.0
