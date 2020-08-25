Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD371C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 21:57:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 960902071E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 21:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598392642;
	bh=P7xS/dWDsLf3+VAzqHKaXlw3GIrY/Iu7XnIOreUmcDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=xG/+zdqzuDRQSzSNjI53JtjVNEZiD09KTm+skfPcDpjLxxE/cSTgcZ9KxPIHm6Wi8
	 kKS+8dJAnvu0fwTeZlo2YTJZMIA/Vz3tkiSlglvd6LETD707kn5NCHPTKkfmxqukeK
	 3ByrTkR93S17xhtuU77u5287cKK1eNnGWsS+Zyz4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHYV5V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 17:57:21 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40322 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHYV5V (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 17:57:21 -0400
Received: by mail-il1-f193.google.com with SMTP id p18so74906ilm.7
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 14:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GjO9kVR66d1g6PuKVDC5MRmQctTcbYaJo56NTkeAqjM=;
        b=NCPtRKUURpujpN4XG8vAVGRKie2KRxwGg5x2w+GHeJ1iEFemeqVEaIEV5DzA4YH6BP
         o8IyWaph5Wk9wpL43yhxVX3km5/NK8UwNYp6tH3NiABGFo3U5Y+jaaqUcXRqxNabTC1V
         M23u2I+ZIf4J1xF0Z7Lo9sDqoxIiWIH7Lu9O57ZXSOdIMnpeXaenqQpHMDDxiDIhqu8o
         a3CRD98L+GHU6NKlmtjECdsn+0gxr2S3IbE001Jyd7iP2giFpvh/o4LB8ggfwULWJ5eY
         Yx7i0ZBnzuBTs/KKvwnwbixE5PHMOZSU3xsTe4Gcu9avNVDKgX7NxNZFd9V2JG0fWdJs
         0ZSg==
X-Gm-Message-State: AOAM531K6nM0YnS44S6EX1mq/40iYHr/dW+QBhZwx/P5mR3pTx141U2m
        VFBPI19kUuAmMiPhBNpQrQ==
X-Google-Smtp-Source: ABdhPJy82N7dzwGaEQHw3zZQSbxNrrPETtjhHR6HpfXF4h+fMyTLd9vaf2b94cWGuWBfG8iq+fOJHQ==
X-Received: by 2002:a92:aa94:: with SMTP id p20mr11099726ill.266.1598392640682;
        Tue, 25 Aug 2020 14:57:20 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id t88sm203330ild.8.2020.08.25.14.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:57:20 -0700 (PDT)
Received: (nullmailer pid 1410297 invoked by uid 1000);
        Tue, 25 Aug 2020 21:57:19 -0000
Date:   Tue, 25 Aug 2020 15:57:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: Sort list of support chip
 names
Message-ID: <20200825215719.GA1406172@bogus>
References: <20200819124004.19728-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819124004.19728-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 02:40:04PM +0200, Geert Uytterhoeven wrote:
> Sort the list of supported chip names, using "sort -V", to take into
> account both names and numbers.
> 
> This makes it easier to read and maintain the list.

Can we just do this when converting to schema?

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.txt | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
