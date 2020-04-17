Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20558C352BE
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 10:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F004021D91
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 10:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlchuBUd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgDQKMf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 06:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725830AbgDQKMe (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Apr 2020 06:12:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C202C061A0C
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 03:12:34 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x4so2361130wmj.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YnzOyKxiPqTU4HRGOnE/2vSvqos+ev8HgXqi6MMPUKA=;
        b=MlchuBUdauSRQyVE8Hbv9cCHUBQnKekE7cJzDwYcy4tfuZ7V+FMXj487UTXnEaG4Wd
         UHYa9lDHkMYV1mIR6FDjbBX8wA2mZYxcUJM6jv8AbqtG96GWX2ARJenZlnxJKZmodbPd
         T6RzR/dRTIc6jgCqNr/zKACA8xy7IVa3p+IruV02ORfvu3JbAvSYQaS8BoiHjRKjVu0O
         JM+s3vuyiSEaT8LxUzfnLvNAc4BMJw1vrfdzfMosDz1f8ORavXpagIN1p8MxQW3vRrzP
         xRHYHQGRfagXNnGlbN9e8Gk5VbVpRdh+YTrg52fvzk3HfMHrEgNVPyMH3WzaPGbvdosP
         9L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YnzOyKxiPqTU4HRGOnE/2vSvqos+ev8HgXqi6MMPUKA=;
        b=qKKJy6zsE4D0cmU2zMn63VT62DpWgrPDbnrAimmhFK7adiXGkiB2vWStgQTODEsxeI
         Vp9/yXUPzBtbT9voBAeUr9xaWl4NBJw2PEptBJgVE0+R4uMeOyytyMJH1jYXygJYgPCe
         cEUPGOOVn2+yij2HNTEdW8fXh5zseCFhyjZWwKbGtMhQDKGazuQoCw8C0aV4TguYYuh+
         bcMVqShdiPCs1Nl59MVeSyE1CkhA2lRdF8dwzumrF4ZWnnLE7drlQ5NBwsoZpCVp1THL
         AsEnTPxg9wwcqIY7o4p+qdU5Cb3UHLii5aR4Bh1rgFqepCC9uvToGbMp9MQyxTEOsAfo
         EngA==
X-Gm-Message-State: AGi0PuYKS6d1OUd4KOT27+VotnUy8PKHBCAZ7hiw+TDVrEUnLSzwEvl3
        ZdPnLBm26DSZ5xi8ZGks6pi/8w==
X-Google-Smtp-Source: APiQypJmV0Jf3iT0zgAm2M3NypsATxn0J7ih2FYSnTAkimi9GQNwmKxabVorLTmViOtz5IsBr1LPBw==
X-Received: by 2002:a1c:3105:: with SMTP id x5mr2735875wmx.51.1587118352876;
        Fri, 17 Apr 2020 03:12:32 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id s9sm20080119wrg.27.2020.04.17.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 03:12:32 -0700 (PDT)
Date:   Fri, 17 Apr 2020 11:13:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200417101333.GA3737@dell>
References: <20200306085513.76024-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306085513.76024-1-ikjn@chromium.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 06 Mar 2020, Ikjoon Jang wrote:

> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
>  2 files changed, 129 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
