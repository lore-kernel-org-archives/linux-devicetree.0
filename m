Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F17C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 00:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B25E2075F
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 00:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0MXHmlA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgEUAQW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 20:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgEUAQW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 20:16:22 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABE0C061A0E
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 17:16:22 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id u22so2047451plq.12
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 17:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CKY4Oy0szHs+SXs3qF7IEEqqnuvplQ8KwCGvnU/bQpo=;
        b=U0MXHmlAfP5P0MqzM52RDzGO5Mc0i+3XvbBbg9U6S24BmvWfGRenxhKSTnLNNDGuTe
         FjFq+eNeILeu1kr4TJcES8XpSkxwcMYv+OEVCdySiWlbjhysk9Lj71KOX/jRvj3aHP9U
         DiA1rTvm8ZKkZE318umsJUVscdZYFN3T7uWBheP3YiX8J6EOhcFotN0Y5Ge2yoiwjTTi
         TKeYzilmALmWGYD0ij+b2uC2Jp4wwqpcChFGSTwOQ+0J40Fqt/dIkYXetwcOhvICuTgo
         afbuIdobI5mq2VjloKbonmTdwOLgDYX4BkKtcx+sFAtqmWBwThuGF7f0y8pKPNG3xzhB
         DG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CKY4Oy0szHs+SXs3qF7IEEqqnuvplQ8KwCGvnU/bQpo=;
        b=Rs73bJMvAca8WcXlRmOCJ+Xm1FAW9zrnQl955aM8s2wFFZboweZmYJzoTdIfKoauzk
         N0Bff00EkGaTlSaWqWBTCVPw+HlCb9dC748wenHckm7sdzSUeRzPS2soQhM7w5ACR+kE
         iXwapIsK8KEQYT80yweqYS2/hI4nukyiRncJr4hrczOpRkSwz6ZhMJdIg0efEx2vszBf
         4BZZmHBO9EUuU8b7F0AIKfDtdJZNI18oMlimw6Ubulsc0fe7G4VbCqbG9oy+kLnhfKK7
         H6EUlhC1yFqLWM4zSZxIT3kjohGllvt5AwGgsbESParYa7v0PlzDWMDw9WWUYr8ElAcI
         T+6Q==
X-Gm-Message-State: AOAM530eeyQJuRtt2Ci99Mki7kIMF6Uhujubw8jwTm6ZWYBbvuxsrAUq
        nsgg5wXHcd7IxB1kAui6oxY=
X-Google-Smtp-Source: ABdhPJxi36xznhpVJ6XOVpnfYkK6ARWMDgwnxhExFJhhPjgXaNjA9xT+s+E+k1/yoGttFPYrMAhh4w==
X-Received: by 2002:a17:90a:a401:: with SMTP id y1mr2385842pjp.204.1590020181621;
        Wed, 20 May 2020 17:16:21 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l1sm2598255pgj.48.2020.05.20.17.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 17:16:20 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: bcm: HR2: Fix PPI interrupt types
To:     Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
        robh+dt@kernel.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200520043042.7281-1-hamish.martin@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5ce77bf5-b61c-397d-feaf-29e9f80875bd@gmail.com>
Date:   Wed, 20 May 2020 17:16:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520043042.7281-1-hamish.martin@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 5/19/2020 9:30 PM, Hamish Martin wrote:
> These error messages are output when booting on a BCM HR2 system:
>     GIC: PPI11 is secure or misconfigured
>     GIC: PPI13 is secure or misconfigured
> 
> Per ARM documentation these interrupts are triggered on a rising edge.
> See ARM Cortex A-9 MPCore Technical Reference Manual, Revision r4p1,
> Section 3.3.8 Interrupt Configuration Registers.
> 
> The same issue was resolved for NSP systems in commit 5f1aa51c7a1e
> ("ARM: dts: NSP: Fix PPI interrupt types").
> 
> Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
> ---

Applied to devicetree/fixes, please copy
bcm-kernel-feedback-list@broadcom.com so we can have our CI pick up this
patch. Thanks!
-- 
Florian
