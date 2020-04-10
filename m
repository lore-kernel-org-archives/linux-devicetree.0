Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B104C2BB55
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 20:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15EB72078E
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 20:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNO2u9EN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgDJUq3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 16:46:29 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39866 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgDJUq3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 16:46:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id m2so2194096lfo.6;
        Fri, 10 Apr 2020 13:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I+22ZdLvG5Rujvbq/B2qtEVig1LNO+Yt4MNm4tY+6JM=;
        b=kNO2u9ENzzNIXOmnOwjmNREPT3/M9v4uMOY++O3kr9ViuQLLx0++ZXjaoimcQWx08b
         tmL/Lyq6MSMTohfP08eJ3TijhlhSChRqEpAyVn0sufycEaKel1BwL+duv1SPFhE/Rbs6
         A+Ed1tI1dMtotWuta+NGlMk5sjwU7uiPM/3UVivB9N1FtkerKbrnTADbBGJtrchY0W+6
         S4d3nupp5gLMOjoczlaTNMiYsDi22iHy++YDe636HKbomw3r/dmFCSjMwyp44XMGNUMs
         GzjTfx/VnEFvXqKPABsgY+rDRnDuJQ16HyvJ/9dYqQYpbV6RNCfuO9RVHwfxcoUrLKi9
         Nfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I+22ZdLvG5Rujvbq/B2qtEVig1LNO+Yt4MNm4tY+6JM=;
        b=oYCL2c474Oqg+ktV1k2t8Ahgldbxz2r6GfBUVMdEc85fkWCAUX6iYBKNpB6LTPW62F
         QbIZR2MoEeZfdLfPl3fAKfLote8qVt+dM2XnWlbzikweNdvL60SyjmPMo3Hc7v8cT52p
         D3OLMPOwggbDFjsHqZKCI6GHnO+XbnZHlov1LKro/hUZO2jHEleBU3s5TAlXPuHqJslY
         RmP1u1xR/BxCT7tLjJTQcZEBcu680OTS1dh5eCE4iaKheAJO53JXHVW7cpU/n5ad6ZiT
         gd0eAEa7353WFz/7WtY5EaSEwQKayTCzhguHPDYqdX6atC8HRK4lv6+NILntOgYXvU74
         FXIQ==
X-Gm-Message-State: AGi0PuY0m6XxO2WAnVj03xSk3GKVNCprO2BcFAlodf6hp9MzZRReqB+h
        1ofxIxAMj0fN1vj66EQWiCQ=
X-Google-Smtp-Source: APiQypIoT9tmvJ8Grzu/GhsTxVJ9fNzQs2I967ArH5Rq3yRTbrZrU3tmptJ+UnCrQLYAuh5qjSqxog==
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr3575749lfe.158.1586551587266;
        Fri, 10 Apr 2020 13:46:27 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j13sm1974258lfb.19.2020.04.10.13.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 13:46:26 -0700 (PDT)
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
Message-ID: <fae8e1f5-753b-b2ce-d14f-c6e8b2061fdd@gmail.com>
Date:   Fri, 10 Apr 2020 23:46:25 +0300
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
> ---
> Changes in v6:
> - use __maybe_unused instead of #ifdef'ery for suspend/resume callbacks
> - take exclusive control of EMC clock during suspend/resume
> - move EMC driver changes from clk patch to this patch
> - make the driver buildable as a module
> - remove unnecessary suspend tracking
> - remove duplicate register defines
> - add tegra210-emc.h for Tegra210-specific registers
> - detect number of channels, number of devices and DRAM type at probe
>   time and store them in struct tegra210_emc, remove the corresponding
>   function parameters where no longer needed
> - properly clean up on failure
> 
> Changes in v5:
> - major rework and cleanup

I happened to notice that the patches have an individual changelog only
by accident :)

Next time will be nice if at least you could mention about this in the
cover-letter, or move (or duplicate) the whole log in the cover-letter.
