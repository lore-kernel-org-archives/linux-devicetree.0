Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6979BC433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4098920720
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 08:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="xOLCSSS3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbgGOIKY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 04:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729603AbgGOIKY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 04:10:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA521C08C5C1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 01:10:23 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h22so1538318lji.9
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MRPUaYzwY/L8q/ZUeR+9TLj1/Bt/WM7Eyy7SnZCdHSY=;
        b=xOLCSSS3sJvH9X2ijoUcIIvV87T2N9IJJmb+7QU8KQZmjJdx/HblCgpl9fszq0Q0pA
         qepTjM6ErIMGVncC9TCJeecSsJEjpPgbJ1wAWhhiSCOsRnIECjiCxcZnxcP/1Q91T9zj
         h5v0DjD0WFj0hp0SvKSbwcJDsyWSYjDtb0dMGNk/0bauptA9w43COu+TLJ3MPUTaBbbU
         3iCticDDE8YGyDQbTPFN83383a9sRUU6g6VaUJhVgei13OSQV2i1AE4pY6Yc2tjo1E8u
         LlQJIzhRo7XqZ+413qcunAsIz2DboPm7pF3w6wwuHIqcREOa5sIz2JniyPtcXTleAitC
         1Prg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MRPUaYzwY/L8q/ZUeR+9TLj1/Bt/WM7Eyy7SnZCdHSY=;
        b=s3SnTrMvU4CZMJKV4gULkGs6PAxdsAZC9aY7yvnCwE1oX+S6XES8rWsq3c9ZA0ZCXR
         SBEAqgZPPjPlnTnsNcYypUYyZu9oykQ5p6Y45y8EHBtFSxCxocMtw1X40WbN5Yr3/6i+
         WxItA+Zj9uvOhnyaXlDW4+Xh6PSEOpo4VBkJ8iwmaxCw+hgntLkC84rmPcCkLcniUFK7
         ungGiiZ7Sy5faZd0uTRtr94f2n62LANCzbWoJPoXvFR4hluVh2P+WpWaeCcNlVrAvIjf
         0rqV2L2NXr1nBorfUFruXwbDEGUkgzE47XHUEIrrmyVtQFV2dScKVkjehCzXp952poSO
         c9OQ==
X-Gm-Message-State: AOAM530Cx+fCJdOuAbXUdXOEgPJ+or0BUu9j9GyO8mxAQCNMPI7VYjWu
        hcB+y0SVfsP5CHzaVMTKH68ioA==
X-Google-Smtp-Source: ABdhPJwlIOP4brTSkTJ3D4A7TcHEWCFeK8/MZuYI6cRapVOsSbwQLOr4JuZAkIS9/h55GBSi6zVabg==
X-Received: by 2002:a2e:a17c:: with SMTP id u28mr4141264ljl.140.1594800622250;
        Wed, 15 Jul 2020 01:10:22 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42dd:3c8c:7d45:c199:bbef:e36? ([2a00:1fa0:42dd:3c8c:7d45:c199:bbef:e36])
        by smtp.gmail.com with ESMTPSA id e29sm332987lfc.51.2020.07.15.01.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 01:10:21 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] dt-bindings: media: i2c: Document
 'remote-endpoint'
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, dave.stevenson@raspberrypi.com,
        dongchun.zhu@mediatek.com, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, Rob Herring <robh@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20200714142856.58365-1-jacopo+renesas@jmondi.org>
 <20200714142856.58365-3-jacopo+renesas@jmondi.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d00e9b32-5a20-77b2-e99f-ac8822041bbc@cogentembedded.com>
Date:   Wed, 15 Jul 2020 11:10:15 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714142856.58365-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 14.07.2020 17:28, Jacopo Mondi wrote:

> Document the 'remote-endpoint' property and add it to the list of required
> endpoint properties in imx219 and ov8856 dt-schema binding files.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   Documentation/devicetree/bindings/media/i2c/imx219.yaml | 5 +++++
>   Documentation/devicetree/bindings/media/i2c/ov8856.yaml | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> index dfc4d29a4f04..0251e15fe0a7 100644
> --- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
> @@ -71,8 +71,13 @@ properties:
>               description:
>                 Allowed data bus frequencies.
>   
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port

    s/to/of/?

> +
>           required:
>             - link-frequencies
> +          - remote-endpoint
>   
>   required:
>     - compatible
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> index 1956b2a32bf4..c1f363bb5aee 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
> @@ -84,9 +84,14 @@ properties:
>                 Allowed data bus frequencies. 360000000, 180000000 Hz or both
>                 are supported by the driver.
>   
> +          remote-endpoint:
> +            description: |-
> +              phandle to the video receiver input port

    s/to/of/?

[...]

MBR, Sergei
