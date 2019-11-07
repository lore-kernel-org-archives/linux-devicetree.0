Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AD3C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07900206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="f/GDtEfh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387670AbfKGKEv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:04:51 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:40206 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387811AbfKGKEv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 05:04:51 -0500
Received: by mail-wr1-f47.google.com with SMTP id i10so2286751wrs.7
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 02:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0KKvV7CdQbaeYiSyH6SeEe8jcbCg2d1K80EhNck9ZXI=;
        b=f/GDtEfhLpZzF1inf6jp2vgdpp/tZFLyUxpeaDhi8anKs/vv3kl88dsC+J6JXcCESD
         uQwreZdQ3wCLkYF1Yayoij/qUPmVYy7U+OveZWzvKGFBgKPDdXjPRYiQwIjXOjG40jep
         J9YkIA8ZW37YXKpPhO7MI7rUkh2iJHCeIeN4tvX8NvmAyIMw1Bt75VZyJPOrgF+xIvgt
         b/EQSPSnyz03fJ6vfkRNTKw7tY81f6DV5UpH12vjTAViuSfRNfNgIzpgON6Wm4enTEWS
         +oSuN3DIdLG1C0VDsyRf5o0nqNjkcQDgwaD2zo5wXxi7HQ+fDQqLsxACQlWf2s1NY33y
         L7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0KKvV7CdQbaeYiSyH6SeEe8jcbCg2d1K80EhNck9ZXI=;
        b=P5K3M6jBKZswvv6TdCqFhY7ZiyipKXEKJZLVaxeziyC1auQ/PUxrJazgsJSzAt6gEH
         uqRFT/Ma8l6b+KLWVhNtWj5T4PV0rHUlTSOH/Bh0c2Dhk6VT9XPWNnZuHyyQCjXC9JH4
         GwFUsXkrhxmdLSJVO0uBodRQSyBfRerUNC+qNE7oxCPGSfqcb05NPqCYZuPPj3lA68Mg
         7BOBOk/OJvOv2yTbL81Q5xzqOakrQPTzuISfr52mvkdUpktpdHwuJXLrzkMdZni1yV0o
         oWYj1BdPmcdBNSziY7CRffetUwUCi3b/C+zNv2XU68sovtgyMxz4RPpqiAke2XotCfxf
         mfVQ==
X-Gm-Message-State: APjAAAX03Sr8gm2387JNLVtECZoMs9c3uWXkdzvoHe2QpK3+bzGTQvPs
        5e3Y/WMnPb/SmIADXpjNT1c=
X-Google-Smtp-Source: APXvYqxGcoKytFm8PfZUw2fa7iJiotd6fkJ4fjzPZKidu9Y1CdXS/FNNndKF09MY0Vh2UbIYumjFUA==
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr1557279wru.138.1573121089239;
        Thu, 07 Nov 2019 02:04:49 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id v184sm2225860wme.31.2019.11.07.02.04.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Nov 2019 02:04:48 -0800 (PST)
From:   Christoph Fritz <chf.fritz@googlemail.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] regulator da9062: support setting buck modes
Date:   Thu,  7 Nov 2019 11:04:06 +0100
Message-Id: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset adds of_map_mode support to regulator da9062, documents its
bindings and makes use of it in dts phycore-imx6 so that buck modes
get configured explicitly for this hardware.

Christoph Fritz (4):
  regulator: da9062: refactor buck modes into header
  regulator: da9062: add of_map_mode support for bucks
  dt-bindings: regulator: describe da906x buck regulator modes
  ARM: dts: phycore-imx6: set buck regulator modes explicitly

 Documentation/devicetree/bindings/mfd/da9062.txt   |  4 ++
 arch/arm/boot/dts/imx6qdl-phytec-phycore-som.dtsi  |  5 +++
 drivers/regulator/da9062-regulator.c               | 49 ++++++++++++++--------
 .../dt-bindings/regulator/dlg,da906x-regulator.h   | 16 +++++++
 4 files changed, 56 insertions(+), 18 deletions(-)
 create mode 100644 include/dt-bindings/regulator/dlg,da906x-regulator.h

-- 
2.1.4

