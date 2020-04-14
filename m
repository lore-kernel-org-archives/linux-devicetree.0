Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635C8C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:27:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DE2B20775
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 16:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JU9OD2Gm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391595AbgDNQ1x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 12:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391589AbgDNQ1r (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 12:27:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE259C061A0E;
        Tue, 14 Apr 2020 09:27:46 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m2so233890lfo.6;
        Tue, 14 Apr 2020 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wItdl1kg1ho/UCt0W/llhzqoO/4ewYoe347wz3vvN28=;
        b=JU9OD2GmTJxJzR7SI4BSza5QS7a+nLF2rIyiM0O4JOYm9/yfjrce7nyvTUJAljDxk6
         GRc9hWnVaw+cOR+LpQ+1qk9iB19WdQ3H6n0OVUvOGIkqqB3Ym0e6RVZ+gLDmvuCk/tBU
         v62qrV8mqw/y2a0RuWQy80IS0Sb7KXoXQ3UYICIqe9e+dKFaHLsMzwAO2sToe/0CQzmk
         Nq9utwFgN5ecpsTm4jVcTNmd/1/gsXgpw2lXmK7PLAgpggIZqXZgv7GnU5Uv+1QJO905
         S1HWQ9CdgXvR2h36WKVxPz0P6alNB2fk3VotkD5dnUTdp5PxDNOBx/DrlpxlhJi+04Ha
         ezHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wItdl1kg1ho/UCt0W/llhzqoO/4ewYoe347wz3vvN28=;
        b=Ry6zNU2qRwAC0jjmur6gMPZwHoPOuR7ThYysXX4EVySNuxYa5FVio+wbZeWc0jzP1A
         JZ8eGYdhzuJaCFuPaIpk8m4p8EDcLyemqeY+yQGdCoN2uca7HseT4d69EuuK4nyYj7P5
         yxMcNFBJ1epEWGIRN0qe5iZEXOOecJSc1o5YfVmXZDSvqUjfPWrEcuGAtYeZbDViDApr
         6hqX9fg3wafo3lschsEmevxOKwrsMX+ftrwA4dOZQ/MIjN2YGw5on2nc2AtmP1aCaKVx
         UPzZSCahTelRb37b1tBeVgJSoWFOizL2Lol4C52kBtqRryeWjkK38uBFbD/EsTyUIX70
         B9Mw==
X-Gm-Message-State: AGi0PuZgVnKbSwcpMdpV5SQnJ19gdkW5a0ME6EcdRIdq2BvH5qUV93DG
        f83DmZ0FDOaYxPfJBgRYIsw=
X-Google-Smtp-Source: APiQypLfq8BURObkeqYvmT3aWY78Mdp4f1m77k1SBUPP6KkCEAuVyA/nceq/cBM66WxaiSQA/ECeuQ==
X-Received: by 2002:a19:760a:: with SMTP id c10mr394527lff.126.1586881665309;
        Tue, 14 Apr 2020 09:27:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x29sm10673621lfn.64.2020.04.14.09.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 09:27:44 -0700 (PDT)
Subject: Re: [PATCH v6 10/14] memory: tegra: Add EMC scaling sequence code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-11-thierry.reding@gmail.com>
 <682c661d-ea3a-7b9a-42f0-d5473b969aa2@gmail.com>
 <20200414154526.GP3593749@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e050baee-89cb-dba1-544e-77b1662ac6b7@gmail.com>
Date:   Tue, 14 Apr 2020 19:27:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414154526.GP3593749@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

14.04.2020 18:45, Thierry Reding пишет:
...
>> What about to try to replace this massive egyptian construction with a
>> single "u32 val;" ?
> 
> I actually tried that after condensing what this used to look like into
> the above. The result was a huge failure because some of these temporary
> values end up being reused, so I ended up writing bogus values into some
> of these registers.

It should be fine to keep those variables that are getting re-used. It
looks like there are much more variables that are never re-used, and
thus, they could be replaced.
