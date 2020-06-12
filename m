Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98F8C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 15:54:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4B27207F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 15:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR4RZNsN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgFLPyt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 11:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLPyt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 11:54:49 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB232C03E96F;
        Fri, 12 Jun 2020 08:54:48 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x22so5755182lfd.4;
        Fri, 12 Jun 2020 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zJ5CA7syvux73x6gK6q3wUVaHevP94sNCIRQBIxtmdc=;
        b=TR4RZNsNHJ6U9cXt8aSA4ISFZgZcSV7jJLhfubCqtF11RkMPBnq1irQy6EOvOH6DQ5
         VdNQBiSn2/mINPrlViQjIpaDX/6mRnxa30gZE7F0XDqzLkEBpCHE3B3EWO74PlIj+8Dw
         X05z5VAf/N++f7YUSS/A6ajmmO7jTtyz3btHjM6vNOMh7k8Hqx55nAyKmRB+WQSX7a/S
         HYdGbd6SzA1IM3C/DRcrjXGPpI1nN3w73T+JrdNpMfAptt1b5tPdalWtu24P75K7Hzt1
         0IfaMtaXM4APYgHJyh0oQD/ExI5kRCfInUGpFHs0dIQhvizNwMMRExvqnu5ZWcHFPdZL
         qrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zJ5CA7syvux73x6gK6q3wUVaHevP94sNCIRQBIxtmdc=;
        b=SXvwevPFLWH3v4cyizqG7wmdB8A3LTn203O3Yl8HBSja3KZUmpAh0+h/JL8Y0fV7ex
         qxe59tSaXGZO56Dvm/LscWnBMzflAyDb4RmfZ2s67LygsXF/lrOGFCjNLLNHo2gqo6O6
         1Sw/Gafhss7zv4ezC6axCUcZ1mL8lOcr76cGvyzge3vEG1vbqGq5RxDUHf91IYt6WJ3+
         IwWQ7Rr9LIY+rdAIQOzMHr5zkyO1ZFW36215fv/CC2t20k+4HtpIbuwgy4Tt8+jIMqe2
         r+rHNF1LMKd7f7siVJQGp/crNzaXl71BFiSSWdQ8RJXWo8dS12nLyYiwiv22QLDEtmLP
         ZHNg==
X-Gm-Message-State: AOAM531B2v5k6gXz0KM39QO3m6l+a9tatFmrKBE8SU26EWSrlv1uHKie
        K8lKMlWgH3k4wpmEyLKYk/9UGL2k
X-Google-Smtp-Source: ABdhPJyKUFDVyC0Ige/FuAieZAveMyD902CTyq5dyK1Cdi5ZMGqFdjYtdCySH51GEjAkhc3M3cRCjQ==
X-Received: by 2002:a19:2358:: with SMTP id j85mr7336103lfj.182.1591977286617;
        Fri, 12 Jun 2020 08:54:46 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id l22sm1758694lji.120.2020.06.12.08.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 08:54:46 -0700 (PDT)
Subject: Re: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-8-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b20cede8-a9ee-c70d-913d-d0a05d7826b0@gmail.com>
Date:   Fri, 12 Jun 2020 18:54:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200612141903.2391044-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

12.06.2020 17:18, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra host1x controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
...
> +  memory-controllers:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names

This memory-controllers property didn't exist before the conversion. So
this is not a pure conversion, which makes it a bit difficult to review
the changes. Could you please factor out the addition of new properties
into a separate patch?
