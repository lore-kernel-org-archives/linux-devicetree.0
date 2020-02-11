Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435B7C352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 11:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 232AA20848
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 11:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgBKLMI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 06:12:08 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:17571 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbgBKLMI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Feb 2020 06:12:08 -0500
Received: from droid10.amlogic.com (10.18.11.213) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Tue, 11 Feb 2020
 19:12:46 +0800
From:   Hanjie Lin <hanjie.lin@amlogic.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH v8 0/3] arm64: meson: Add support for USB on Amlogic A1
Date:   Tue, 11 Feb 2020 19:10:51 +0800
Message-ID: <1581419454-12667-1-git-send-email-hanjie.lin@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.18.11.213]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds support for USB on Amlogic A1 SoCs.

Because of my mistake I fogot to add PHY maintainer(Kishon) to mail list in
before versions, so I have to send this v8 version again(only with dwc3
bindings and driver patch removed).
Sorry for this again.

This patchset is composed with :
- bindings of the PHY
- bindings of the USB Control Glue(already accepted in v7)
- PHY Driver
- USB Control Glue driver(already accepted in v7)
- dts of the PHY and USB Controller

The Amlogic A1 USB Complex is composed of :
- 1 DWC3 USB controller for USB2 Host functionality
- 1 USB2 PHY for USB2 Host functionality

The USB Control Glue setups the clocks and the reset about DWC3 USB
controller, and binds to the USB2 PHY. It also configures the 8bit
UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.

The USB2 PHY driver initializes the phy analog settings, phy PLL 
setup and phy tuning.

This patchset is based on A1 clock/power domain/reset series at [0].

Changes since v1:[1]
 - integrate glue and phy drivers into g12a's
 
Changes since v2:[2]
 - modify amlogic,meson-g12a-usb-ctrl.yaml with dt_binding_check tool
 - phy/glue driver use of_device_get_match_data to distinguish A1 from G12A

Changes since v3:[3]
 - fix bindings mistakes of the PHY according Rob's comments
 - fix bindings mistakes of the USB Control Glue according Rob's comments
 - phy driver add xtal_usb_phy clock which moved from glue driver
 - glue driver use otg_mode instead of soc_id to support otg function

Changes since v4:[4]
 - phy driver revert reset-names changes
 - phy driver change clock name to "xtal" to consistent with g12a
 - glue driver add drvdata otg_switch_supported

Changes since v5:[5]
 - integrate phy bindings into g12a
 - modify glue bindings format according to martin's advices
 - glue driver add dwc3_meson_g12a_otg_init() do otg related work
 - glue driver add clk_bulk_disable_unprepare() in remove

Changes since v6:[6]
 - fix glue bindings dt_check_bindings error.
 - squash phy and glue dts patches and set usb status to disabled default

Changes since v7:[7]
 - remove already accepted dwc3 bindings and driver patch.
 
[0]
https://patchwork.kernel.org/project/linux-amlogic/list/?series=185477
https://patchwork.kernel.org/project/linux-amlogic/list/?series=180055
https://patchwork.kernel.org/project/linux-amlogic/list/?series=189643

[1] : https://lore.kernel.org/linux-amlogic/1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com

[2] : https://lore.kernel.org/linux-amlogic/1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com

[3] : https://lore.kernel.org/linux-amlogic/1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com

[4] : https://lore.kernel.org/linux-amlogic/1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com

[5] : https://lore.kernel.org/linux-amlogic/1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com

[6] : https://lore.kernel.org/linux-amlogic/1579220504-110067-1-git-send-email-hanjie.lin@amlogic.com

[7] : https://lore.kernel.org/linux-amlogic/1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com

Hanjie Lin (3):
  dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
  phy: amlogic: Add Amlogic A1 USB2 PHY Driver
  arm64: dts: meson: a1: Enable USB2 PHY and DWC3 controller

 .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml  | 15 ++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 43 +++++++++++
 drivers/phy/amlogic/phy-meson-g12a-usb2.c          | 85 +++++++++++++++-------
 3 files changed, 117 insertions(+), 26 deletions(-)

-- 
2.7.4

