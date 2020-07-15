Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D40BC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 22:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28A092067D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 22:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594851059;
	bh=93EiFIk/NdwdF/mi7fmL6xvs1z7iai9XGWJoodXPosk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tzCBY9syC56ULjj4eROrge3Z8xeacbv9gF/pMt1hcWyyMtm1nqmGDurXx0gKDyLfG
	 dSaypGespjHcLHuamCYytVsEH4vhXCZNM/0KwoF00Vo/6Apab/cQz9g1Lez4j+cV6h
	 gIfen8BaDpbw1Gu6blDPmkOBlIkHLm1fslgxP9q4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGOWK6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 18:10:58 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:33088 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgGOWK6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 18:10:58 -0400
Received: by mail-io1-f43.google.com with SMTP id d18so3970759ion.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 15:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bs4UvWlAUqqCoLxMvImO4Yyx0pE7t+ca9ZPzNIql2gA=;
        b=ceWYSEkTLpWDjRG/wDnDEMS47kfsROToHNmyaG6PlvtsP0xTdjDOq/1hx5GMaDpKay
         0YcqTt+rqKNft+xYm4pm+cQD6dt6ViTXwDDSsvPhErMN9tjGk+9LdZIru9DBaCOCOQ16
         mJ4sWllplUWlJYAwGYxLcHursTzQlsxooKPSo19ehWAHxTkXeCbTh1WeoUXHOos85SHz
         qFJkr6eIcAUUAOYjayASOomnDSxq1pU/Z1hTVctbfebIx9X4xIGiZal924miTDEKlbrD
         O1dp9c3atW2EMryc9HuXE4+u5cYFGS1hRElgA99OQr2+d8Ny2Te/uQmMSBvm43p32bD7
         2YBA==
X-Gm-Message-State: AOAM5303NNiwN+yXnmJPn9sq6BCnP+3i4mEjX+qnJ5P57jxTxcrnDV9j
        noT4OBayVtbjCBIUWvKmk9brqXdefEtF
X-Google-Smtp-Source: ABdhPJzywfwMkAxR2QgSwYC2Kedi45mHiQTzllbo4ZvapAVObxEPmKtxc/SMvZB/mHBePWd7cSiCqw==
X-Received: by 2002:a5d:8f0b:: with SMTP id f11mr1449175iof.200.1594851057295;
        Wed, 15 Jul 2020 15:10:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f76sm1744517ilg.62.2020.07.15.15.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 15:10:56 -0700 (PDT)
Received: (nullmailer pid 905964 invoked by uid 1000);
        Wed, 15 Jul 2020 22:10:55 -0000
Date:   Wed, 15 Jul 2020 16:10:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH][resend] ASoC: dt-bindings: ak4642: switch to yaml base
 Documentation
Message-ID: <20200715221055.GA905934@bogus>
References: <87lfjwxlna.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfjwxlna.wl-kuninori.morimoto.gx@renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 07 Jul 2020 08:35:38 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> 
>  - 2weeks passed, but nothing happen
> 
>  .../devicetree/bindings/sound/ak4642.txt      | 37 ------------
>  .../devicetree/bindings/sound/ak4642.yaml     | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4642.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak4642.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
