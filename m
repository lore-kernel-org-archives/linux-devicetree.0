Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0567C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 06:33:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94FD62074B
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 06:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgFAGdu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 02:33:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35268 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFAGdt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 02:33:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id A70C82A050B
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        xuwei5@hisilicon.com, michal.simek@xilinx.com,
        mcoquelin.stm32@gmail.com, marex@denx.de
Subject: [PATCH v3 0/4] Convert adi,adv7511.txt DT bindings to yaml
Date:   Mon,  1 Jun 2020 08:33:04 +0200
Message-Id: <20200601063308.13045-1-ricardo.canuelo@collabora.com>
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

Patches 1/4 to 3/4 contain the dts changes. Patch 4/4 contains the
binding conversion.

NOTE: the bindings have been tested with:

  make dt_binding_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7511.yaml>
  make dt_binding_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7533.yaml>
  make dtbs_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7511.yaml>
  make dtbs_check ARCH=<arch> DT_SCHEMA_FILES=<...adi,adv7533.yaml>

for <arch> = arm and arm64. dts changes haven't been tested in hardware.

Some existing DTs are expected to fail after this conversion.

Changes in v3:

  - Removed from the patch series (already in mainline):
    - arm64: dts: renesas: make hdmi encoder nodes compliant with DT bindings
    - ARM: dts: renesas: make hdmi encoder nodes compliant with DT bindings
    - ARM: dts: iwg20d-q7-dbcm-ca: remove unneeded properties in hdmi@39

  - Additional DTs fixes:
    - boot/dts/stm32mp15xx-dhcor-avenger96.dtsi.

  - [Laurent] adi,adv7511.yaml and adi,adv7533.yaml.
    - Documentation fixes and typos.
    - Removed unnecessary allOf's.
    - adi,embedded-sync data type changed to boolean.
    - Power supplies defined as required.
    - Examples updated.

Ricardo Cañuelo (4):
  ARM: dts: zynq: add port definitions to hdmi-tx@39
  arm64: dts: hisilicon: hikey: fixes to comply with adi,adv7533 DT
    binding
  ARM: dts: stm32: make hdmi-transmitter node compliant with DT bindings
  dt-bindings: drm: bridge: adi,adv7511.txt: convert to yaml

 .../bindings/display/bridge/adi,adv7511.txt   | 143 -----------
 .../bindings/display/bridge/adi,adv7511.yaml  | 231 ++++++++++++++++++
 .../bindings/display/bridge/adi,adv7533.yaml  | 175 +++++++++++++
 .../boot/dts/stm32mp15xx-dhcor-avenger96.dtsi |   6 +-
 arch/arm/boot/dts/zynq-zc702.dts              |  10 +
 arch/arm/boot/dts/zynq-zc706.dts              |  10 +
 .../boot/dts/hisilicon/hi3660-hikey960.dts    |  11 +
 .../arm64/boot/dts/hisilicon/hi6220-hikey.dts |   2 +-
 8 files changed, 440 insertions(+), 148 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml

-- 
2.18.0

