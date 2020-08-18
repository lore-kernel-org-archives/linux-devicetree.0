Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC76C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4573A207FB
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v5eu+Mpm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgHRHnG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 03:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgHRHnE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 03:43:04 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A6AC061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:43:04 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i6so14471627edy.5
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=5HsyZsoKjm060rvDSEtMkPqgnArr4sh0YC0G60nxwEw=;
        b=v5eu+Mpm72068/lOHhmx+7+0snWUwsS2OSm5rafXvyvPclnxkdYaV6VTnwuHnqT5DV
         GmirRi54+eP+YFIoHPvyP4IpPf7HMMrBjAsCe4bs1AjABFEvi3qh874d4csbTc+hxEJy
         eTcpzkC+98sfmDYq7lSn2MX2yGNWMhMObIeVUzmIf2wXj9pfC8GlzHAtIJs8zHEFP+Ad
         4YH4/Ua1psV7m15UBDEUHD7xNIzqnO7wJYmhMkWbxn5YEQ3XArtbs7dHMHrwLlUK1H79
         Nc8AY3sxMYBYhln0fupsphsBdLbHEa6ym8FgJxH+A1RmUUp5xTgth+NqLHonMJHZw9NP
         jkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=5HsyZsoKjm060rvDSEtMkPqgnArr4sh0YC0G60nxwEw=;
        b=aeMhYjcUfnKb3wLvehdXoIVO+iWuBgohjVNzcDOAcedvUY/DVPEEj0vXPh8YOtY/uD
         ohEOu1mnUHCn9is54yZK4HLN2UN6b6AT55VVErJtcHmPEHPuEQwRPUxq6F647OFzBcd2
         AloWTeogH1u+iY09fgonjEfMGVpG9ZAMNT8ys8z/BnJPg1zdSvVfT0UUSDsjOUUBkN1a
         RbFKYVNdXfPSjt5cU/01L/znM8tuMyepmvGVxt3+mhkXiO18EDd86RGb0n6qNANnwxev
         WPV9tnanz5PautzgGmP8U76AdEqP9rzdF4Ih82fzaRMMxmlf9tTFDJrPyk+xqpOwRv6s
         /3Og==
X-Gm-Message-State: AOAM530aEwdcPn3sZ4qe/O5FyrVGTLsa2sHyofui8FMqwp6FlwJZJ4IH
        yJ5RsKzl5HOOvgC20fVH05g5Yg==
X-Google-Smtp-Source: ABdhPJw/ZcBmsBkk7fscjG6qs6aeBLDcAopNw9zkaXwYznIwnEFTqjWTKbfCdy30cuwEP95Pq2wv/g==
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr19029089edx.161.1597736582979;
        Tue, 18 Aug 2020 00:43:02 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id h16sm15569920ejf.120.2020.08.18.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 00:43:02 -0700 (PDT)
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-2-linux.amoon@gmail.com> <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com> <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com> <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
In-reply-to: <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
Date:   Tue, 18 Aug 2020 09:43:01 +0200
Message-ID: <1j1rk4flh6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


>> > >
>> > > +&i2c3 {
>> > > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
>> > > +       pinctrl-1 = <&tdm_c_din3_a_pins>;
>
> Note: without setting this *pinctrl-1* configuration RTC wake up
> feature works as expected.

As pointed out by Martin, the pinctrl-1 here makes no sense for RTC on
i2c. If the rtc is on an I2C of AO bank, the pinctrl-0 is likely to be
wrong as well.
