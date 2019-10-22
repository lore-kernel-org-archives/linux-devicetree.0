Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42FECA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:35:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A644A21783
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 13:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbfJVNfV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 09:35:21 -0400
Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]:38197 "EHLO
        7.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388246AbfJVNfV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 09:35:21 -0400
X-Greylist: delayed 1058 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Oct 2019 09:35:20 EDT
Received: from player793.ha.ovh.net (unknown [10.109.146.20])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4027320CABB
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:17:41 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id 3257BB3E3BDA;
        Tue, 22 Oct 2019 13:17:27 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Julien Boibessot <julien.boibessot@armadeus.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH 0/9] ARM: dts: update APF6 / APF6Dev
Date:   Tue, 22 Oct 2019 15:16:46 +0200
Message-Id: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 104990167874753605
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch series updates the APF6 / APF6Dev device trees.

Sébastien Szymanski (9):
  ARM: dts: imx6qdl-{apf6,apf6dev}: switch boards to SPDX identifier
  ARM: dts: imx6qdl-{apf6,apf6dev}: remove container node around pinctrl
    nodes
  ARM: dts: imx6qdl-apf6: add phy to fec
  ARM: dts: imx6qdl-apf6: add flow control to uart2
  ARM: dts: imx6qdl-apf6: fix WiFi
  ARM: dts: imx6qdl-apf6dev: add RTC support
  ARM: dts: imx6qdl-apf6dev: rename usb-h1-vbus regulator to 5V
  ARM: dts: imx6qdl-apf6dev: add backlight support
  ARM: dts: imx6qdl-apf6dev: use DRM bindings

 arch/arm/boot/dts/imx6dl-apf6dev.dts   |  49 +--
 arch/arm/boot/dts/imx6q-apf6dev.dts    |  49 +--
 arch/arm/boot/dts/imx6qdl-apf6.dtsi    | 200 ++++++------
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi | 424 ++++++++++++-------------
 4 files changed, 303 insertions(+), 419 deletions(-)

-- 
2.21.0

