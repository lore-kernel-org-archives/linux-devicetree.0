Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DFFC432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:35:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47DEC20637
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 07:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ApxNRYnw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfKVHfc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 02:35:32 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33738 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKVHfc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 02:35:32 -0500
Received: by mail-lj1-f196.google.com with SMTP id t5so6230034ljk.0
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 23:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDdbFgRZ/DftFdgsbV1nBG702kIvVQNLzAtOboImYho=;
        b=ApxNRYnw7RNF7PQvsGNN/DGujlE3iWNW2XQcseTQC8u0Pd8ru6z/ihzMNEJkIcm/re
         /LgurCblgfHcKgzlyNijDGy8esKo60XlrWoZ1jP96DaMcmnyTswzH1mSc50dWs1F1v6p
         DChNeXGO+KcAUNpmKRxK9PTjk3FytEiEkwFrTKUtmQOIPaecR9udfRrtBYCHvKOSuLG2
         ZI3L5jQyEbN/4DIT8GQGcITW7ZNT+bz3gtGpbhDn5CMS9SpsMJeQ4hkPudMH7bjIeYzi
         HG4QPdag6HJhjC3hXPzqpN3FoxrF8xrV+AgQDeJZvIllNJxedvTfZkEGoIf64zWC6KMQ
         2lmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDdbFgRZ/DftFdgsbV1nBG702kIvVQNLzAtOboImYho=;
        b=FIC7B2QLpPJ7YZX/yJ73y38f6dx+lw9K6k4gOqn8JgqZ25ZuaFNL7fzi0PQ7CMx1JE
         fLawVZv046azJgt8OAmo5GU3E5QAXqnBJwapWTo3xvpEoFl7n44TOWmovFrGAPHiAgEn
         NbSELa6z9l4pl41rcrqlRTWuvWqhHD7FtvOwpx9il1bS+e0trt2x8poC6nbAW9KmpXT/
         Fk+HJ4j7isbtNNPDPoIF+0GtWnGrmmTo4sqhwL4mfBW2cOaQKeJjPuBEFYzd1W/7v+/L
         fzwkF8c6Nfrj1OZ5AG+7nnuff1LFIaQV0gFHJv9TbbE+0NJT3qwfrPZ6225rE4SMLUmk
         igmA==
X-Gm-Message-State: APjAAAWMqiwtHu9S/52TIrqILFOJseL5aSF5dLRdK7KZxV/dlHP5DsXM
        ZG4byoZnCN+I9Su33IkcgyrEPsFh4zl8SX7TvNcIeQ==
X-Google-Smtp-Source: APXvYqzL2vp/KKseaTOghvkAWrY9JxbNs0Ofv2U7rE+Ia0IND/xSVGjjfDmSUff7cjBMwjzExoBAvD7ZWm0tIyzIfVs=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr11128660lji.77.1574408130240;
 Thu, 21 Nov 2019 23:35:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com>
 <b59afc497e41404fea06aa48d633cba183ee944d.1573797249.git.rahul.tanwar@linux.intel.com>
 <CACRpkdYZi-0LRjih8+2cgWZ6u-eFN5+3sW1eV2ujYRd0UBoEKQ@mail.gmail.com> <bf8396af-3ace-7463-0fef-890b2f5cc487@linux.intel.com>
In-Reply-To: <bf8396af-3ace-7463-0fef-890b2f5cc487@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 08:35:17 +0100
Message-ID: <CACRpkdafN-NjGNqqu_6-Qz6qWkZ4VGuBz_iyGirgUscz-Qk6VA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 22, 2019 at 3:24 AM Tanwar, Rahul
<rahul.tanwar@linux.intel.com> wrote:

> Thanks. Yes, i have gone through Rob's generic pinctrl bindings patch
> seriesand i was double minded if you should still proceed with this
> patch or waitfor generic bindings patch to get merged.

It's a compromise actually.

It's a bit of struggle and tough sometimes since I care both
about the kernel and the autonomy of the DT bindings
communities.

We are in a transition phase to YAML bindings, and what is important
for me as maintainer is to have developer buy-in, and
it is more motivating for developers to work on this in-tree
than having patches held back. I personally know how
important it is to feel that things move forward in
development.

Now it should be a separate task on top of what we have,
which is less stressful and gives the feeling of a bit of
accomplishment.

When the new generic YAML bindings are proven to work
on two drivers or so I will be more demanding that people
use them in their bindings from day 1. But we need to make
sure it works first and that is a separate task.

Yours,
Linus Walleij
