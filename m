Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F83C5DF63
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 14:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5430620663
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 14:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="tx+mCq12"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfKFOD3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 09:03:29 -0500
Received: from forward103o.mail.yandex.net ([37.140.190.177]:38243 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbfKFOD2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 09:03:28 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id C6BEB5F80F50;
        Wed,  6 Nov 2019 17:03:25 +0300 (MSK)
Received: from mxback3q.mail.yandex.net (mxback3q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:4545:437c])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id C1F707080002;
        Wed,  6 Nov 2019 17:03:25 +0300 (MSK)
Received: from vla5-9cb0c276d29e.qloud-c.yandex.net (vla5-9cb0c276d29e.qloud-c.yandex.net [2a02:6b8:c18:3588:0:640:9cb0:c276])
        by mxback3q.mail.yandex.net (mxback/Yandex) with ESMTP id 8pKhPtX86G-3OVO6BLo;
        Wed, 06 Nov 2019 17:03:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1573049005;
        bh=hai9sgog1dfk7KHhtOi290Igt8EHHm6/472rOJW8OUc=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=tx+mCq12Zc5PnLyV3gYwacLWpvU7RpSMXN22Roq1f1ejMQCRkeb/kdEqmH9i7+2Dy
         lBFgzdZGB96007NsuycC2xyjfv485b2Bu+FFSShscT7K7IeSKLCN1aVOY7g7ZBvT+B
         cfy4VDX2z9CdM2CIrRTXRJjJS7A0hudYfpnFgGc8=
Authentication-Results: mxback3q.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by vla5-9cb0c276d29e.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id S6vUK4L7IT-3N1uYOit;
        Wed, 06 Nov 2019 17:03:23 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH 0/2] Neutis N5H3 support
Date:   Wed,  6 Nov 2019 17:03:16 +0300
Message-Id: <1573048998-8913-1-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Emlid Neutis board has another variant with H3 instead of H5. This patchset
adds support for this board by moving common bits to
sunxi-h3-h5-emlid-neutis.dtsi and then including it in processor-specific DTS.

Georgii Staroselskii (2):
  arm: dts: allwinner: Split out non-SoC specific parts of Neutis N5
  arm: dts: sunxi: Add Neutis N5H3 support

 arch/arm/boot/dts/Makefile                         |   1 +
 .../dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts    |  61 +++++++
 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi  |  11 ++
 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi    | 181 +++++++++++++++++++++
 .../sun50i-h5-emlid-neutis-n5-devboard.dts         |  95 +----------
 .../dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi   |  64 +-------
 6 files changed, 259 insertions(+), 154 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
 create mode 100644 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi

-- 
2.7.4

