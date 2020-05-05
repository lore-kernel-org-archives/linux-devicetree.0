Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76BEC47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E6C92078C
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgEEQw0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 12:52:26 -0400
Received: from foss.arm.com ([217.140.110.172]:45380 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729720AbgEEQw0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 12:52:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2688E31B;
        Tue,  5 May 2020 09:52:25 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E615A3F305;
        Tue,  5 May 2020 09:52:23 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
Date:   Tue,  5 May 2020 17:51:56 +0100
Message-Id: <20200505165212.76466-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The .dts files in the arch/arm64/boot/dts/arm directory describe several
boards and platforms provided by Arm Ltd. (mostly Juno and fastmodels).
Both the .dts files and some of their associated .yaml bindings were not
fully compliant, for some boards a simple dtc run complains already.
And make dtbs_check would create quite a list of violations.

This series attempts to fix all of them, although some are not yet
covered, as they require some discussion about potential binding or
DT schema changes.

The first three patches fix some minor omissions in the yaml bindings.
The rest of the series then address the violations that dtbs_check
reported: many node name scheme mismatches, some missing properties or
wrong child node handling. See the respective patches for more details.

After applying this series I still see the following warnings:
- vexpress-v2f-1xv7-ca53x2: leds: linux,default-trigger names not
  listed. The kernel provides triggers for each CPU core, which the DT
  tries to use. However cpu<x> is not listed in the binding, and I fail
  to add a regexp for a property *value* to express this easily.
  Alternatively we could drop any constraint on this string at all,
  since this might become a moving target and is not really a hardware
  property, rather than a convenience Linux configuration option.
- juno: scp-sram: The compatible names for the SCPI child nodes are not
  fully converted to yaml yet, so dtbs_check fails to find a matching
  schema. Converting the SCPI bindings over is next on my list.
- fvp-base-revc: panel: 'power-supply' is a required property
  Indeed the Linux driver depends on that property, not sure how this
  ever worked. I am about to test this, the fix should a rather easy
  addition of a fixed regulator.

Please have a look, I am open to discussions.

Cheers,
Andre

Andre Przywara (16):
  dt-bindings: mali-midgard: Allow dma-coherent
  dt-bindings: arm-smmu: Allow mmu-400,smmu-v1 compatible
  dt-bindings: ehci/ohci: Allow iommus property
  arm64: dts: arm: Fix node address fields
  arm64: dts: arm: FVP: Fix motherboard .dtsi
  arm64: dts: juno: Fix mem-timer
  arm64: dts: arm: Fix GIC compatible names
  arm64: dts: arm: Fix GIC child nodes
  arm64: dts: arm: Fix ITS node names and #msi-cells
  arm64: dts: juno: usb: Use proper DT node name
  arm64: dts: arm: Fix serial node names
  arm64: dts: fvp: Fix SMMU DT node
  arm64: dts: arm: Fix bus node names
  arm64: dts: juno: Fix GPU interrupt order
  arm64: dts: arm: Fix VExpress LED names
  arm64: dts: juno: Fix SCPI shared mem node name

 .../bindings/gpu/arm,mali-midgard.yaml        |   2 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |   4 +-
 .../devicetree/bindings/usb/generic-ehci.yaml |   3 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   3 +
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi       |  38 ++---
 .../boot/dts/arm/foundation-v8-gicv2.dtsi     |   4 +-
 .../boot/dts/arm/foundation-v8-gicv3.dtsi     |   3 +-
 arch/arm64/boot/dts/arm/foundation-v8.dtsi    |  12 +-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts     |  10 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi        |  44 ++---
 arch/arm64/boot/dts/arm/juno-motherboard.dtsi |   8 +-
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts    |   2 +-
 .../boot/dts/arm/rtsm_ve-motherboard-rs2.dtsi |   4 +-
 .../boot/dts/arm/rtsm_ve-motherboard.dtsi     | 152 +++++++++---------
 14 files changed, 150 insertions(+), 139 deletions(-)

-- 
2.17.1

