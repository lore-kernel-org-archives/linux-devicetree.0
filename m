Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AB8C10F27
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D454222C3
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 17:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7j5Msw2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgCJRDJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:03:09 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43496 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJRDJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 13:03:09 -0400
Received: by mail-lj1-f194.google.com with SMTP id r7so15004834ljp.10;
        Tue, 10 Mar 2020 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8uzCtHMtKc+Ukgc53d5DhiEC9NN86qL18Zwc8LJrgsM=;
        b=D7j5Msw2O1mYNlZmRtu46hxI/JnchFjcjnRT/SiFL4eFAEUk8YYIhZ+45xHzEUx4IQ
         Li9yvlz6nmGa9MhB4flubcbU4u8hLhyJwsweZZJLPJwLGhFaTqkYA47InQYEPKSu9rrb
         /3hqr9u6mBbguSchijdRu+Mg2Dk4MtAWJ6jH4/jrbui9oJgF7725kiDUmbxMK6UDVw8b
         8A83/h6FSe57UM2vWoVy5SiHpgymSW5r+ec3ygAylj6OKhUWGLBT3DYSdswSahy2pVc6
         YDNzelZi2Bo0dfwJtMgRXl2Y0PxqODie1HOF5reMnUk3FEYv7ie5EBT6iNQuflFw7eOD
         OAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8uzCtHMtKc+Ukgc53d5DhiEC9NN86qL18Zwc8LJrgsM=;
        b=r7WE7AyNfxditYvYWXzcYIo+tYm3zApqlAlTgFVAyXsQ6+9dNX9FgMYGx3R60fob+L
         ozavp4nFFGFt2GJ9a5V0JPP+EL8FuTOwMIWqOswaFgbJ8odkFI+QN9rFwjwfcIduFyaR
         AtR6M8zH3X/ViXejfHhoxO9RNqobyHLQdoSe9JLiez5HqgS3YA9MEmeGOLYfBGlUFumB
         LCt3Yry4mUXg4GPDOo4SCIVPPswwAMA2aO6DFpYVgi6+IVDS2QP0MS1in6DDC+P2XPyE
         MKs2+03DF9SYmeY0u6y8eqs3psSuHDDDNBD0D3DjCf5RLVZLoSjiwKhcj3X7mPln9psM
         Qolw==
X-Gm-Message-State: ANhLgQ2FL+W1tLcnqT5jSEyAJ1FenOdRDVjhyFAEjit/J/LxkbAla8IR
        /PPlqGBqh+UNydR8R4yRvYw=
X-Google-Smtp-Source: ADFU+vsD7JVbSlhHqsR/bAuNFBl0fEmdRVN9C0kKVDlbF7Tap+6xUjFjS9g2RwYIghOZtsgcBNKqUQ==
X-Received: by 2002:a2e:894d:: with SMTP id b13mr11777580ljk.99.1583859787084;
        Tue, 10 Mar 2020 10:03:07 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id x191sm7058845lfa.22.2020.03.10.10.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 10:03:06 -0700 (PDT)
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7a4e0ab4-e17e-9e6a-2d30-d9a321be1dc8@gmail.com>
Date:   Tue, 10 Mar 2020 20:03:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> The EMC clock needs to carefully coordinate with the EMC controller
> programming to make sure external memory can be properly clocked. Do so
> by hooking up the EMC clock with an EMC provider that will specify which
> rates are supported by the EMC and provide a callback to use for setting
> the clock rate at the EMC.
> 
> Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - major rework and cleanup

...
> +#ifdef CONFIG_PM_SLEEP
> +static int tegra210_emc_suspend(struct device *dev)

The __maybe_unused attribute will be a bit cleaner than the #ifdef.
