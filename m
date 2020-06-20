Return-Path: <SRS0=+D0Y=AB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73335C433E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 18:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 540232074A
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 18:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="eq6Aj1TW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgFTSfV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 20 Jun 2020 14:35:21 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36152 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgFTSfU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 20 Jun 2020 14:35:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id i3so15064617ljg.3
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2020 11:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDnWtPHPaOLUtABOCxMTzOdKJ3ttE96ZinRb322rFx0=;
        b=eq6Aj1TWfX62VaSFm8GnPxrXZNN+8/K8sypfOxY1QeqKihH8NJWlgN9A+0TKZN5cnl
         qAWgj9uiqZuOPqOL6DF23YRMMgvmxnqj+4dYT1WDslruTsvDBvfYfT/MmRXPwH6+Wtxw
         2Qd7iK1LroPvJO2/JzDajs5JREYR3E+UXGrTN2vwHqW2sr+2M9op5YurGJgxD+IAFg7Y
         tor1wc3MUUFJjDNjeP+Jq5pBI5quxpbwf4QSff7VDem1n7AmwZyx0k1yQXyTuA8vr7vI
         fvNoLzEOvZfymYFAjzPWX1xFP06AqT2JjzvnCBX3/cAoSvPFsx5Pf/ua9bedWdJb8li1
         tpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZDnWtPHPaOLUtABOCxMTzOdKJ3ttE96ZinRb322rFx0=;
        b=Gm0c/xWz0lhHGbxfY82888Tr/69isejxa5dqDCy9yc4PKlBMI2wIBtJYzmzCb6cU1p
         4qMJOTRX1W0fj1CQMsvYSlyq9EP45vUFcmJoTYeg86hEnKACIwI5WvYAek63vyovLymr
         ZaskL8qA+P5yeylP/1o8wgjkk7UTAEZY+kBiO/e/qHfmT6LoQM6okecscblCklKj9/Ht
         Jc1ws0d5mh9Fa92QJJIKV1vXLI+yLlOvnxK3I67PxFj7Y4auKwfF205y1glGdErvGJgX
         35b6M+jtnHuHnnAFclGGVTNhR0+lJYDzKOlJZQLEJKMbcTzLTty63z420P75i8y5g4CJ
         CZIQ==
X-Gm-Message-State: AOAM531ChweT2fJsqFMoBwRsCBwrukcwiF61B0XjrH6NV93Up8l+kcBk
        NHPvETjdjaLXh2AwWPBkVoj1Cg==
X-Google-Smtp-Source: ABdhPJz1js9/2hjpd6079DaMq9b36qjlv/9tLhUqKKYyHRN3m6/2hoCtQItXPNpPodjiLRzzL2hWvA==
X-Received: by 2002:a2e:8346:: with SMTP id l6mr4404144ljh.209.1592678058239;
        Sat, 20 Jun 2020 11:34:18 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:462b:c4af:1cf5:65ea:51a9:9da1])
        by smtp.gmail.com with ESMTPSA id q13sm2218822lfb.55.2020.06.20.11.34.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 Jun 2020 11:34:17 -0700 (PDT)
Subject: Re: [PATCH/RFC 2/5] ravb: Split delay handling in parsing and
 applying
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200619191554.24942-1-geert+renesas@glider.be>
 <20200619191554.24942-3-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <cc7f8090-2713-7b9a-55ad-effd43b7a61b@cogentembedded.com>
Date:   Sat, 20 Jun 2020 21:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200619191554.24942-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06/19/2020 10:15 PM, Geert Uytterhoeven wrote:

> Currently, full delay handling is done in both the probe and resume
> paths.  Split it in two parts, so the resume path doesn't have to redo
> the parsing part over and over again.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
