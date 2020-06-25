Return-Path: <SRS0=bF7C=AG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB0FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 09:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E20B92076E
	for <linux-devicetree@archiver.kernel.org>; Thu, 25 Jun 2020 09:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="HqiQRb0B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390904AbgFYJhB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 25 Jun 2020 05:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390074AbgFYJhA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 25 Jun 2020 05:37:00 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CA7C0613ED
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 02:36:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c21so2849526lfb.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2020 02:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RnEBrQRLE1A17BuChdvyxVDc8sepHuIB2gbe0rLfuU4=;
        b=HqiQRb0B9Qp4jZNOzOBU+ZZsG9BHYPfyxziQLBKS9VUqlBTmHcupeuVRnB9px8fXta
         GGapfozqxbJezjsIEcZzgjsRkmFA1I8Qr7O4DVcRz0qX2MawDB9w7tqlf75MclgSR2Bq
         FIkblQKNbXMWHzERLB9HU8Vh/SSMV8jmOhLgFU5TfnVq8CtqonZInsdNqR7dgxrSEtcE
         n8cKY1chcOdpMR0pSJbkfYoXUKWBMH5XNxoj+Zqs6mlqgJC4CvzLXcZA9zI4ivg5dKzK
         B+ohs2+wFfpn4SYqHtcieM7C9zOdbIdwvPhU+SGvGh/MLqNoulp2r86JzMQ3O1slb2kf
         5IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RnEBrQRLE1A17BuChdvyxVDc8sepHuIB2gbe0rLfuU4=;
        b=ppEiJgnDB+u/asUC67jOTOKcxgwUlxy+52pFkTRe84v+D+T/NiCdp+hD3kCP+/B+xt
         gmB4UriLMnwK42iHjPwF+fbGptLgZR4xaelvC3CZX25eyQJfCYcF675p0S3bMGZSmmed
         QdtcLasPVhB6D7d9nqm3NBwpNzoB3MeKRiXWIOo87BJdEaFkGCZBiZkVhcmcSstX4Qo7
         hHz5ZdFonGE02bxLx2z1pJGTtn1uniolN4PLmvjkiOG1KLi2TMs/DzC+QXsXdiqRSRIN
         hZNoI8SJMeMRkQ1Y18WW65XGSTjR/nTH0PrFRU4AnqgCkBF3k/bDoEbNYMPY39EwVI+y
         EQrg==
X-Gm-Message-State: AOAM532nXlYbneYguoKhIb7DpQypHDy0hylSYmtGHo6J7avWC+1iavam
        e5zn7tV+7u+gKlgOE0jmOIvNSg==
X-Google-Smtp-Source: ABdhPJyZ0zneCUtrqOHUqrWXK+RPvNM0tIG8pZ6lhxr+NlOHHWGvv+DvxhiWHMqfb7FGDS5i4e1zWg==
X-Received: by 2002:a19:83c7:: with SMTP id f190mr18042262lfd.14.1593077817815;
        Thu, 25 Jun 2020 02:36:57 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44da:b8e6:887f:f9f8:ffc4:9fb8? ([2a00:1fa0:44da:b8e6:887f:f9f8:ffc4:9fb8])
        by smtp.gmail.com with ESMTPSA id f11sm231400ljg.10.2020.06.25.02.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 02:36:56 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a77980: eagle/v3msk: add
 QSPI flash support
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <13425133-eedf-081f-4ed7-cd9012ce7d6d@cogentembedded.com>
 <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
Message-ID: <2bc79e8e-953f-2d9a-1bfb-798aac9ae2ce@cogentembedded.com>
Date:   Thu, 25 Jun 2020 12:36:55 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fca1d012-29bf-eead-1c0d-4dd837c0bc68@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

    The subject should read r8a77970, thanks Geert for noticing...
