Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5E2C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E74D20735
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNqF5LQD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389415AbgDMWBF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 18:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389414AbgDMWBE (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Apr 2020 18:01:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31BBC0A3BDC
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 15:01:03 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k21so10411979ljh.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=beTCdjD9mBgR4YFC6YHzV+CN3PBybk3lFl2C+p4DAr8=;
        b=aNqF5LQDjh4Jp0mxwWNgS0pt/uW2vrMEbddCLpbtPMleQOwSqg5qsugFI1V9mUlGbD
         ftrMhnFk9sy9a8perUPxaIuwSrshwZSYBCFSRyDKdNWeUgWDmNm1yefqEouqJQKi3aL5
         OSr7jygpgTbU0vL9lNW8cVo309JUUldgCEIjF9TdqAB6l82nP9rF9m84vLEKwNKTerNB
         ANuf7D0mn2wVK23++i23E9LAomqYnbTWPrfvgc4lBWMg6uTC3LH7DHfmVJ/mZvu+TmLt
         O+s+mBzuVH8VU1IDOnrDP8aktTHgv14DKUkOmK/6Zc84BXQNIJ5JWzQUBxJ4g5Gt3ii8
         ou6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=beTCdjD9mBgR4YFC6YHzV+CN3PBybk3lFl2C+p4DAr8=;
        b=pvXZqgvYYgANErdxDhy/t1HrSMHZ6h9nASN8BIIqH0GbbTzSqgZWQgz6iR/nmQihKw
         n4CEjtX5nGklZmYBK9PpePMyf35zwI/0vFa/70XpFT3yrb+tXgaIDZm8aKwz1WvPWyVL
         J4N9UaZ4Z6AbShRjcxTRBFDbBQtYnf3DGeJf/sYQ23WOpbg0SGby80+NfeK+4BHINUyw
         OVoUfTWBl8Ni59hepx6om4gaGmGVctLhnK3XXsFYDR++Fk/ferZxvABbX4Urq+BBdIIr
         KVbNcp/pRG7R6tU4EZdaDCE7yttxQaiWbIwFP3AKJXpmsh3+SlKuAiX/HnjthL309wXZ
         S2QA==
X-Gm-Message-State: AGi0PuaVN2VUMwlCsmBu12Tv2mNvLyEdhDJ5aOyjPjKKAGOzg3hwq3Zh
        S6BnHZoW5eHA9k6AUNhN8dECNuVe
X-Google-Smtp-Source: APiQypK3XR6vxv0lxmZIgBdXP2rEtblb0MiCnDiaK3vm6MF2w9zA8bW20rxretqwoRZBcqnHTACpOw==
X-Received: by 2002:a2e:86d8:: with SMTP id n24mr4349639ljj.129.1586815261957;
        Mon, 13 Apr 2020 15:01:01 -0700 (PDT)
Received: from curiosity (ip-195-182-157-78.clients.cmk.ru. [195.182.157.78])
        by smtp.gmail.com with ESMTPSA id c4sm8871509lfg.82.2020.04.13.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 15:01:01 -0700 (PDT)
Date:   Tue, 14 Apr 2020 01:05:20 +0300
From:   Sergey Matyukevich <geomatsi@gmail.com>
To:     Russell King <linux@armlinux.org.uk>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [bug report] armada-8040-mcbin: 5.6-rc5 boot failure
Message-ID: <20200413220520.GA25917@curiosity>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russel, Miquel, and all,

MacchiatoBin Double-shot board fails to boot v5.6-rc5 kernel properly:
USB, PCIe, and ethernet interfaces are not enabled. Before that I have
been running v5.3 kernel w/o any noticeable issues.

In brief, USB and PCIe devices are not detected, ethernet PHY fails
to initialize with the following warnings:
[    2.444150] mvebu-comphy f4120000.phy: unsupported SMC call, try updating your firmware
[    2.452191] mvebu-comphy f4120000.phy: Firmware could not configure PHY 0 with mode 15 (ret: -1), trying legacy method
[    2.474615] mvpp2 f4000000.ethernet eth2: Using firmware node mac address ...
[    2.484420] mvebu-comphy f4120000.phy: unsupported SMC call, try updating your firmware

After quick bisection of the board dts files, I came to the following results:

- USB works again after reverting the following two commits:
  -- 96018a6fafb1 ("arm64: dts: marvell: Convert 7k/8k usb-phy properties to phy-supply")
  -- 01d0deba28f6 ("arm64: dts: marvell: Add 7k/8k PHYs in USB3 nodes")

- PCIe works again after reverting armada-8040-mcbin.dtsi parts of the
  following two commits:
  -- 1399672e48b5 ("arm64: dts: marvell: Drop PCIe I/O ranges from CP11x file")
  -- ce55522c035e ("arm64: dts: marvell: Add 7k/8k PHYs in PCIe nodes")

- ethernet: not yet...

However looking at firmware version complaints, I guess that the actual
reason of all those issues could be in ATF version rather than in the
latest DTS changes. Probably I am using ATF version which is too old
to work with up-to-date kernel: armada-17.10.3 from atf-marvell
repository on github. If this is indeed the actual root cause of all
the issues, then could you please recommend a preferable ATF version
to test with ?

Regards,
Sergey
