Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E08C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 14:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F657205CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 14:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgENOge (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 10:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgENOge (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 10:36:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6297EC061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 07:36:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 7C7962A2EDE
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie,
        shawnguo@kernel.org
Subject: [PATCH v2 0/4] dt-bindings: display: ti,tfp410.txt: convert to yaml
Date:   Thu, 14 May 2020 16:36:08 +0200
Message-Id: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series converts the DT binding documentation for the TI TFP410
DPI-to-DVI encoder to json-schema.

Some minor changes were made to two DTs in order to make them compliant
with the binding. These changes shouldn't have any functional effect.

This also fixes a minor bug in the ti-tfp410 driver that would cause a
wrong calculation of the setup and hold times when the de-skew feature
is enabled. The retrieval of the de-skew value from the DT has also been
updated to reflect the binding changes.

Changes in v2:

  - ti,tfp410.yaml
    - Set license as GPL-2.0-only (Sam Ravnborg)
    - Complete pclk-sample and bus-width comments (Sam)
    - Remove quotes from compatible value (Sam)
    - Remove the allOf keyword from the ti,deskew definition (Sam)
    - Set endpoint as optional in port definitions
    - Set a range for ti,deskew

  DTs fixes (added):
    - dove-sbc-a510.dts: s/powerdown-gpio/powerdown-gpios (Sam)
    - dove-sbc-a510.dts: Add dummy ports node
    - imx53-cx9020.dts: Group the ports in a ports node

  ti-tfp410.c (added):
    - Fix setup time and hold time calculation based on the deskew value
      (Laurent Pinchart)

Ricardo Cañuelo (4):
  ARM: dts: dove: Make the DT compliant with the ti,tfp410 binding
  ARM: dts: ims53: Group port definitions for the dvi-converter
  dt-bindings: display: ti,tfp410.txt: convert to yaml
  drm/bridge: tfp410: Fix setup and hold time calculation

 .../bindings/display/bridge/ti,tfp410.txt     |  66 ----------
 .../bindings/display/bridge/ti,tfp410.yaml    | 124 ++++++++++++++++++
 arch/arm/boot/dts/dove-sbc-a510.dts           |  13 +-
 arch/arm/boot/dts/imx53-cx9020.dts            |  25 ++--
 drivers/gpu/drm/bridge/ti-tfp410.c            |  10 +-
 5 files changed, 155 insertions(+), 83 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml

-- 
2.18.0

