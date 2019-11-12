Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5304C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 11:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A803C21783
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 11:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="YQjFpZVe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfKLLos (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 06:44:48 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45930 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfKLLor (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 06:44:47 -0500
Received: by mail-lj1-f194.google.com with SMTP id n21so17420655ljg.12
        for <devicetree@vger.kernel.org>; Tue, 12 Nov 2019 03:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AGTZ4z4pclCTP3TaM1mEYITa39uvJa7zWe2VFGpsFtQ=;
        b=YQjFpZVeaTEeO+20aG1CP57qzaQF/K4s2mQxLVMo5aM1+z9UfnwfSbr7sBrXNeUdSb
         pNj4MTofPx+/HhftTnVorbdrJyVPud+NQIUoL22TugPPO+/VITy8aOcQJDyHzDHybi94
         wduFdCh0K/RrDq1CbsTyyRTTX8ODY/dacP36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AGTZ4z4pclCTP3TaM1mEYITa39uvJa7zWe2VFGpsFtQ=;
        b=a04xx/ZvDofKhKRlNOxVDOWSjTX0Ib/9+93Xt3uxlJFXYtz9uCWgpcrM/7zUsdTJQ9
         SW5GCaSdA7PeXDd7zgH6hv51yrYpT9a3f18lBTWsI8LdDU5zucuPNofZhLH4QoT+WZJv
         z2A4rPbTS+QQIkmju/+kHsnhL53yAovmu+dRZYaFITcEuUUwp+p1eY/jhbP+AbExMrb+
         Fz+YCZAQhozVu8falwN++UIhJCn/aKEwO4kb0N1Hg+nefaUEVU236aOTKMCG5cngP5OJ
         7o1Sc9xeD5oO1gw/WXxup35B3M4bqcYrC0CN7zrAU8bJI4/7fAXiEf2iLrO7ksYilPAh
         UyiQ==
X-Gm-Message-State: APjAAAXVbYay94Ivz3o9SC2OeBqmK9PKViUVcWPBJgX7Wshg6T51tHnM
        GiZRffBeTPs0P9EuZjLfwQJO5Q==
X-Google-Smtp-Source: APXvYqy+lw2SLMQFCUkQpJRfNsuioc2JKvqERf+YtVC3KryQWbQkhR/tX0NqbPKizKDXtkq4OOdBtQ==
X-Received: by 2002:a2e:8e28:: with SMTP id r8mr19360726ljk.21.1573559084029;
        Tue, 12 Nov 2019 03:44:44 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id a22sm8189817ljn.58.2019.11.12.03.44.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Nov 2019 03:44:43 -0800 (PST)
Subject: Re: [PATCH v7 0/2] Add support for Layerscape external interrupt
 lines
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Vladimir Oltean <olteanv@gmail.com>
References: <20191107122115.6244-1-linux@rasmusvillemoes.dk>
 <ea802f081d1f1d4c5359707ff4553004@www.loen.fr>
 <184b684a-7712-a280-fdc2-83d7abd3cbd4@rasmusvillemoes.dk>
 <8e1877ab5a1fecace3b2383789bdf404@www.loen.fr>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <02f7a8ad-be85-b43a-be36-988d96ced056@rasmusvillemoes.dk>
Date:   Tue, 12 Nov 2019 12:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8e1877ab5a1fecace3b2383789bdf404@www.loen.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12/11/2019 11.58, Marc Zyngier wrote:
> On 2019-11-12 11:27, Rasmus Villemoes wrote:
>> On 11/11/2019 11.24, Marc Zyngier wrote:

>>> Applied to irqchip-next.
>>
>> Thanks! Can I assume that branch doesn't get rebased so 87cd38dfd9e6 is
>> a stable SHA1? I want to send a patch adding the node to ls1021a.dtsi,
>> and I hope not to have to wait another release cycle.
> 
> I usually try to avoid rebasing it, unless something really bad shows up.
> 
> Now, just adding a node to a DT shouldn't break anything, right? You
> should be able to do that change and get things working magically once
> this code hits mainline.

Well, yes, but I wanted to refer to the binding documentation in the
form of a reference to that SHA1. But I suppose I can just do that in
the cover letter or below ---.

Thanks,
Rasmus
