Return-Path: <SRS0=gpjL=32=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085CBC352A2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 01:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBBC820838
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Feb 2020 01:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbgBFBHN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 20:07:13 -0500
Received: from foss.arm.com ([217.140.110.172]:53526 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727307AbgBFBHM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 5 Feb 2020 20:07:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B36A30E;
        Wed,  5 Feb 2020 17:07:12 -0800 (PST)
Received: from DESKTOP-VLO843J.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBC7A3F68E;
        Wed,  5 Feb 2020 17:07:10 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, heiko@sntech.de
Cc:     alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        pgwipeout@gmail.com
Subject: [PATCH 0/3] Clean up RK3328 audio codec GPIO control
Date:   Thu,  6 Feb 2020 01:07:10 +0000
Message-Id: <cover.1580950046.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

Investigating the RK3328 GPIO_MUTE pin in the context of boards that use
it to control a regulator has highlighted that the audio codec driver
currently has some hard-coded implicit control of that pin. Fortunately
those boards don't currently enable the audio codec, because it would be
pretty terrible if playing audio changed the SD card I/O voltage. This
is a first crack at making things better.

Robin.


Robin Murphy (3):
  ASoC: dt-bindings: Make RK3328 codec GPIO explicit
  ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit
  arm64: dts: rockchip: Describe RK3328 GPIO_MUTE users

 .../bindings/sound/rockchip,rk3328-codec.txt  |  7 ++++++-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts    |  1 +
 .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  1 +
 sound/soc/codecs/rk3328_codec.c               | 20 +++++--------------
 4 files changed, 13 insertions(+), 16 deletions(-)

-- 
2.17.1

