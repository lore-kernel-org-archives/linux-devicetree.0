Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CC5C00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 10:10:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ACAF2077B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 10:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgAHKK1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 05:10:27 -0500
Received: from foss.arm.com ([217.140.110.172]:41702 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgAHKK1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jan 2020 05:10:27 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 935DB1FB;
        Wed,  8 Jan 2020 02:10:26 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.44])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2904B3F6C4;
        Wed,  8 Jan 2020 02:10:25 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.xyz>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/2] arm64: dts: sun50i: H6: Enable SPI flash
Date:   Wed,  8 Jan 2020 10:10:04 +0000
Message-Id: <20200108101006.150706-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Even though the SPI controller in the Allwinner H6 SoC is more advanced
than in the previous generations (it supports 3-wire and 4-wire mode),
the register set stayed backwards-compatible. So we can use the existing
driver to use the "normal" SPI mode, for instance to access the SPI
flash soldered on the Pine H64 board.

These two patches allow this by adding the SPI controller nodes to the
DT. The compatible strings include an H6 specific name, so that any
future 4-wire enhancements for instance would be automatically usable
once the driver learns this new trick. For now we use the H3 fallback
name to bind the current driver.

This time I tested this actual branch ;-) (on top of sunxi/dt-for-5.6),
on a Pine H64, both the internal SPI flash as well with SPI flash
connected to the other SPI controller available on the GPIO headers.

One thing I noticed: Only SPI0 seems to connect the two extra pins
required for 4-wire mode. Does this require some extra DT property or
the like? Can we derive this from the number of pins in the pinctrl-0
property? Or will we later introduce a new compatible string to prepend
to the current list?

Cheers,
Andre.

Andre Przywara (2):
  arm64: dts: sun50i: H6: Add SPI controllers nodes and pinmuxes
  arm64: dts: allwinner: h6: Pine H64: Add SPI flash node

 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts | 13 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 54 +++++++++++++++++++
 2 files changed, 67 insertions(+)

-- 
2.17.1

