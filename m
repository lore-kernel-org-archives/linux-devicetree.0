Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7C0C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 12:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4896620838
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 12:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zRIKU8kp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgG3MO7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 08:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgG3MO4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 08:14:56 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAB0C061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 05:14:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k20so5974334wmi.5
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=/r+N6eKyBWJdzxgYlYaBhm9+mOtspwHJ/eIAKQtz++0=;
        b=zRIKU8kp5WoYBIeDpHxsR86gcozaWDxJwr++sn9ppFBnSD7vL1H4IlJItye/f42UTz
         U5+MuqKoUXa2ekyaGCqnKkM+Vw/rCElo4m0dwEYW0nSAT972qWhyH67ycG5HTnEBG5bN
         GZbtdud0qIjXZppF/J/9z5sBJVqGEmmQs55+/EOjQ2lF0LZj90o6YMm9QeAarnwh7H7s
         /FNpA7BDwdlAf1w+9xESJPgyakro4x2qi1+qjhkPDZPriBzhw11IsoNAxkG05LOysVHT
         pGp80Ti8m4gIDVC236SDIGseS85o9GKSfTNs6wW45Eh3qBfKA/g4+UwRwBaWbRPx1Vfg
         DRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=/r+N6eKyBWJdzxgYlYaBhm9+mOtspwHJ/eIAKQtz++0=;
        b=ReZK9MrgwwzuD15NmOWjy3Wdznm40/3KOGCSji4KWhuI+Fn+YXdzZKMXWmrWY9d18S
         9ASH97aqC+Lw0AI2SDm4HhXrm06L4WOuppgr0Bs5XoxzG7X3NJ66RoBDGx/XyvskB10w
         NIpXsBxFuJsdRntt2KhNuwoiyN7gi0tfPyH/ofEbS7QC04gcJIiNqdpGccipQd9edXtR
         UZgz1u5TOGnNX5+0UijMQRyAgniU+eblwnGH8xA0jOEVN3mXQ0JgrlWvnEEFq3HL9hU2
         OLS7nZGnUYbN4aQ1rNgiw15AoQRaVMhHsZzNr+Sg7h7pdxdN4jCuCewEnP9LVxWDtcwl
         ZhLw==
X-Gm-Message-State: AOAM5302R7mXMdMN1rYp6nLdHb2BoeQd6HfpGmxZPoZ1PTxcOaJG+mTK
        nYMZdAzEG6l0y5+IhoRX7JGYZw==
X-Google-Smtp-Source: ABdhPJxeSZah/GBhT5AXfMsyEU7xu3cs5rnYnqoFxpEo4JI5uqQ53M13n/+4C68CfimapcobUCdrcA==
X-Received: by 2002:a1c:7915:: with SMTP id l21mr13753703wme.50.1596111294085;
        Thu, 30 Jul 2020 05:14:54 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t2sm9757845wmb.28.2020.07.30.05.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 05:14:53 -0700 (PDT)
References: <20200730100209.793-1-linux.amoon@gmail.com> <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
In-reply-to: <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 30 Jul 2020 14:14:52 +0200
Message-ID: <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
>
>> These patch fix the Ethernet issue on Odroid C2 & Odroid N2 
>> Some time Ethernet interface come up but no DHCP request
>> is forwaded to the Router, this happens quite offern on
>> my side. Adding Reset controller to ethernet node FIx the
>> inilization issue.
>>
>
> I'm seeing this on other device as well. Strange that it pops up only
> now. Change tested on S905x, seems to help.

Strike that one - still seeing random DHCP issue on boot with this
applied

>
>> -Anand
>>
>> Anand Moon (3):
>>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
>>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
>>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
>
> None of the patches apply, please rebase on kevin's dt64 branch.
>
> With that, you can add
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>

So still worth rebasing and applying on I suppose but I don't think it
solves the problem as described in this cover letter.

>
>>
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
>>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
>>  3 files changed, 7 insertions(+)

