Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99D5C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 17:25:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDF6F2074D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598289941;
	bh=SL5rdbfGzaO62SJFTZFp0gHPKmcrVnfA7nD2yRKCFvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ScUfYsuvAdx8G/zO26bO4wfkYk7TdWthHFe3yt77xcjp53SsEngiOji20f2Ecl2KI
	 h2G6bOabiDFJtsoGIAHXji13C0Oa5QuKRjTtCbZusEaCRL403OMC9t+4xMKCLeCKD8
	 aKbRNCWbY/7iI1JniafYeFrohVdiNla3o18+KN3M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgHXRZj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 13:25:39 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37748 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgHXRZg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 13:25:36 -0400
Received: by mail-io1-f68.google.com with SMTP id b16so9525195ioj.4
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 10:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gaqc4X/qnA9KMqMqQ+N6oiNBtdvQ2DqPg5KJfR7DzDc=;
        b=V3oFL0Vd1ReRJPg7kDPGL+TbeRdaKBrQxnmBnnfFC/kEXFNJIt7BzM/JEppfgV1m29
         ue0gB2tY/LFLBL/tUzw9GxXr2J1TU+Yg5aIjJbHPhY8YV2R6a/yEg4bRR+ZFsKFgDmSe
         Kw2BZUWw5KZs+J3D1K7/IP5KI6gOKBkfgZdoGvpGk8lXjwwkZBrMx4QcsfsevD4vJqeK
         Ka8r9UoKYhThzkpxhyKu3JsFKymG6SD3J03cEhtNe/p/O6rJuUcTw+QudC5dKaIuH1dn
         L0uIGzBFD6/RW1pGDAdlrZHpX2Ak/w3P4F6tqdiQIgmnV39Mn6l1HdxOHQFAgtqA/r2A
         1ZJg==
X-Gm-Message-State: AOAM533Ao5mN6QkAISPA3XfPh+/o1dYaK21kNJmxjdwPLtl2P2evweGu
        PKSaYrStHWpyAgTNVEq7lg==
X-Google-Smtp-Source: ABdhPJxKE+vkfQKb2OUtjfAlwBWYpgRA8sqo+1D3INz1VaQdhd0fgEmdb42+lRmimyoFGsCBwJ8EwA==
X-Received: by 2002:a05:6602:1583:: with SMTP id e3mr3348821iow.173.1598289935478;
        Mon, 24 Aug 2020 10:25:35 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id v28sm7691743ili.27.2020.08.24.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 10:25:34 -0700 (PDT)
Received: (nullmailer pid 2929363 invoked by uid 1000);
        Mon, 24 Aug 2020 17:25:33 -0000
Date:   Mon, 24 Aug 2020 11:25:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253
 bindings
Message-ID: <20200824172533.GA2928997@bogus>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-2-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 19 Aug 2020 22:51:49 +0200, Linus Walleij wrote:
> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the pointless cargo-culted "default-on" property that
>   we were not using
> - Correct the brightness in the example to something legal (13)
> ChangeLog v1->v2:
> - Create common.yaml for backlight as suggested by Sam and
>   use that.
> - Rename the GPIO line "enable-gpios"
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
