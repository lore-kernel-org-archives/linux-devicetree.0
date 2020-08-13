Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D0AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDA8D20771
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qA1YrFcf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHMB3g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHMB3f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771DCC061384
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 18:29:35 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9FCA2B7;
        Thu, 13 Aug 2020 03:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282170;
        bh=bd0qYrwzrJ4bHxah62yG+bSosA6MvnK/Qf6Qk4KfRec=;
        h=From:To:Cc:Subject:Date:From;
        b=qA1YrFcfzEx/YVld5LXlgsHPoUO6W2lFzzyWrjAL+0X/PoiJXBR+fRDb3nwNYFPww
         w5xF6VO5XX/Uz2ZKj3gNVJLpSsQM5C/3t8ix/43sPwRQQbeGhAW7RUoQ1msOEXRevN
         nlGAdZ/dXy1ait7uEcxrDl3FnSdlcu1rcHm79+Uk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 0/8] drm: mxsfb: Allow overriding bus width
Date:   Thu, 13 Aug 2020 04:29:02 +0300
Message-Id: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

This patch series adds support to the mxsfb driver for bus width
override. The need came from a hardware platform where a 18-bpp panel
had the R[5:0], G[5:0] and B[5:0] signals connected to LCD_DATA[7:2],
LCD_DATA[15:10] and LCD_DATA[23:18] instead of LCD_DATA[5:0],
LCD_DATA[11:6] and LCD_DATA[17:12]. The bus width, automatically
configured to 18 by querying the panel, is incorrect in this case, and
needs to be set to 24.

To solve this issue, a new bus-width DT property is added to the mxsfb
DT binding. Patch 1/8 first converts the binding to YAML, with a fix for
the compatible string values in 2/8. Patch 3/8 then adds the new
property, and 4/8 renames the binding file to fsl,lcdif.yaml to match
the usual naming convention. I've kept that patch last to make it easy
to drop should should mxsfb.yaml be preferred.

Patches 5/8 to 6/8 then fix the DT sources to match the LCDIF bindings,
as I noticed during the conversion that the compatible strings were
badly managed (see patch 2/8 for a longer explanation). Patch 7/8 drops
an unused clock from DT sources.

Patch 8/8 finally adds support for the bus-width property to the mxsfb
driver.

Laurent Pinchart (8):
  dt-bindings: display: mxsfb: Convert binding to YAML
  dt-bindings: display: mxsfb: Add and fix compatible strings
  dt-bindings: display: mxsfb: Add a bus-width endpoint property
  dt-bindings: display: mxsfb: Rename to fsl,lcdif.yaml
  ARM: dts: imx: Fix LCDIF compatible strings
  arm64: dts: imx8mq: Fix LCDIF compatible strings
  ARM: dts: imx: Remove unneeded LCDIF disp_axi clock
  drm: mxsfb: Add support for the bus-width DT property

 .../bindings/display/fsl,lcdif.yaml           | 135 ++++++++++++++++++
 .../devicetree/bindings/display/mxsfb.txt     |  87 -----------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/imx6sl.dtsi                 |   7 +-
 arch/arm/boot/dts/imx6sll.dtsi                |   7 +-
 arch/arm/boot/dts/imx6sx.dtsi                 |   4 +-
 arch/arm/boot/dts/imx6ul.dtsi                 |   7 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  26 ++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |   2 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |   8 +-
 11 files changed, 182 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt

-- 
Regards,

Laurent Pinchart

