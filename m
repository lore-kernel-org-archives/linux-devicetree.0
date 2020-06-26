Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDCDC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 16:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C5D92075D
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 16:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWmgsVPj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgFZQEB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 12:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgFZQEB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 12:04:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2142C03E979;
        Fri, 26 Jun 2020 09:04:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so10001161wrc.7;
        Fri, 26 Jun 2020 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ldOu+GBWkRUkKh/sbBFvoMeVdq/bBluTg0VXKcUZyJE=;
        b=gWmgsVPjwvPb4wUvvt+CPJBQprsWz3CZNv5pJ2Or1vsCO38BJlvVEcno2wcKrr4O4u
         34FpRlP39oCIBmP/f+3a6gdn+YFFSofU27B5zv+gIKOEfbNROIZGdql4CM88hV6KGbDD
         eg+KA6YAvgqYLXkaoQ0bqPA12JMsZvApWCakIgc/+hmKkmnLf+Ulnc9YZ7RzntSl2ErX
         PbtwdhRPWvh4iz4GU+i78/HYJUBDpxUc1p+uE4/IMEzvrDPO76+/OYxhDINX0YC6u4fu
         k61KgsHsOcP/3WGA+CHfHxaKXzyFJIRwLkbYptJUsi6iP0f9FpPiQVF3cyRZc+BR7fKx
         LzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ldOu+GBWkRUkKh/sbBFvoMeVdq/bBluTg0VXKcUZyJE=;
        b=bGc4rEhL4Cbq5MFgcuYm7FEJn04yQeobsaJmUo4PlSHjPMKESdgxOR2QpeRVcJ3jox
         GlWvPR7AMcSSQ4x1W6ApOj+iQqqfEg0vKF8JeJqIO2ItT9CQHfLi6lKuYy3uH72YNXqp
         UFjKsYwmyqZEVLeX1X0/1ClxrBW1aaeStnekccxWvzfsLR3ng0KI40GOC9SWFFahA7mF
         E12RntwCwyjUg2j8yjdqYD7dcw9vHC3EFEcnd0j+yHxFpAaszJpFJhi3RGkcxFJdtC2k
         5Dohk05kG5SqnuCDgN1uLgNsRZ4bnyVZnBxxqQwqhwPjmcHHzNhN9Fo1PCPlAeCb7f2n
         g4aA==
X-Gm-Message-State: AOAM533oFB5In1HO93TtUQpdNdRUOPrQ7J2Xr3BNvSdO6ADfeiBDF6ap
        bVf3RTjUsz1ATPzWrrhnAX5J3I4d
X-Google-Smtp-Source: ABdhPJyYFmssCU32/GBiykg1dcLN2/6jwQ9h5b6xQfOSvjH5diH7cq9mNIupawxGi1YWQZ8h6WQo/g==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr4440636wrw.404.1593187439226;
        Fri, 26 Jun 2020 09:03:59 -0700 (PDT)
Received: from [10.230.189.192] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 207sm20205463wme.13.2020.06.26.09.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:03:58 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: arm: bcm: Add a select to the RPI Firmware
 binding
To:     Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
References: <20200626115433.125735-1-maxime@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <db449a41-8256-e1b3-abb6-d8835901edc8@gmail.com>
Date:   Fri, 26 Jun 2020 09:03:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626115433.125735-1-maxime@cerno.tech>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 6/26/2020 4:54 AM, Maxime Ripard wrote:
> The RaspberryPi firmware binding uses two compatible, include simple-bus.
> The select statement generated by default will thus select any node that
> has simple-bus, not all of them being the raspberrypi firmware node.
> 
> This results in warnings being wrongfully reported. Let's add a custom
> select statement to fix that.
> 
> Fixes: 5bc0b9be8544 ("dt-bindings: arm: bcm: Convert BCM2835 firmware binding to YAML")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks Maxime!
-- 
Florian
