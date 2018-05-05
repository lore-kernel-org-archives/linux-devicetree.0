Return-Path: <SRS0=wpgf=HY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from m12-16.163.com ([220.181.12.16]:59094 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751057AbeEEKLG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 5 May 2018 06:11:06 -0400
From: sunjg79@163.com
Subject: [PATCH v2 0/2] add support for HiSilicon STB xHCI host controller
Date: Sat,  5 May 2018 18:09:48 +0800
Message-Id: <1525514990-18207-1-git-send-email-sunjg79@163.com>
Sender: devicetree-owner@vger.kernel.org
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: shawn.guo@linaro.org, xuejiancheng@hisilicon.com, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

From: Jianguo Sun <sunjianguo1@huawei.com>

This patch set adds bindings doc and xhci driver for xHCI host controller
on HiSilicon STB SoCs.

v2 changes:
  - add optional properties in bindings doc
  - assign the value of imod_interval
  - remove unnecessary codes

Jianguo Sun (2):
  dt-bindings: usb: add bindings doc for HiSilicon STB xHCI host
    controller
  xhci: hisilicon: support HiSilicon STB xHCI host controller

 .../bindings/usb/hisilicon,histb-xhci.txt          |  46 +++
 drivers/usb/host/Kconfig                           |   7 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/xhci-histb.c                      | 413 +++++++++++++++++++++
 4 files changed, 467 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
 create mode 100644 drivers/usb/host/xhci-histb.c

-- 
2.7.4


