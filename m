Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63707C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C97820656
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eZ4bllHm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgG3NzS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 09:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgG3NzR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 09:55:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C9BC061574
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:55:17 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b6so24984678wrs.11
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Yhp/1dp/W+9XlLvqN4/caKDc0k5LmNf4y6EcBCNmqto=;
        b=eZ4bllHmDTz159zzmoDusNthWOwW5rTOsT0hvj+j6VaK1s3NBXPfCUPFu0ffCe3j9y
         g5P6IuSaVL2nlGDtEdcM5ktLFGiA1BViV3RuTN1GSF+g0IDx6V3koc6W51jTXygYiLiE
         VObOh5FR5EbEINZQ4vzlqYU4RMnCVplo/oR+MVo7Gl81/FbzZpbGuJ5lkY5dFUOSqdQo
         qvgqgCEEAU9L8poiMNiFjmUdwPSGlSwqOhUrHHjqJcafjx2/3li5vszQfIEWsL4T10Hl
         Zxm8pUxUK9Z/OvgqlzjTuPzd3I1a19e0N1Uusz8bk15LNd2K/VrJni8nQ2wwaeAMQJ+J
         LXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Yhp/1dp/W+9XlLvqN4/caKDc0k5LmNf4y6EcBCNmqto=;
        b=udcs1U+WtKT5r2DuciAqcz+5cbXrfUtwM89SuJU3TzJw2diACMsi5gB9kWcSDsG7fF
         sVHm0jKZJM5w36XydN63pTvsn55OM1NGU+iNere8HSIpXVdVJI+o/rCpSX1apWGGvT+P
         Tu6YsOpsuHQF9YjGVJjIIN3ZS/xRQS0mjsO+JERLJ6Rzz3iXrPQTkGHzHPsriSGVp3T9
         8IM8Vpry9fNgHb8uPRBFSAP48J9wnr/yVr+mVgHOTfLt/Ih/wWEUJkomX8LtdFXf44Dq
         48l+ogVk/h6A4xBzHSNCpVgz3Yqm2qLEtz6+CaIoObC/qXA6UIT808gpp15DtHz2l+me
         LO2Q==
X-Gm-Message-State: AOAM530SJlbrwhQwhboBTxKishegwUBpnCarK+W+8138Wu9YcIsjUH+G
        IePcw4dvo1DE2WDWaHsOWG1YSA==
X-Google-Smtp-Source: ABdhPJwXI0dK+4LbZcWu/4DqwqVMOQ829RGnEM7cmL2FieWvgVjkEsEQva7bPhn5EA3sTLIEfDoBEw==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr36772698wrq.357.1596117316198;
        Thu, 30 Jul 2020 06:55:16 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o30sm9973036wra.67.2020.07.30.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 06:55:15 -0700 (PDT)
References: <20200730100209.793-1-linux.amoon@gmail.com> <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com> <1jd04d8air.fsf@starbuckisacylon.baylibre.com> <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
In-reply-to: <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
Date:   Thu, 30 Jul 2020 15:55:14 +0200
Message-ID: <1jbljx85vh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Thu 30 Jul 2020 at 15:46, Anand Moon <linux.amoon@gmail.com> wrote:

> Hi Jerome
>
> On Thu, 30 Jul 2020 at 17:44, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> > On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
>> >
>> >> These patch fix the Ethernet issue on Odroid C2 & Odroid N2
>> >> Some time Ethernet interface come up but no DHCP request
>> >> is forwaded to the Router, this happens quite offern on
>> >> my side. Adding Reset controller to ethernet node FIx the
>> >> inilization issue.
>> >>
>> >
>> > I'm seeing this on other device as well. Strange that it pops up only
>> > now. Change tested on S905x, seems to help.
>>
>> Strike that one - still seeing random DHCP issue on boot with this
>> applied
>>
>> >
>> >> -Anand
>> >>
>> >> Anand Moon (3):
>> >>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
>> >>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
>> >>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
>> >
>> > None of the patches apply, please rebase on kevin's dt64 branch.
>> >
>> > With that, you can add
>> >
>> > Tested-by: Jerome Brunet <jbrunet@baylibre.com>
>>
> So I have to drop the Tested-by  ?

Yes

>
>> So still worth rebasing and applying on I suppose but I don't think it
>> solves the problem as described in this cover letter.
>>
>
> I have a mac address mapped to the ip address on my router,
> So I am just testing with the latest u-boot-2000.07 on my boards.
> Usually the ethernet comes up with no packet getting forwarded,
> Even ping to the device is not working, which is what I observed at
> my end many times.

This is not the use case descibed in the cover letter. Please clarify if
you resubmit.

>
> I will try to rebase on top of Kevin's v5.9/dt64 if needed.

If you intend on submitting the series again, rebasing is necessary.

> Please let me know.
>
> -Anand

