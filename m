Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED615C43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4D132053B
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfKOQId (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:08:33 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36171 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfKOQId (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 11:08:33 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVe90-0002S4-MD; Fri, 15 Nov 2019 17:08:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVe8y-00047B-5i; Fri, 15 Nov 2019 17:08:20 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     robh+dt@kernel.org, KCHSU0@nuvoton.com, broonie@kernel.org,
        thomas.fehrenbacher@siedle.de
Cc:     kernel@pengutronix.de, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add NAU8812 support
Date:   Fri, 15 Nov 2019 17:08:16 +0100
Message-Id: <20191115160819.15557-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

this small series adds the documentation and support for the nau8812
devices. The exisiting nau8810 driver can handle both devices so we only
need to add the dt-bindings and inform the user by adapting the Kconfig
entry.

Futhermore the series adds the support for the aux-port control.

@John Hsu
Please can you verify that register accesses to the aux-port control
bits don't affect the nau8810 devices? I don't have such a device but
the documentations says that those register fields are just '0'ed. So I
assume the nau8810 devices ignore such writes.

Marco Felsch (2):
  dt-bindings: ASoC: add nau8812 documentation
  ASoC: nau8810: add support for nau8812

Thomas Fehrenbacher (1):
  ASoC: nau8810: add aux input control, available on NAU8812

 Documentation/devicetree/bindings/sound/nau8810.txt | 2 +-
 sound/soc/codecs/Kconfig                            | 2 +-
 sound/soc/codecs/nau8810.c                          | 9 +++++++++
 sound/soc/codecs/nau8810.h                          | 2 ++
 4 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.20.1

