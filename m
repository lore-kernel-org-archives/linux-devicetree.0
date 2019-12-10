Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D32BC43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 18:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 328EC20836
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 18:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ax41RgSa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbfLJSNU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 13:13:20 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33496 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727603AbfLJSNU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 13:13:20 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so7719054pjb.0
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=4lLGRmsliIpZ0UpKU0IEWW602jVUv7+6lHITbij3O5Y=;
        b=Ax41RgSauchkK4JBfY5KiQhx0ZqAGsHlTIabiht9+ufmYPy0A/k6fzpIOehD7/e1BZ
         rVNN9fQqcCTUysbKXiB+vDRvErr1DyzQPtKiTYcJqj2GHjmATSk3qucVeOLVRCkOhEIu
         K5dAVffJQTTNp4WTUL3ki2V3LvaaviZN1KCbOON0El12ZWTLGoM+UwftSpRs5Plgaxb3
         JVbzGapJbO730NFVsQnawfZ+KVkgcjfTaxggwi194/nxW0zjNi9K7TZVjJ07vcCzE4r5
         L/qmEmEiYuVsMLunBZzzlhPYONXzzXDmajP/VEpXPY6582YOziMrl931APa+/HAqnF5W
         wXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=4lLGRmsliIpZ0UpKU0IEWW602jVUv7+6lHITbij3O5Y=;
        b=gzArQMfJgXYPxdPki2kdAN20NX8ksKoIGDJ70m/LmAGBVDjR+11bFfmPuxwE2dThnQ
         MAO2RhI+Xu05w/fyyCDPWNUP3RlLR45n9SeyilVxDbxjoPivhB7G0LQMIS2SlAMECi3s
         Tn6FlroTy9pEoVxPhFKke98M5GUUgUIhWbVHdTvix/PkSNLpTmIK9/dXj+F+srsDf6aw
         UrUlGNGTJuBOE26g/bqsAZkaHD4zir9DMWGUouk8LfFDylovf2aav3PBtJSB11ow0urv
         htPbjUCTNRJwoi5pVaWQy5eLqapRe3Fg91q8gE7bDyHtRg4XJwqLgzAyqvJTIsM4LlEO
         57rw==
X-Gm-Message-State: APjAAAVRMkZkruiIDNgUc4zQUu10nYGkFZtU7EsWEHLhbOcCkWZvE5mw
        6dc5vUVIIvPacYRfPMPXG4yktQ==
X-Google-Smtp-Source: APXvYqxJRm4sHGA5uWrmJ+2D9cTFf8Qb8j2tRTkfuT9957FR3ONic55nbNNuLrP58IxTnaW0jHeS9g==
X-Received: by 2002:a17:902:b611:: with SMTP id b17mr22648668pls.210.1576001599750;
        Tue, 10 Dec 2019 10:13:19 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id u123sm1382107pfb.109.2019.12.10.10.13.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 10:13:18 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
In-Reply-To: <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
References: <20191101143126.2549-1-linux.amoon@gmail.com> <7hfthtrvvv.fsf@baylibre.com> <c89791de-0a46-3ce2-b3e2-3640c364cd0f@baylibre.com> <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
Date:   Tue, 10 Dec 2019 10:13:18 -0800
Message-ID: <7hfthsqcap.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Anand Moon <linux.amoon@gmail.com> writes:

> Hi Neil / Kevin,
>
> On Tue, 10 Dec 2019 at 14:13, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 09/12/2019 23:12, Kevin Hilman wrote:
>> > Anand Moon <linux.amoon@gmail.com> writes:
>> >
>> >> Some how this patch got lost, so resend this again.
>> >>
>> >> [0] https://patchwork.kernel.org/patch/11136545/
>> >>
>> >> This patch enable DVFS on GXBB Odroid C2.
>> >>
>> >> DVFS has been tested by running the arm64 cpuburn
>> >> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
>> >> PM-QA testing
>> >> [2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]
>> >>
>> >> Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM
>> >
>> > Have you tested with the Harkernel u-boot?
>> >
>> > Last I remember, enabling CPUfreq will cause system hangs with the
>> > Hardkernel u-boot because of improperly enabled frequencies, so I'm not
>> > terribly inclined to merge this patch.
>
> HK u-boot have many issue with loading the kernel, with load address
> *it's really hard to build the kernel for HK u-boot*,
> to get the configuration correctly.
>
> Well I have tested with mainline u-boot with latest ATF .
> I would prefer mainline u-boot for all the Amlogic SBC, since
> they sync with latest driver changes.

Yes, we would all prefer mainline u-boot, but the mainline kernel needs
to support the vendor u-boot that is shipping with the boards.  So
until Hardkernel (and other vendors) switch to mainline u-boot we do not
want to have upstream kernel defaults that will not boot with the vendor
u-boot.

We can always support these features, but they just cannot be enabled
by default.

Kevin
