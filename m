Return-Path: <SRS0=rl0j=YT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FF2CA9EBD
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 00:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B0A3206DD
	for <linux-devicetree@archiver.kernel.org>; Sat, 26 Oct 2019 00:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572049063;
	bh=X+a2LVcHt87CWgxhE5kaRy1j9ynMPdLcGa3TVIBNKeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zFwXKVOHCTWPPWKcImITo0eul0ZmNKxPpAdAEabTMrCth8+zI7TZPVw+Prg+A2qiH
	 6dJM0602mVFVXh8ko7GR5YyuI5/Nzn53fi2JqH3YFHPn5N/IrrmpOKgcKMy02XIrcP
	 +pglR2HutZIpLlCHVAevLRP2dZQAE3jgZ/4PhQ4k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfJZARm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 20:17:42 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33887 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJZARm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 20:17:42 -0400
Received: by mail-ot1-f65.google.com with SMTP id m19so3270546otp.1;
        Fri, 25 Oct 2019 17:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wSQgMwPu7JbWHT1qsqlndnUHkgdmiA6I8kmhRBBzvqw=;
        b=GA/V4q1tuDit2ruQ13UhBtsCG7dZM0b8AKtduITx7Lrnu/qtOAq4o03u2i0vihLgY3
         Vmg1YObbGRpXmaRMx21bMRI2ln7PW6DssmgwQ1qhV2Oy9cgU1bBij+Oqtmkwlc9XqIQ1
         akkjGT+GPyGOcyZrafT/fx5C6GNE6eTGR9/O5rbw9wNxwo0j8QHXpgf559pLHU5cWspC
         00y/8elYA0x+nlJxdL0oNNQDfxF0OvDyWziCYKYrLpH2oL2R4rBD2sgn3DeFgGA3Wv3s
         t777vaf90/LbVGJSZIessWaLZW9+Ot10aZHEj8Cvl3WV6phhPPNxGaRKugNmvu0VAF8o
         bRsQ==
X-Gm-Message-State: APjAAAXNzvVtCWDzCnrLY3tYWKAr1maGoHYXvIfGcuPP1S3YUfySsV6Q
        AsXWueP36Wdhhkbu4X2vNA==
X-Google-Smtp-Source: APXvYqwiuBVffdopC/lvf6vFPy+kHrQrrmULNf+6gQoc5GuYiWtpYyH0K2TNE0R3s/flIpIt8VNfNQ==
X-Received: by 2002:a9d:3674:: with SMTP id w107mr5092117otb.244.1572049060034;
        Fri, 25 Oct 2019 17:17:40 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b12sm1247591otp.72.2019.10.25.17.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 17:17:39 -0700 (PDT)
Date:   Fri, 25 Oct 2019 19:17:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: renesas: Add Salvator-XS board
 with R-Car M3-W+
Message-ID: <20191026001738.GA7018@bogus>
References: <20191023122911.12166-1-geert+renesas@glider.be>
 <20191023122911.12166-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023122911.12166-3-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 23 Oct 2019 14:29:08 +0200, Geert Uytterhoeven wrote:
> Add device tree binding documentation for the Renesas Salvator-XS board
> equipped with an R-Car M3-W+ (R8A77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by,
>   - Add board part number.
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
