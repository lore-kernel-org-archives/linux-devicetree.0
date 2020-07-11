Return-Path: <SRS0=t1WB=AW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E956C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 20:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4C49206A5
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 20:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6inr8SP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgGKULH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jul 2020 16:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgGKULG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Jul 2020 16:11:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C57FC08C5DD;
        Sat, 11 Jul 2020 13:11:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md7so4083415pjb.1;
        Sat, 11 Jul 2020 13:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R54NMpWdv9dSjB2DaDOQL2xpc80gR357MzGdBek8Exw=;
        b=p6inr8SPsJpczAQ0HdkHAn4Lfh5lud0f4PxJVI3EwG9hXoH/in2Jmrf+DHiYoD5+VM
         XevvcV79JrGf71JfgBbZ6y9ZQo8gnWh2nQKcALGLgkO2/TOm+5AiZeRUjmiGl3BhF0Xp
         BT5oCYnLfGqW8FDGMm2Zjldzyx+nghKJcEjnNBrMS+8AM35icaIvPe2bgN9qVfHS6pcz
         euQByEGoE5swJhEO1nq7Sh0FIeI+zjl6z6fAWoKJgH3IGRKnxmP7eASH6xGszmH3wGjP
         MTF52o9r8Ryw37jKGj8CxnBAEhOvT1MqQ+K+EY8Chig7ulePU72FSamQKsOHv9EUf8Qf
         DkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R54NMpWdv9dSjB2DaDOQL2xpc80gR357MzGdBek8Exw=;
        b=QbDBoQIpaeV3fdJ5P4/V8mx51WmCWdAbbgcSSkdqpSLMsksVp33apkO9fPm/4WWpDH
         sBjNc0Qa/SKNwbcEf+RfNfJ3PpfdNIsC9V3Gl3RTV53Q8x5IcYYMMjWP/BurrEbF8YZ7
         yNcdF6oWpXUTERmrMOcRX/pamgzcxmUwv34qIgHaiyvDeZXJxNUWyqzhzL4g6B5ic5Gm
         j1Rxj7L4mTx5je8UQ1OQ77K6JqygLD/pidxz6HDObbbMaApRcmf+e/bsgYl/PrLqEGEr
         /nrDmLru4f7aDcYe5W/F3xE6mdLnd+HxFW97xB6c8HS2lTaw9hDO6OquSFP7mSl6UIrL
         zAyg==
X-Gm-Message-State: AOAM530g1wPoXfrSEqmMgtHp7d0FY60nhv7tulBF16+GpK2I2h9B24bB
        Ndjiu9v5l80Miw4l3jqBEMQ=
X-Google-Smtp-Source: ABdhPJxwUMgv2GnqhPBfU+LPwoUzJEe/wLxYclTgb57cPiN2nqZxM+DLt4dDuRkqygcekBSCACW42g==
X-Received: by 2002:a17:902:d685:: with SMTP id v5mr55324014ply.117.1594498265786;
        Sat, 11 Jul 2020 13:11:05 -0700 (PDT)
Received: from ?IPv6:2001:470:67:5b9:108c:a2dd:75d1:a903? ([2001:470:67:5b9:108c:a2dd:75d1:a903])
        by smtp.gmail.com with ESMTPSA id n2sm9216480pgv.37.2020.07.11.13.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2020 13:11:04 -0700 (PDT)
Subject: Re: [PATCH v1 7/8] dt-bindings: Add vendor prefix for Hirschmann
To:     Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>,
        ilias.apalodimas@linaro.org, Vladimir Oltean <olteanv@gmail.com>
References: <20200710113611.3398-1-kurt@linutronix.de>
 <20200710113611.3398-8-kurt@linutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0b8ce9cb-dcba-0891-0419-85a2b87625e9@gmail.com>
Date:   Sat, 11 Jul 2020 13:11:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710113611.3398-8-kurt@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 7/10/2020 4:36 AM, Kurt Kanzenbach wrote:
> Hirschmann is building devices for automation and networking. Add them to the
> vendor prefixes.
> 
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
