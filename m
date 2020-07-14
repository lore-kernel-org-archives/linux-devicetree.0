Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550CEC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 02:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 236BB21973
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 02:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594692795;
	bh=xzUoTjMo0GTqRA+vKJKEhe+S9V1T1/dvhx43NpM0TDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=s1fHbAfnv771Rf8jXJPgcAzxVeTsYyxfL69WxeHXw0nD/L8ONpLucPM2xLAr2/j1T
	 dbMiJvZ+01SVodEEiZUxJLz+w6qd89ePL2/PunHTK3wRBdHgVZM/PFa9hMS6gc/0TD
	 5qQ3jgOeA9iGYQnJkKc4XO9+F3BVrCz14Z5OaYHw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgGNCNO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 22:13:14 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:43485 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNCNO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 22:13:14 -0400
Received: by mail-il1-f196.google.com with SMTP id i18so12977311ilk.10;
        Mon, 13 Jul 2020 19:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QwWjIKF1L76H5kkXoUZjoa6+TFOgCLTU68wLFPyskz4=;
        b=Z0EbSGnIM6VRamK3mCOfVG7w+2+VBZSa5RNvwvoExbpXcp5j9COGfHg1hha/0HRZW/
         uPW3GR4jiJjwKMrEVtSMQ4lU8pfToxl6NTo5N317Set/IPOdYCO5+3gEQd3U9WBMHGUG
         rrgSrfpgQi82OPvGUVPLR0WbTVWMTNR5AnFHDIAAc72Gr6itVOzTXLMqJvNWWuB6f1PU
         rV/Ad43KjVfCV2Jhdfx4FRdWh0OvTQE51lUrBXzcuhZAuXpojMMKpV9OZ9JnLl0BDPCN
         xjsFexMnbVhJO2Ijw3CzHucugiSGIyEXcretWs1eBhvf5odHysWWniklm4Ij4gmBqFAz
         twUQ==
X-Gm-Message-State: AOAM533omCgrXHvwDunKuGzFZDv/ZaZooaDJNqNQ2N3i0QRvCqqT8ebe
        PVfd4zAeYWA9chLCduw0yQ==
X-Google-Smtp-Source: ABdhPJwKu7pm3X0R/V18M6sq/YjFEeyjARravhLwKlNbQ09MPaZNJ4I6QCCxe1wEFNK6i2FBSH8tbw==
X-Received: by 2002:a92:1b8c:: with SMTP id f12mr2640748ill.93.1594692793213;
        Mon, 13 Jul 2020 19:13:13 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t21sm8563544ioc.0.2020.07.13.19.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:13:12 -0700 (PDT)
Received: (nullmailer pid 1138008 invoked by uid 1000);
        Tue, 14 Jul 2020 02:13:11 -0000
Date:   Mon, 13 Jul 2020 20:13:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Stanley Chang =?utf-8?B?W+aYjOiCsuW+t10=?= 
        <stanley_chang@realtek.com>, linux-realtek-soc@lists.infradead.org,
        James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
        devicetree@vger.kernel.org, Edgar Lee <cylee12@realtek.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/29] dt-bindings: soc: Add Realtek RTD1195 chip info
 binding
Message-ID: <20200714021311.GA1137961@bogus>
References: <20200623025106.31273-1-afaerber@suse.de>
 <20200623025106.31273-2-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200623025106.31273-2-afaerber@suse.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 23 Jun 2020 04:50:38 +0200, Andreas Färber wrote:
> Define a binding for RTD1195 and later DHC SoCs' chip info registers.
> Add the new directory to MAINTAINERS.
> 
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  Note: The binding gets extended compatibly twice with additional properties.
>  Could be squashed later if approved.
> 
>  v1 -> v2:
>  * Dropped quotes for compatible (Rob)
>  * Added additionalProperties: false (Rob)
> 
>  .../soc/realtek/realtek,rtd1195-chip.yaml     | 34 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/realtek/realtek,rtd1195-chip.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
