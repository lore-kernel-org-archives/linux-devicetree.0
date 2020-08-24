Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F46C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 10:41:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCA3921741
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 10:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ+VblBj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgHXKlQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 06:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbgHXKlB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 06:41:01 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8623AC061575
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 03:41:01 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i13so3465795pjv.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XgbO9mR4mVK+VLe98mmxfWqoTjzntsorurnkGUqDaCQ=;
        b=ZQ+VblBjWGeESG4rusKo+1JZYRqRf6bSGcqBa0n7UR7OlQN91evh6PFcWm7y0cwdAl
         GoZGJDpLTdUtIPVhtpMg6jPckeHsuPgbiO1OBgN7vhQD6K241KUnVouI9K17/SmA6MZ7
         +dD9bsFPu01qj6HGGtRvTb5caKNSv/Z0B5egaB4dCbgeyMKmYvaPAyK7U3FTIOG97G/u
         ANP4lhMCYbhFlVxhdM/OoH45tmA6gmP0vfz4PoiBGXw8z13OtUmds+tSOcfv/3bWFlSn
         Wcx8GVsAakX8MCe1A8jTmjba7cT9q74/knHOzlGiek+AEA9vZ1v2970dJC3rTZ0Q2sLU
         xQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XgbO9mR4mVK+VLe98mmxfWqoTjzntsorurnkGUqDaCQ=;
        b=TDVBV6rCnE09ruGeDhJaaQBjcJOWq+oklIHenOIeeJ8/iq7zkEgVLX0Tpn3rv1SfpT
         L5TQ4iCxMWOOX8B302cERaNgvt+6XyqQy9PNbWizh06rw0YdlMvwd/XnG+Q/Ae6JcZPA
         8GdEPjXHZMzP934Vnb+KjrYlN/mmsHgxljUYdP5zzSiewg0fcagJmym+AjDaoo3lgZb0
         M00eL2NbJS1+1f99sk7j7hHnXM3DPF+SrphqwMhQTdnfgEilKD+KRp4LvUaVP0FisMVK
         /hB4ppUBwXb/zrg0gAbr5N3DiNRbdQ1TdulOFqxyzoBVU7KeL2wDeW5TsD9MhrG7XTZe
         TanA==
X-Gm-Message-State: AOAM532I8S7d1IQa+8mMqq8/YjQ23O6MvXkRl6bRYrXnFkFEWqMLaE6D
        SnNlThOwwFQOlgje4cCbY1mMAA==
X-Google-Smtp-Source: ABdhPJzHp5qGiAawE2z0LljcaMUrf104gCiqxPBac1WAVL6UMn9NdE5K7a2ZqlOVIeg4Fersn7deiw==
X-Received: by 2002:a17:902:7585:: with SMTP id j5mr3553270pll.168.1598265661050;
        Mon, 24 Aug 2020 03:41:01 -0700 (PDT)
Received: from localhost ([122.172.43.13])
        by smtp.gmail.com with ESMTPSA id na16sm9040302pjb.30.2020.08.24.03.41.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 03:41:00 -0700 (PDT)
Date:   Mon, 24 Aug 2020 16:10:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>, vincent.guittot@linaro.org,
        saravanak@google.com, sibis@codeaurora.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/2] Add Krait Cache Scaling support
Message-ID: <20200824104053.kpjpwzl2iw3lpg2m@vireshk-i7>
References: <20200821140026.19643-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821140026.19643-1-ansuelsmth@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

+Vincent/Saravana/Sibi

On 21-08-20, 16:00, Ansuel Smith wrote:
> This adds Krait Cache scaling support using the cpufreq notifier.
> I have some doubt about where this should be actually placed (clk or cpufreq)?
> Also the original idea was to create a dedicated cpufreq driver (like it's done in
> the codeaurora qcom repo) by copying the cpufreq-dt driver and adding the cache
> scaling logic but i still don't know what is better. Have a very similar driver or
> add a dedicated driver only for the cache using the cpufreq notifier and do the
> scale on every freq transition.
> Thanks to everyone who will review or answer these questions.

Saravana was doing something with devfreq to solve such issues if I
wasn't mistaken.

Sibi ?

-- 
viresh
