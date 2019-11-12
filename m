Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCAFC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 16:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30BB02196E
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 16:15:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="m/mq7iI1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKLQP2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 11:15:28 -0500
Received: from forward106p.mail.yandex.net ([77.88.28.109]:32994 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726388AbfKLQP2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 11:15:28 -0500
Received: from mxback17j.mail.yandex.net (mxback17j.mail.yandex.net [IPv6:2a02:6b8:0:1619::93])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id B9C081C80B74;
        Tue, 12 Nov 2019 19:15:25 +0300 (MSK)
Received: from sas2-b0ca3cd64eaa.qloud-c.yandex.net (sas2-b0ca3cd64eaa.qloud-c.yandex.net [2a02:6b8:c14:718c:0:640:b0ca:3cd6])
        by mxback17j.mail.yandex.net (mxback/Yandex) with ESMTP id XWnrc2GOJP-FOuKbAxa;
        Tue, 12 Nov 2019 19:15:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1573575325;
        bh=rtRQozycSUUlCTa8Bg9BnGG8vc/daDegUx3PTAif/aE=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=m/mq7iI18bmFn3U9QCH2ENxYZDMe40BV4IjHw4VWzLQd3uWYfsQHCv1cZ2WFLfE9Y
         1AGE5hgj5mPauyYwyZsvXcFnGe4bxM6OWHnXbuIrj9Kp4KNTFsOUn2vZpbdRvpF6Dh
         4/TZXQ34f/l/0BAkamHTgMddFQHJLjKtbWUXnn7Y=
Authentication-Results: mxback17j.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by sas2-b0ca3cd64eaa.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id xY2rOY0rn4-FOUCsr3m;
        Tue, 12 Nov 2019 19:15:24 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH v2 0/3] Neutis N5H3 support
Date:   Tue, 12 Nov 2019 19:15:17 +0300
Message-Id: <1573575320-29546-1-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Emlid Neutis board has another variant with H3 instead of H5. This patchset
adds support for this board by moving common bits to
sunxi-h3-h5-emlid-neutis.dtsi and then including it in processor-specific DTS.

Changes from V1:

- moved HDMI nodes from DTSI to DTS
- added dt-bindings for Neutis N5H3
- made use of an array of pins in gpio-regulator node

Georgii Staroselskii (3):
  arm: dts: allwinner: Split out non-SoC specific parts of Neutis N5
  arm: dts: sunxi: Add Neutis N5H3 support
  dt-bindings: arm: sunxi: add Neutis N5H3

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   6 +
 arch/arm/boot/dts/Makefile                         |   1 +
 .../dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts    |  72 +++++++++
 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi  |  11 ++
 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi    | 170 +++++++++++++++++++++
 .../sun50i-h5-emlid-neutis-n5-devboard.dts         |  95 +-----------
 .../dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi   |  64 +-------
 7 files changed, 265 insertions(+), 154 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3-devboard.dts
 create mode 100644 arch/arm/boot/dts/sun8i-h3-emlid-neutis-n5h3.dtsi
 create mode 100644 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi

-- 
2.7.4

