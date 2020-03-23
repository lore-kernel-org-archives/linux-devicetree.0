Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42951C4332B
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 09:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 144632074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 09:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="waSIN8+A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCWJEB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 05:04:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53170 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbgCWJEB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 05:04:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id z18so4889135wmk.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2020 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=lPutVzS3Ynb1eSmgIsa4JmohPw4ZclRrh1KFVq8nWQ0=;
        b=waSIN8+ApYqW/LXnPGRL/NvneWe4/UMrJ9lHgLm+ihlGugDYOwJ6NZkrFpWxvP6MC8
         GNsIhdx1sE0PQNevvLnFU8JLGhBZQCcM2iuXOWZHDd6af+85XDnWTjRVbwkVfZgA6PeF
         l0e1vdhqnc8FBwWg8vUGp27gtAkcfvVU/5tktj+zX+p8+lBs6MC90BoMyIOLPH2MhaTo
         45RTZrMkvxEjep4JO6e+BufQZJamczxfLM8nme9e6rCkqkb9C0FBnOjVf9PxprElx5Zj
         rmrlPd6yS7hTFWmy4oW4XCTX9u6yeSNaotUzdicCYqM0JaLIz/ug+LCBJ9x1OWwCwopN
         OKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=lPutVzS3Ynb1eSmgIsa4JmohPw4ZclRrh1KFVq8nWQ0=;
        b=qhtOXfByulqB7t6aUc2CBw5bw5tjRn45nBNlwn2OxbUpPItP+Fia+GCpG0FqY8jRbC
         NpaXDWWn6UnRlGuVexpmJAmuq/WoyZKus9LmHmlQ5CXbxSwKPgaMbOH74hPal3HGymeq
         CA/zv318AcveTejHTKYcmDkS4vYPsF8wYIto6YPJ+inbg3TufpIIWvHOFBsJLj3HpsAu
         Bqyv4qvcJQTrN1zTpucUTRTyKkUrgUS3hEy8ZwtITvfSv68CX3gn8BLUeJdXx9SwHLBg
         hV2sHNWUzA76n7fZDOBGbQvjb4IyJlDehgqNuMpFyZMguhWomFvfIKitk/0kPsXKlxfN
         JLUg==
X-Gm-Message-State: ANhLgQ2Ygbwf0lVVDdbjJZ9ztI8XcVYGXGgXVZtA2T2KbGSe+f5+GnOM
        jKDS3MGyMLq6MVQsX7ZnukGOKA==
X-Google-Smtp-Source: ADFU+vta0fIyRtESZphpxuC88pwvr1xjRflNRJ4U+UNesyEuY+m+xd0K3+8cVkrJCyM2KNvZ6DRGtA==
X-Received: by 2002:a1c:b144:: with SMTP id a65mr27313095wmf.54.1584954237568;
        Mon, 23 Mar 2020 02:03:57 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id f15sm22881505wru.83.2020.03.23.02.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 02:03:56 -0700 (PDT)
References: <20200302125310.742-1-linux.amoon@gmail.com> <20200302125310.742-3-linux.amoon@gmail.com> <7hlfoir8rj.fsf@baylibre.com> <CAFBinCB2WXZNRg4wdFD0RJ5k4hHqcfAOCHemvHzZE42-Mo5vzA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Anand Moon <linux.amoon@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCHv2 2/2] clk: meson: g12a: set cpub_clk flags to CLK_IS_CRITICAL
In-reply-to: <CAFBinCB2WXZNRg4wdFD0RJ5k4hHqcfAOCHemvHzZE42-Mo5vzA@mail.gmail.com>
Date:   Mon, 23 Mar 2020 10:03:55 +0100
Message-ID: <1jr1xjcuis.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Fri 20 Mar 2020 at 00:39, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Kevin,
>
> On Mon, Mar 2, 2020 at 6:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
> [...]
>> > updating flags to CLK_IS_CRITICAL which help enable all the parent for
>> > cpub_clk.
>>
>> With current mainline, I've tested DVFS using CPUfreq on both clusters
>> on odroid-n2, and both clusters are booting, so I don't understand the
>> need for this patch.
> I *think* there is a race condition at kernel boot between cpufreq and
> disabling orphaned clocks
> I'm not sure I fully understand it though and I don't have any G12B
> board to verify it
>
> my understanding is that u-boot runs Linux off CPU0 which is clocked by cpub_clk
> this means we need to keep cpub_clk enabled as long as Linux wants the
> CPU0 processor to be enabled (on 32-bit ARM platforms that would be
> smp_operations.cpu_{kill,die})
> cpufreq does not call clk_prepare_enable on the CPU clocks so this
> means that the orphaned clock cleanup mechanism can disable it "at any
> time",

If nothing calls enable the cpu clock while it is managed by Linux
(cpufreq), there might something worth fixing. Adding CLK_IS_CRITICAL
will mask an issue that is still not explained.

"at any time": absolutely not.
Disabling unused clocks, is done only once, at during the late_init
stage.

If your clock gets disabled later on, it means it has been turned on and
off by another driver (possibly due to probe deferral)

> killing everything running on CPU0 and CPU1 (which are both
> clocked by cpub_clk)
>
> I have no explanation why this depends on booting from SD or eMMC.
>
> for the 32-bit SoCs we have CLK_IS_CRITICAL on the CPU clock as well
> since commit 0dad1ec65bc30a
> on G12A we have CLK_IS_CRITICAL on the sys_pll clocks, however my
> understanding is that cpub_clk could also be fed by one of the
> fixed_pll derived clocks (which have a gate as well, which may or may
> not be turned off by the orphaned clock cleanup - that is pure
> speculation from my side though).

Yes there are other critical clocks on Amlogic, mostly because the SCP Fw
driver does not claim the clocks it depends on. At least we know why
this flag is set and there should be a comment associated with it.

ATM, the issue reported by Anand (anyone else ?) is not explained. 

>
>
> Martin

