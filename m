Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91221C43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73217205C9
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKVHLD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:11:03 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:61411 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVHLC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 02:11:02 -0500
X-Greylist: delayed 902 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Nov 2019 02:11:01 EST
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 22 Nov 2019
 14:56:24 +0800
From:   Hanjie Lin <hanjie.lin@amlogic.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Hanjie Lin <hanjie.lin@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
Date:   Fri, 22 Nov 2019 14:55:51 +0800
Message-ID: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support for USB on Amlogic A1 SoCs.

This patchset is composed with :
- bindings of the PHY
- bindings of the USB Control Glue
- PHY Driver
- USB Control Glue driver
- dts of the PHY
- dts of the USB Controller

The Amlogic A1 USB Complex is composed of :
- 1 DWC3 USB controller for USB2 Host functionality
- 1 USB2 PHY for USB2 Host functionality

The USB Control Glue setups the clocks and the reset about DWC3 USB
controller, and binds to the USB2 PHY. It also configures the 8bit
UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.

The USB2 PHY driver initializes the phy analog settings, phy PLL 
setup and phy tuning.

This patchset is based on A1 clock/power domain/reset series at [0].

[0]
https://patchwork.kernel.org/project/linux-amlogic/list/?series=185477
https://patchwork.kernel.org/project/linux-amlogic/list/?series=180055
https://patchwork.kernel.org/project/linux-amlogic/list/?series=189643

Hanjie Lin (6):
  dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
  dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
  phy: amlogic: Add Amlogic A1 USB2 PHY Driver
  usb: dwc3: Add Amlogic A1 DWC3 glue
  arm64: dts: meson: a1: Enable USB2 PHY
  arm64: dts: meson: a1: Enable DWC3 controller

 .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    |  55 +++
 .../devicetree/bindings/usb/amlogic,dwc3.txt       |  53 +++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  41 +++
 drivers/phy/amlogic/Kconfig                        |  13 +
 drivers/phy/amlogic/Makefile                       |   1 +
 drivers/phy/amlogic/phy-meson-a1-usb2.c            | 327 +++++++++++++++++
 drivers/usb/dwc3/Kconfig                           |  11 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-meson-a1.c                   | 397 +++++++++++++++++++++
 9 files changed, 899 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-a1-usb2.c
 create mode 100644 drivers/usb/dwc3/dwc3-meson-a1.c

-- 
2.7.4

