Return-Path: <SRS0=v9pK=IB=163.com=sunjg79@kernel.org>
From: sunjg79@163.com
Subject: [PATCH v3 0/2] add support for HiSilicon STB xHCI host controller
Date: Mon, 14 May 2018 14:20:40 +0800
Message-Id: <1526278842-13883-1-git-send-email-sunjg79@163.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: shawn.guo@linaro.org, xuejiancheng@hisilicon.com, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

From: Jianguo Sun <sunjianguo1@huawei.com>

This patch set adds bindings doc and xhci driver for xHCI host controller
on HiSilicon STB SoCs.

changes in v3:
  - fix typo of "pipeE"
  - remove optional property of "quirk-broken-port-ped"

changes in v2:
  - add optional properties in bindings doc
  - assign the value of imod_interval
  - remove unnecessary codes

Jianguo Sun (2):
  dt-bindings: usb: add bindings doc for HiSilicon STB xHCI host
    controller
  xhci: hisilicon: support HiSilicon STB xHCI host controller

 .../bindings/usb/hisilicon,histb-xhci.txt          |  45 +++
 drivers/usb/host/Kconfig                           |   7 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/xhci-histb.c                      | 410 +++++++++++++++++++++
 4 files changed, 463 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
 create mode 100644 drivers/usb/host/xhci-histb.c

-- 
2.7.4
