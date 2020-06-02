Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFC9C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 21:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64AD22081A
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 21:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u5MYBT4t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgFBVzf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 17:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgFBVzf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 17:55:35 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67554C08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 14:55:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d10so230057pgn.4
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 14:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0IolMfSisVxino/MKKftkabi/EGonQeZClfhpXkpxw0=;
        b=u5MYBT4tX/hslzwoAQaMfebiNzJDr17d8ZUHvwYODKZTkoY5ZvznCRWZ2RcCMGaJQv
         MGCKhVr18qnIpxLLq83h87AkkLImauiYt+fZMfYLlXncOT316jpvjhLZmTbbLvzDsnNY
         E9mMWLDmDSEU4sS+5Kxc2ZCUHHJwqpJOR07aV9HwseNMA/+/tvVGIHUMb6kCQ8NdvqLS
         3EL5svUm3s8LQcxNgyrmS2LAVrb0dzdLXTxJaZvSe+WTeXwZZALKkhqczx3+m4qS8BFw
         a0QnCN+pWeYuzuYkHmj8BuDpw8EpjNq7VHxsGGmWA9JUz6XV/MkNw2zF5PBz7QgJ9qdJ
         W8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0IolMfSisVxino/MKKftkabi/EGonQeZClfhpXkpxw0=;
        b=YJHSv0iHEbcktQxpqKkwPlFFSuA+mUykGftqb91nOsbnhcyP+3PaHywLJWcD7R24Nx
         sAALJoXUyS/4Hz5H1sHr+NVBAt56fEb5kDDCdGHqWDNYOpf8tVlPmbv3TMWoJ1uXv8zT
         cyqF696bhhaQ+DnAVS6cRwP21+Sd1EXUlNd8esPfG1jw2jLo8xbGLnlr/YlSDQsQwyg+
         A6VoGVyMyOlZejlPILwEVdad16GkJeyMxfIHzVEuusBoW3Daq1c9JkFt6DwifH6qt3Un
         Mz6hcUCD2fHTQEwMUHZza+Pq8INxtTQcBZbhhNIepgwl2FrTBs88lKsd8wXot+tShsIS
         mCNA==
X-Gm-Message-State: AOAM5317srPafDn9qMdT6hy0IPNcbbtESepqsc7VsTsMrE9KylLPavAb
        JJfJrzv9cD550CsqTwuGxy7IIUSS
X-Google-Smtp-Source: ABdhPJyeOe3U5WW1qU1+nRdPQfwTti0VtW1m3PPcEWtGuKliyAfZLtwgCZStaYSH1hvuk33A4bhTHg==
X-Received: by 2002:aa7:9431:: with SMTP id y17mr26053227pfo.33.1591134934858;
        Tue, 02 Jun 2020 14:55:34 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o14sm103913pfp.89.2020.06.02.14.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 14:55:34 -0700 (PDT)
Subject: Re: [PATCH 0/3] ARM: dts: NSP: Add support for Cisco Meraki NSP
 devices
To:     Matthew Hagan <mnhagan88@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1591114003.git.mnhagan88@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <80fb3020-22ee-26a4-0286-137b5388a0ab@gmail.com>
Date:   Tue, 2 Jun 2020 14:55:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1591114003.git.mnhagan88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Matthew,

On 6/2/2020 9:11 AM, Matthew Hagan wrote:
> This patch set adds support for the Meraki MX64(W) and MX65(W) security 
> devices. There are four devices in total, all using the same basic hardware.
> 
> The MX64 series has five ethernet ports connected to the BCM SRAB. The MX65
> series has two ports conected to the SRAB, and two QCA8337 switches connected 
> by SGMII to SRAB ports 4 and 5, each providing five additional ports.
> 
> The W variants of these devices have two BCM43520s on the PCIe bus. On the
> non-wireless variants PCIe is inactive, hence separate dts files.
> 
> 1/3 contains common bindings for both Meraki devices.
> 2/3 contains MX64 specific bindings.
> 3/3 contains MX65 specific bindings.

Glad to see those patches being submitted upstream to support those
devices, don't we need a change to arch/arm/boot/dts/Makefile to add
those DTS files to be built when ARCH_BCM_NSP is enabled?

> 
> Note that Chris Packham's "[PATCH 2/2] ARM: dts: NSP: avoid unnecessary probe
> deferrals" is also necessary.

Humm, I am not sure this patch is really the way to go, but I have to
look at it again.

> 
> Thanks,
> Matthew
> 
> Matthew Hagan (3):
>   ARM: dts: NSP: Add common bindings for Meraki MX64/65
>   ARM: dts: NSP: Add support for Cisco Meraki MX64(W)
>   ARM: dts: NSP: Add support for Cisco Meraki MX65(W)
> 
>  arch/arm/boot/dts/bcm958625-mx64.dts         |  15 +
>  arch/arm/boot/dts/bcm958625-mx64w.dts        |  23 ++
>  arch/arm/boot/dts/bcm958625-mx64x.dtsi       | 136 ++++++++
>  arch/arm/boot/dts/bcm958625-mx65.dts         |  15 +
>  arch/arm/boot/dts/bcm958625-mx65w.dts        |  23 ++
>  arch/arm/boot/dts/bcm958625-mx65x.dtsi       | 321 +++++++++++++++++++
>  arch/arm/boot/dts/bcm958625-mx6x-common.dtsi | 172 ++++++++++
>  7 files changed, 705 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx64.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx64w.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx64x.dtsi
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx65.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx65w.dts
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx65x.dtsi
>  create mode 100644 arch/arm/boot/dts/bcm958625-mx6x-common.dtsi
> 

-- 
Florian
