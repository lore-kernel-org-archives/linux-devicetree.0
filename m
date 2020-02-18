Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE38EC34031
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 21:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BBA42464E
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 21:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgBRVcQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 16:32:16 -0500
Received: from foss.arm.com ([217.140.110.172]:34716 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgBRVcQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Feb 2020 16:32:16 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD841FB;
        Tue, 18 Feb 2020 13:32:15 -0800 (PST)
Received: from DESKTOP-VLO843J.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA3723F68F;
        Tue, 18 Feb 2020 13:32:13 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, heiko@sntech.de
Cc:     alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        pgwipeout@gmail.com
Subject: [PATCH v2 0/3] Clean up RK3328 audio codec GPIO control
Date:   Tue, 18 Feb 2020 21:31:57 +0000
Message-Id: <cover.1581376744.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

Since nobody said anything resembling "that looks like a terrible idea!"
to what I propsed on top of v1, resending as a full v2 per Mark's
request.

Robin.


Robin Murphy (3):
  ASoC: dt-bindings: Make RK3328 codec GPIO explicit
  ASoC: rockchip: Make RK3328 GPIO_MUTE control explicit
  arm64: dts: rockchip: Describe RK3328 GPIO_MUTE users

 .../bindings/sound/rockchip,rk3328-codec.txt  |  7 ++++-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts    |  1 +
 .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  1 +
 sound/soc/codecs/rk3328_codec.c               | 31 ++++++++++---------
 4 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.17.1

