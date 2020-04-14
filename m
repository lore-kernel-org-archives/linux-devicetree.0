Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C124C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:21:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09A482054F
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586888488;
	bh=EfAoYjSYXvU5ftHPdryjD1bv+TPoEvdvTGKXGC1pavY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pekkyXOE9kIaYsQY/4j4lhgqEUubXSMtt1k9wnluCDmklO8KEGGZyBEoMcNBAEQiq
	 pA8Immmm8ldN8mDlQ01ph3B1gvDPA5Jt9ZYkSsPricpvkVVkqG4zdeeh1RlIYxgoIA
	 4hXlb3v3Z+2CIQAvX0BRCHTqXA0kC9qVapJbzZwM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503793AbgDNSVR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:21:17 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45982 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503786AbgDNSVL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:21:11 -0400
Received: by mail-oi1-f193.google.com with SMTP id k133so10558660oih.12
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C3XC4lka+6lPx/IJaKXJqbBCR05aTe7VCHCfbQMTeSo=;
        b=eYX7pd42+j4d+bdsfdWYV1gD1boZIrSEheAoX3w2EeT3KqcsHhOgowkBw/iEA+7EUt
         dHuhOmOZ84xOcCf70nebxjoobUJ1qpsthTcbFUkxSZsFda7gunZfRy40zIo6xY6dmVfS
         sfGCfNFjhYT+jNEyP1/vohfouoJujXZax09uRRnkn6Ko/WGNrhJy62q274tk6gzUngDF
         sKJ4cDL0Cw3LtTEmLbphEX4+AemCoYnbftSAA6s6jbYDf1ToCjEvcdr8igrXdlwJQK2P
         dVTErKtMMS2zjUSUfZW1xBf8GyLuSzj+6gLuT3yltgJJZI3BQle1h45au063p245JpLj
         0XGg==
X-Gm-Message-State: AGi0PuamOiCb0l9A36YLOUdPj7/5j2FZKxwWz0XtbL+jgG9IP4spZO5e
        3aVHoYYjYAJfl9sIL2tLJw==
X-Google-Smtp-Source: APiQypKGoXdQXTffNoeAEhi8FQ34A34jOLZSNxBrDyNAdbcppMHyC9UJ3RJJV/wqdeM2qxDOej2A6w==
X-Received: by 2002:aca:682:: with SMTP id 124mr16665721oig.69.1586888468143;
        Tue, 14 Apr 2020 11:21:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v21sm5655243oic.4.2020.04.14.11.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:21:07 -0700 (PDT)
Received: (nullmailer pid 934 invoked by uid 1000);
        Tue, 14 Apr 2020 18:21:06 -0000
Date:   Tue, 14 Apr 2020 13:21:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
Message-ID: <20200414182106.GA867@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-3-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:35 +0200, Sam Ravnborg wrote:
> Rob wrote:
> 
>     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
>     case found in dts files. We should fix that to dsi(@.*)?.
> 
> See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
> 
> Fix it.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/dsi-controller.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
