Return-Path: <SRS0=mas4=6P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB86BC47257
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 08:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC8612166E
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 May 2020 08:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbgEAIdT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 May 2020 04:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbgEAIdS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 May 2020 04:33:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7716AC035494
        for <devicetree@vger.kernel.org>; Fri,  1 May 2020 01:33:18 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 0D90E2A2C9F
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: [RFT PATCH 0/5] Convert adi,adv7511.txt DT bindings to yaml
Date:   Fri,  1 May 2020 10:32:22 +0200
Message-Id: <20200501083227.10886-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

This series convert the adi,adv7511.txt DT bindings to json-schema. As a
result of the conversion some dts files needed to be updated.

The changes to the dts files are of two types:

  - Reordering of the I2C slave addresses list of the ADV75xx node. The
    addresses in the 'reg' property and the matching names in
    'reg-names' for an I2C slave don't need to be in any particular
    order, but the DT schema defines these properties as a cell array
    and a string array respectively, which are ordered, so the
    definitions in the dts files must match the order in the binding.

  - Filling the minimum binding requirements. Most of the time this
    means creating a 'ports' node in the boards that don't define
    them. Note, however, that the purpose of this is simply to make the
    definition compliant with the binding. I didn't define any endpoints
    for the ports.

About the binding conversion:

  - The dependencies between properties are properly modelled but the
    result might look cluttered. If you find it hard to read or
    maintain, another option is to split the binding in two: one for the
    ADV7511/11w/13 and another one for the ADV7533/35.

Patches 1/5 to 4/5 contain the dts changes. Patch 5/5 contains the
binding conversion.

NOTE: the bindings have been tested with:

  make dt_binding_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7511.yaml>
  make dtbs_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7511.yaml>

for <arch> = arm and arm64. dts changes haven't been tested in hardware.

Kind regards,
Ricardo

Ricardo Cañuelo (5):
  arm64: dts: draak: Reorder hdmi-encoder@39 reg and reg-names
    properties
  ARM: dts: wheat: reorder reg and reg-names properties in hdmi bridges
  ARM: dts: zynq: add port definitions to hdmi-tx@39
  arm64: dts: hisilicon: hikey960: add missing hdmi bridge properties
  dt-bindings: drm: bridge: adi,adv7511.txt: convert to yaml

 .../bindings/display/bridge/adi,adv7511.txt   | 143 ---------
 .../bindings/display/bridge/adi,adv7511.yaml  | 295 ++++++++++++++++++
 arch/arm/boot/dts/r8a7792-wheat.dts           |   8 +-
 arch/arm/boot/dts/zynq-zc702.dts              |  10 +
 arch/arm/boot/dts/zynq-zc706.dts              |  10 +
 .../boot/dts/hisilicon/hi3660-hikey960.dts    |  11 +
 .../arm64/boot/dts/renesas/r8a77995-draak.dts |   4 +-
 7 files changed, 332 insertions(+), 149 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml

-- 
2.18.0

