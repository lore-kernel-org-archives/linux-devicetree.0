Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBE1C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AB79206F9
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgEKLGf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:06:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49078 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgEKLGf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 07:06:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 941502A0C4B
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: [PATCH v2 0/6] Convert adi,adv7511.txt DT bindings to yaml
Date:   Mon, 11 May 2020 13:06:05 +0200
Message-Id: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
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

The changes to the dts files are of three types:

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

  - Removing unneeded properties.

About the binding conversion:

  - The original binding covered five different devices: ADV7511,
    ADV7511W, ADV7513, ADV7533 and ADV7535. They all share a common set
    of properties but ADV7533 and ADV7535 have enough differences from
    the rest to warrant their own binding file. In v1 I modelled all the
    properties constraints for all five devices in a single file but it
    turned out a bit too complex. Splitting the binding into one for
    ADV7511/11W/13 and another for ADV7533/35 makes them much easier to
    read and maintain.

Patches 1/6 to 5/6 contain the dts changes. Patch 6/6 contains the
binding conversion.

NOTE: the bindings have been tested with:

  make dt_binding_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7511.yaml>
  make dtbs_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7511.yaml>

for <arch> = arm and arm64. dts changes haven't been tested in hardware.

Changes in v2:

  - [Rob] adi,adv7511.yaml split into two files: adi,adv7511.yaml and
    adi,adv7533.yaml.

  - [Rob] Remove maxItems from supplies.

  - Additional DTs fixes:
    - iwg20d-q7-dbcm-ca.dtsi
    - r8a7745-iwg22d-sodimm-dbhd-ca.dts
    - r8a7790-lager.dts
    - r8a7790-stout.dts  
    - r8a7791-koelsch.dts
    - r8a7791-porter.dts
    - r8a7792-blanche.dts
    - r8a7793-gose.dts
    - r8a7794-silk.dts
    - hi6220-hikey.dts
    - r8a77970-eagle.dts
    - r8a77970-v3msk.dts
    - r8a77980-condor.dts
    - r8a77980-v3hsk.dts
    - r8a77990-ebisu.dts

Kind regards,
Ricardo

Ricardo Cañuelo (6):
  arm64: dts: renesas: make hdmi encoder nodes compliant with DT
    bindings
  ARM: dts: renesas: make hdmi encoder nodes compliant with DT bindings
  ARM: dts: zynq: add port definitions to hdmi-tx@39
  arm64: dts: hisilicon: hikey: fixes to comply with adi,adv7533 DT
    binding
  ARM: dts: iwg20d-q7-dbcm-ca: remove unneeded properties in hdmi@39
  dt-bindings: drm: bridge: adi,adv7511.txt: convert to yaml

 .../bindings/display/bridge/adi,adv7511.txt   | 143 -----------
 .../bindings/display/bridge/adi,adv7511.yaml  | 230 ++++++++++++++++++
 .../bindings/display/bridge/adi,adv7533.yaml  | 166 +++++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi      |   2 -
 .../dts/r8a7745-iwg22d-sodimm-dbhd-ca.dts     |   2 -
 arch/arm/boot/dts/r8a7790-lager.dts           |   2 -
 arch/arm/boot/dts/r8a7790-stout.dts           |   2 -
 arch/arm/boot/dts/r8a7791-koelsch.dts         |   2 -
 arch/arm/boot/dts/r8a7791-porter.dts          |   2 -
 arch/arm/boot/dts/r8a7792-blanche.dts         |   2 -
 arch/arm/boot/dts/r8a7792-wheat.dts           |  12 +-
 arch/arm/boot/dts/r8a7793-gose.dts            |   2 -
 arch/arm/boot/dts/r8a7794-silk.dts            |   2 -
 arch/arm/boot/dts/zynq-zc702.dts              |  10 +
 arch/arm/boot/dts/zynq-zc706.dts              |  10 +
 .../boot/dts/hisilicon/hi3660-hikey960.dts    |  11 +
 .../arm64/boot/dts/hisilicon/hi6220-hikey.dts |   2 +-
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts |   2 -
 .../arm64/boot/dts/renesas/r8a77970-v3msk.dts |   2 -
 .../boot/dts/renesas/r8a77980-condor.dts      |   2 -
 .../arm64/boot/dts/renesas/r8a77980-v3hsk.dts |   2 -
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |   2 -
 .../arm64/boot/dts/renesas/r8a77995-draak.dts |   6 +-
 23 files changed, 434 insertions(+), 184 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml

-- 
2.18.0

