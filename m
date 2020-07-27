Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F7FC433EB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:19:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E0AF2073E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QI0S4cLO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgG0TS7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 15:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728814AbgG0TS6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 15:18:58 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0BAC0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:18:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so9616140pfm.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vPONL8jDDWT9fXi/ahftLNzCw8+CDunpmbjxHjMrVbw=;
        b=QI0S4cLOJFMFEMp3YMT40BfDTK44eBLO9IamyTLDNIMJFckjEAwj+tpeXFoa2fKhXT
         hnU/xn/9sP2zotY5qfKqcycmp3AmpkB/UhqFsqGDflI2zIzfAOMgro2gKZqZ1ItWav3F
         /QWn0ai+icRoQs3x6pTkQP8hcf+gW52+Dj3tjeTLmxNuaPnLmPIBsTBeBUA5AqynVODe
         bCd1q59qfZVd/qNZk9/Qmzt+II4nVhYwQ9WrD4HXPFkTW1xPQ0p6bPdN0oolxTgDnUq+
         88XYdbBm9KajxW6efrDDIHkREHXF3+mouADVWxNnPJHpKbRSA7OXYdk4RRlWFixd3bkF
         UayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vPONL8jDDWT9fXi/ahftLNzCw8+CDunpmbjxHjMrVbw=;
        b=h+t/W66uTgnFlhQQygtM1mMgDcaIyT1QxvFfOpiiaDK6/KpStBSt2YfUEw7kSemLfi
         HEWRXJ4s7m6qTC3Ok4OQu7PKDaRjYzmL9XMZDJeecgLXzsG3UpjQpi3Ag8cRv80aFtHh
         s8z/AkRyPg2mjZq98cb9OYF/ynrpfDltsaStioFlN5TY/tMI1DTaDwVJh18gz1nJBUOV
         iedbdWWt6+unW441dBGnv50lJ8c+huPSTJMNU+Bc27JOtXlzogc5Wbs5ubl/Rf1Xzo9x
         K4rwtlMUPAbSlY1AUhTAzokoMKoeinfjfQ90A/FnmlYsl1fJwFY7jsAEO7LZZgtzQlur
         V5tQ==
X-Gm-Message-State: AOAM533rF/MkJr3rBLBlyNgP/FkI7a7KzzKVnzO/+TubV84kN8ivTibu
        yKIn3D9y/SWu25GBAC9h5DYAfA==
X-Google-Smtp-Source: ABdhPJw70u2U6IdBQSQNyaAl8QDp+dY7uPOtbnAIO4CpXehnlk2QP7ZIrrHIi3qtfG+wqY0oZLlWpA==
X-Received: by 2002:a62:3684:: with SMTP id d126mr10165410pfa.234.1595877537733;
        Mon, 27 Jul 2020 12:18:57 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id a13sm16560457pfn.171.2020.07.27.12.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:18:57 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Christian Hewitt <christianshewitt@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson: misc fixups for w400 dtsi
Date:   Mon, 27 Jul 2020 12:18:54 -0700
Message-Id: <159587752409.20735.1674533362096903330.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721013952.11635-1-christianshewitt@gmail.com>
References: <20200721013952.11635-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 21 Jul 2020 01:39:52 +0000, Christian Hewitt wrote:
> Current devices using the W400 dtsi show mmc tuning errors:
> 
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: meson: misc fixups for w400 dtsi
      commit: 2fa17dd09533d5d83201be3229a28c1010a8ea3e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
