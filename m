Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from m12-12.163.com ([220.181.12.12]:35571 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751519AbeEDJVQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 4 May 2018 05:21:16 -0400
From: sunjg79@163.com
Subject: [PATCH 0/2] add support for HiSilicon STB xHCI host controller
Date: Fri,  4 May 2018 17:20:43 +0800
Message-Id: <1525425645-17246-1-git-send-email-sunjg79@163.com>
Sender: devicetree-owner@vger.kernel.org
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc: shawn.guo@linaro.org, xuejiancheng@hisilicon.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Jianguo Sun <sunjianguo1@huawei.com>
List-ID: <devicetree@vger.kernel.org>

From: Jianguo Sun <sunjianguo1@huawei.com>

This patch set adds bindings doc and xhci driver for xHCI host controller
on HiSilicon STB SoCs.

Jianguo Sun (2):
  dt-bindings: usb: add bindings doc for HiSilicon STB xHCI host
    controller
  xhci: hisilicon: support HiSilicon STB xHCI host controller

 .../bindings/usb/hisilicon,histb-xhci.txt          |  40 ++
 drivers/usb/host/Kconfig                           |   7 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/xhci-histb.c                      | 409 +++++++++++++++++++++
 4 files changed, 457 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisilicon,histb-xhci.txt
 create mode 100644 drivers/usb/host/xhci-histb.c

-- 
2.7.4


