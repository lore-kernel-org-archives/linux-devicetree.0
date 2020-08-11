Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C510C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 08:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593EB20781
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 08:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgHKICf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 04:02:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:51706 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728064AbgHKICf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Aug 2020 04:02:35 -0400
X-IronPort-AV: E=Sophos;i="5.75,460,1589209200"; 
   d="scan'208";a="54355748"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Aug 2020 17:02:33 +0900
Received: from localhost.localdomain (unknown [172.29.52.148])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5D7184007529;
        Tue, 11 Aug 2020 17:02:31 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/5] Remodel HD3SS3220 device nodes
Date:   Tue, 11 Aug 2020 09:02:22 +0100
Message-Id: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some platforms have only super speed data bus connected to HD3SS3220 device
and high speed data bus directly connected to the SoC. In such platforms
modelling connector as a child of this device is making it non compliant
with usb connector bindings. By modelling connector node as standalone
device node along with HD3SS3220 device and the SoC data bus will make it
compliant with usb connector bindings.

It is based on the below discussion threads

1) https://patchwork.kernel.org/patch/11669423/
2) https://patchwork.kernel.org/patch/11129567/


Biju Das (4):
  dt-bindings: usb: renesas,usb3-peri: Document HS and SS data bus
  usb: typec: hd3ss3220: Use OF graph API to get the connector fwnode
  arm64: dts: renesas: cat874: Move connector node out of hd3ss3220
    device
  arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out
    of hd3ss3220 device

Lad Prabhakar (1):
  dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema

 .../bindings/usb/renesas,usb3-peri.yaml       | 36 +++++++--
 .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81 +++++++++++++++++++
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 67 +++++++++++----
 .../boot/dts/renesas/r8a774c0-cat874.dts      | 67 +++++++++++----
 drivers/usb/typec/hd3ss3220.c                 | 18 ++++-
 6 files changed, 225 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml

-- 
2.17.1

