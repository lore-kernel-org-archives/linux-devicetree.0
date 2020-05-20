Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45358C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 22:57:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F3E620890
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 22:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dr9rxmLA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgETW56 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 18:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbgETW56 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 18:57:58 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366FDC061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 15:57:58 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id n15so2336099pfd.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ULnNxAULnm08KMTqxK0q2nOBlQyYCP0dCYh4spm6zVM=;
        b=Dr9rxmLADUgdZL1PoHo0clKCjzaj6oamURTG9OrpWd0MYV1ljIuPHElz5NqwFovi6o
         7CoMv2RH5/AhH6feYtvXPz+Q1uqvqSRHlbKoxI2WOjjJwWB9LvqFY/RBBz/EXoLZzc5B
         O6m9KtSxBqsATeOI7djfbO/oK/lTrcun+bAiNImAY72ZF3c49GTRsshit8E9HUEE/k13
         X4s4SCXoLYxwQ1SNGg42hFHStOsjYFO8nu9ePNM6KBvA68MAz9MwLOvKxhyV8dYC2E3K
         z9IR3QMGy6SI027IjKYr9dWCIs7VMWd+qipDRDM97MNcvMroQAwXBaye3EswIJck7CDO
         heKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULnNxAULnm08KMTqxK0q2nOBlQyYCP0dCYh4spm6zVM=;
        b=OH22Qmp04vKhj5UUqqg61YVezVOPsk9+414uOcxMF/K/bSPpW4ujTz+yxfg+pVAM3f
         kanMJuutWs4nzyiWHVs2On+HOuOZG/Ol6CW2M3XgulQBvxSfL6RZJ7Yrd3p7UgIV1maM
         m32hjicEp3TlfXIJf8K3yjVVOqihMj+4hYB92BHb1ftVFmkWIeeuEiSQi2IoK1fTrwmN
         cQAF3Oju79nf42TuZBvCuPwFvtXdG9ObtLR/zCN5Vs5wRo9+hAOp1vdxMNp6GbJUo2bg
         KPhgltOkXCma+xl+BMa1tIxM8t2rnNbudkOA8Z37xbH/0/S7g3NDXY3sZI13QhxvjmTp
         uGsg==
X-Gm-Message-State: AOAM532LO3T/CpMc1F79zNKGM/Dg9UoU9Jx+GxMVYIiu7HRIDJzJ1Wp1
        Dxp9OoFIFmyEXJ92cQXrMw7dpA==
X-Google-Smtp-Source: ABdhPJxXH0T8WaTu1eJ5ORL2AsB6RhmcGww0UQ0dm3mlKd6WDFFbRzUDT5J1CZeXvTo1WWs5nikpOQ==
X-Received: by 2002:a62:ed14:: with SMTP id u20mr6701504pfh.69.1590015477511;
        Wed, 20 May 2020 15:57:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 30sm2528107pgp.38.2020.05.20.15.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 15:57:56 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v4 0/5] arm64: dts: meson: add W400 dtsi and GT-King/Pro devices
Date:   Wed, 20 May 2020 15:57:56 -0700
Message-Id: <159001518290.37678.8702046398403083549.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520014329.12469-1-christianshewitt@gmail.com>
References: <20200520014329.12469-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 20 May 2020 01:43:24 +0000, Christian Hewitt wrote:
> This series combines patch 2 from [1] which converts the existing Ugoos
> AM6 device-tree to a common W400 dtsi and dts, and then reworks the
> Beelink GT-King/GT-King Pro series from [2] to use the dtsi, but this
> time without the offending common audio dtsi approach. I've carried
> forwards acks on bindings from Rob as these did not change.
> 
> v4 - rebased against Kevin's v5.8/dt64 branch
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
      commit: 3cb74db9b2561a25701b9024b9d5c0077c43e214
[2/5] dt-bindings: arm: amlogic: add support for the Beelink GT-King
      commit: 3a90ef281f852db9900024116e8ea93a49115df9
[3/5] arm64: dts: meson-g12b-gtking: add initial device-tree
      commit: c5522ff9c7299f9845df3fd521d51a1ef7617ac7
[4/5] dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
      commit: 8d4b8772296f88e0b6bf5d091ebf25a54e51882c
[5/5] arm64: dts: meson-g12b-gtking-pro: add initial device-tree
      commit: 0b928e4e412b1eb9e79e02cf3580b9254d338aae

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
