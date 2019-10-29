Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A7CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 19:37:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A904820862
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572377835;
	bh=6/7T+R7DuYO6nbb3RGbwJ6/EKz6CdtfRo9Bzd5KVQvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HOom7UHwW2cx5YCDxNmD3yuU4ZE2Qbm3yQoub2sEUI2YtRSqg8WOZk/7tnsUkGmWS
	 CkwrB0hqg/my5RNC11IvexpLDEKbo2GAjupjHh3paJejSYbbk0PYRZ60EffYhnzNqt
	 1F7xBnVYpHeRi62u7dOhl4FiFNtZdV8QVGR/Vdec=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730817AbfJ2ThP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 15:37:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45434 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfJ2ThP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 15:37:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id 41so10805025oti.12;
        Tue, 29 Oct 2019 12:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JKwdF0XUZpiXTAflIrtHaGtCwxCnO26IPczKRhKbFkY=;
        b=gMRgNg/OAUdgKNAIz1vcWWogBEsKVbmN1AsSdZD/sSzMvAf2DTaNvDffuUph7tZ8Ra
         dlLFhQJEXwjOjGX9QZQtGtsRDH/Ra7c67ssJ2ALKVI88ZAwoLgewH5MmBhP9KaXkqRlL
         ocbNMvOTsM6csf6EgsF5DpHtiQj0xYuxMYfhnN566lkgL7Qj2qiWbxBDzb50V8btKb+Z
         uDtrEGZdaepMj5ble7j+uqGhwgLHTB6Yvqd0qgEQo78Z5brSWUU/QzFQ0BEBN00TDOh9
         1RgcuTYFNSAO64dtWFJ/dKAVp7R2NqrVJg4T9JzufJ04c5pMMmaQGjbr3UobmYLNRQEG
         YZVQ==
X-Gm-Message-State: APjAAAWAtCgvNQQd3STZEyfRe+K4MPd+2peDiBH9+i/fbbLWedByr6mS
        Y/rnuog/fIMTdUpQMUmYM1bp4dE=
X-Google-Smtp-Source: APXvYqw2WApP58XDy54/mEOFfzSBSp6IjXH8bD2FMIAeWNuewPZGLF+4mD7in+MMZhw6PaX7gRQR3Q==
X-Received: by 2002:a9d:6a0e:: with SMTP id g14mr10203172otn.351.1572377834042;
        Tue, 29 Oct 2019 12:37:14 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d27sm2504792ote.11.2019.10.29.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 12:37:13 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:37:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] media: dt-bindings: rcar_vin: Document RZ/G1 per-board
 settings
Message-ID: <20191029193712.GA14204@bogus>
References: <20191024131423.16799-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024131423.16799-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 24 Oct 2019 15:14:23 +0200, Geert Uytterhoeven wrote:
> The R-Car Gen2 per-board settings apply to RZ/G1, too.
> 
> Fixes: 1d14a5eaa156b0b3 ("media: dt-bindings: media: rcar_vin: add device tree support for r8a774[35]")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/media/renesas,vin.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
