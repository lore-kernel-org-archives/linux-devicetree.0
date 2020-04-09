Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62E0C2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 23:56:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD5F420757
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 23:56:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGFleZwj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgDIX46 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 19:56:58 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41256 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgDIX46 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 19:56:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id z23so200714lfh.8;
        Thu, 09 Apr 2020 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h7ou2+MWS5yebpK+PkJaL1qSzOXz/nH64pUokezkgN0=;
        b=ZGFleZwjigSbIXhSeJj/RBOKq1ORM7YyqiRg8grGG6Po3qc4jpwEaMak9ZRmwk5wgN
         WQsVxyJRGFydj9/1SpgNvPKwTWBHH1DEl36qBoV7xT2CEf54yhW1pnsXZ1UVO3dqjbkM
         zyUcsUE7ua7lUZVMlhyOuRctiGCtcx7Xim3Yhv6JH0uKTJCfhX9G3UyieZDK5Tj1YlaK
         r86f6QFFQZ9pCkzdHPTWxxRGZ5LKzctKjCaXbzDkhzv22N+HJSIPm4EsSN+yjkEFf6Af
         8APR0MGmRFSoptFGAFCozmY3c4WBszAEVSfZKkAApzaPBRpZ66insE26eSaFkKPdd2m+
         NbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h7ou2+MWS5yebpK+PkJaL1qSzOXz/nH64pUokezkgN0=;
        b=d3rqiFb8pwhmpbtsx17gOxtVd1/wKt924rltDQdp7VxYI7OFgG96BmgWJq2hQf9HkM
         c5PlMPxig+1FTq8EXy2R8eJwxgsNdLGF2S/1AHkn3gZ51UIcva54+criPNErj9mO+X4R
         JxmWU0szC+CSoTRk7tyRe1sXmqXGdOFXN9KNGbs4gf1Aorp6avowTiLVk77R7Mot++1q
         znhReP5O88DswIlzqRVpT4hBGx0pHFKaNRMiCjwQ2mdRe5UnVDlQ/A+V6PKB8wC2VrnW
         Ezz2LW8nhJH/dGp2aGaX3IER2lQdHEGzpip81GG/2CI1sI2NL4wl2ddgRm3w6v3h++4q
         lX6g==
X-Gm-Message-State: AGi0PuYcneq6vl+rTJde9kt1gltKK7bGCB8kYnPvnfVbEF2K4SE2EMXm
        heDPKLq2H51V1Dit7VGIwf4=
X-Google-Smtp-Source: APiQypJR6KOA3fPvqfWuaqk/S2szvx9gudiDB0qTYW3KcISCqn+kQOJFAM8qa4TSuauFyPNKMPiElg==
X-Received: by 2002:a19:5f45:: with SMTP id a5mr1006421lfj.18.1586476614994;
        Thu, 09 Apr 2020 16:56:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i25sm131562ljg.82.2020.04.09.16.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 16:56:54 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
Date:   Fri, 10 Apr 2020 02:56:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC		0x19c
...
> +#define CLK_RST_CONTROLLER_CLK_SOURCE_EMC_DLL		0x664

I'd suggest to double check all the macros and remove everything unused,
to not pollute the code.

...
> +#define TRIM_REG(chan, rank, reg, byte)					\
> +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
> +	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
> +				 rank ## _ ## reg ## _INDEX]) >>	\
> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
> +	 +								\
> +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> +	    byte ## _DATA_BRLSHFT_MASK &				\
> +	    next->trim_perch_regs[EMC ## chan ##			\
> +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
> +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
> +
> +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
> +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT) & \
> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
> +	 |								\
> +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT) & \
> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))

My eyes.. :P
