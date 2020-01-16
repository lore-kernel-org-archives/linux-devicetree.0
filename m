Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B81C32771
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 00:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28AFF2467A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 00:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729025AbgAPA5M (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 19:57:12 -0500
Received: from foss.arm.com ([217.140.110.172]:43776 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726310AbgAPA5M (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jan 2020 19:57:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B0A131B;
        Wed, 15 Jan 2020 16:57:12 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 897F03F718;
        Wed, 15 Jan 2020 16:57:10 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: sun50i: H6: Enable SPI controller
Date:   Thu, 16 Jan 2020 00:56:51 +0000
Message-Id: <20200116005654.27672-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Even though the SPI controller in the Allwinner H6 SoC is more advanced
than in the previous generations (it supports 3-wire and 4-wire mode),
the register set stays backwards-compatible. So we can use the existing
driver to use the "normal" SPI mode, for instance to access the SPI
flash soldered on the Pine H64 board.

These two patches allow this by adding the SPI controller nodes to the
DT. The compatible strings include an H6 specific name, so that any
future 4-wire enhancements for instance would be automatically usable
once the driver learns this new trick. For now we use the H3 fallback
name to bind the current driver.

This time I tested this actual branch  (on top of sunxi/dt-for-5.6),
on a Pine H64, both the internal SPI flash as well with SPI flash
connected to the other SPI controller available on the GPIO headers.

As the SPI0-CS0 pin clashes with the eMMC CMD pin, we keep this
node disabled by default, to avoid losing the eMMC if it probes last.
People (or U-Boot) can enable it if needed.

Cheers,
Andre.

Changelog v1 ... v2:
- comment on pinmux clash between eMMC and SPI
- disable Pine H64 SPI flash node by default
- add binding doc for the new compatible string

Andre Przywara (3):
  arm64: dts: sun50i: H6: Add SPI controllers nodes and pinmuxes
  arm64: dts: allwinner: h6: Pine H64: Add SPI flash node
  dt-bindings: spi: sunxi: Document new compatible strings

 .../bindings/spi/allwinner,sun6i-a31-spi.yaml      | 12 +++--
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      | 19 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       | 55 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 3 deletions(-)

-- 
2.14.5

