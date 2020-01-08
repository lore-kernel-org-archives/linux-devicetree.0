Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C10C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94D0320656
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578516850;
	bh=wVQswFzXm6Ng1B6uM1bzZ0iONQvojTynXWyNFtTMLoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QU6sX71eOLeornnSiyVAXtSFGS7wSr3w/zK3mWS1PEVu57fds2iE2TQPgOgpzLn/8
	 ZjjOo7frsgULgluD/LIJjeToeiHVZNc+0ihxo9gxBQodb2P0uW3zdV3ghT0gjB3ggC
	 f4sWu8IoVow1ywkwfGX5T3d0h/OLu/n93Ivxrjeo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbgAHUyJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:54:09 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36828 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbgAHUyF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:54:05 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so3952082oic.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fdVvruvENSVDnyxa3WruHxJs8BWU7Yt+OMrPNBUFY8A=;
        b=j3mNnaWm+Usiy6uzbHyZzuNpOoLHSf25wi74xqg0SjDRmnsZMdRc3VfaEz+yWxJCKv
         CubAMvZpfH/bUi84Qfjj9Rgi0TfA9HIcGKeMY5hpyyU16alLasQmjzwEGqCy7cJgULiP
         2tVLK90N/AYgvFG0wk9yTyIW83fCrFZrFNaE472+g6eFTtmvGu9n7LXuhTf1DALh4ypV
         AZ3b8H7KqVEFw5YJmKBJbSspLs3IJ6HaN9VtmNgSycdgJJH5mmwAt4Qv3povSJC2YXDz
         WOJmBglgupQ5+/NZl/k7VVykMJJCPH+onpgq1MoJCaNcsP4GBqGjd+2/ricfV4LYwTA1
         /ToQ==
X-Gm-Message-State: APjAAAV92FNC2/+lRZSwFv7hmNGgn5dv/9TLiWg/aR2vlyoG3CD0TbBy
        gQFueGxzmZ18emLn4FZvOLz4CB4=
X-Google-Smtp-Source: APXvYqyZrgf8Kyw+bfq+IjO+HqkjYlV+PmYKYG+EHFLMiWfICv1cId0Jasl9zZafKi/Scgh5A6xXXA==
X-Received: by 2002:aca:1801:: with SMTP id h1mr468857oih.16.1578516844008;
        Wed, 08 Jan 2020 12:54:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm1523029otk.2.2020.01.08.12.54.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:54:02 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:54:01 -0600
Date:   Wed, 8 Jan 2020 14:54:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linus.walleij@linaro.org, Khouloud Touil <ktouil@baylibre.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: nvmem: new optional property wp-gpios
Message-ID: <20200108205401.GA15674@bogus>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-2-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107092922.18408-2-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue,  7 Jan 2020 10:29:18 +0100, Khouloud Touil wrote:
> Several memories have a write-protect pin, that when pulled high, it
> blocks the write operation.
> 
> On some boards, this pin is connected to a GPIO and pulled high by
> default, which forces the user to manually change its state before
> writing.
> 
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
> 
> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the write-protect pin is
> connected.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
