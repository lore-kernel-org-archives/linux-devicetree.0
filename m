Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32146C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2D47207DE
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597868689;
	bh=WTij0q66Ur+Llwj4FUlp7RTVuhb9zM6KFvLkF1MQswA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fIMunJaFU9YTdctSshZIIaLo88ALG942fN4xhSmozojXmYA7IrweNCG6/mhZSjxdr
	 ErH2ja48OU+h6s4fN62otqmJ3ss6Y98EhWn8znPyUcjaaUzwKpCdIoq/kNVeGFNpce
	 kdPpBAL0vdnFCDlFaxeHU+FSkYD2wF0FnCWkXSYA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgHSUYs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 16:24:48 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43686 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHSUYr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Aug 2020 16:24:47 -0400
Received: by mail-il1-f194.google.com with SMTP id e11so13872584ils.10
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2020 13:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q7LV7O9rMf/1mPBSUrV8F2mcCL0Som/bPqj44sH9QfQ=;
        b=dfAzT996eToxsTky61e0ExMji8Dvod6AFKhesbojYENabUU96TLigUySCXBlvdesNH
         d3mb6mc1Ip2o+SXWcJye/VHQQPFKYc+ayp0blP4P/1Aplm7IwUmaHkpzAt22C2TlErwd
         qBh+FOtVtWrY1jmac1mxvw8Y5Pxzi/JwWuh+q1pQFZFBf6c0P78wR2v5SzsJKeyjf/km
         OB47Y0r4i2jYORfqOdqoWGeS/G56cLJ0pAhOoHTLgWZobpuw1J7sIww64OdloyJpEefJ
         27iqfFt9YyFJF2cOAc2anIdqCHniug01lE6MlZYP64MRg5Kfc5gxMTsuNEJXxE9B7VWl
         6Zfw==
X-Gm-Message-State: AOAM533e46vE5WYMr5gcyGtpzZ9cK6fphpwxcfm4HX2YWbfLPaiL83WA
        EyLs/XWcni+saYhlTrEKtg==
X-Google-Smtp-Source: ABdhPJyGTK7EFw0nCp/gbr8jhh4p7OFfQ6nWoZtXsfPCZH0ZU09zKOsMzEyy1+08g5j4MneLAf5tVQ==
X-Received: by 2002:a05:6e02:ca3:: with SMTP id 3mr23479220ilg.8.1597868686290;
        Wed, 19 Aug 2020 13:24:46 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c14sm14275390ild.41.2020.08.19.13.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 13:24:45 -0700 (PDT)
Received: (nullmailer pid 1867950 invoked by uid 1000);
        Wed, 19 Aug 2020 20:24:44 -0000
Date:   Wed, 19 Aug 2020 14:24:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 resend 2] scripts/dtc: dtx_diff - make help text
 formatting consistent
Message-ID: <20200819202444.GA1867461@bogus>
References: <20200819124709.20401-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819124709.20401-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 02:47:09PM +0200, Geert Uytterhoeven wrote:
> None of the help texts use capitalization, except the one for the -T
> option.  Drop the capitalization for consistency.
> Split the single long line that doesn't fit in 80 characters.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Frank Rowand <frowand.list@gmail.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  scripts/dtc/dtx_diff | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Rob
