Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8574C433E4
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C64FD2076D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:13:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="Yr2Iz1CP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgGQNNM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 09:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgGQNNI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 09:13:08 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C06AC08C5DD
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 06:13:07 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so6008810lfb.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IYqIiSc4U+64C+dG7+7slm/+2g/0OvHpgIOhb6Omtgc=;
        b=Yr2Iz1CP+EXc8VfkIDEksEY8LuFINVnWrfFXlpNEfmNponbzhEbML51zKfKEJKcimu
         x1SnWuwfMbqbICdyW0Fkyf8z2jRI0dj2VVtiK0vt9+Li6/mx02iD09DEAMmmnGMZDFsp
         v9qrVYb5fPT/ksWDS6HEEEhxB3mgGQSgpTl9jkHinDmTnMJRBY6ZwvroDmZNtB+/ycaN
         R4CUaCV18VNjMH0K/SPqYMeAlS38rwJ6tO1YuLpWlEl1iGbu4ouGnMmwUp4Qy1S3HxPh
         0hR2twN4iNh9G++ahDfjijCYizBZwgESgeK8xKSjPK2A2oh26Hivv91I99y1X0ci9dI5
         5TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IYqIiSc4U+64C+dG7+7slm/+2g/0OvHpgIOhb6Omtgc=;
        b=pVBs6FihV3xKtnqMwqwRcRXU4D+NZSkYqZqynQz5/9+jwKkfvVRVhrE0K8QAeRC5ff
         7pkh7FjUgoSkHjH0GQkS83mDhjJDn2o0OzWZ5uO+8f/kUtwFmcMOIhiXDLov819dd+4k
         yHu1BcdbBu9uLh+qUxfEAxxWA816g+FiTXOOc58jgEsSKX9pjB8qh1kXXD2ALVwvzgn/
         PHnCAfV+Q6NPFAby3LtIUNLUxIyfSz9hEJ5YA+fPa4fzRAuzmFacfH8ZFSo/u0FV9u2p
         vxCcULGpp8dT2g8KysOhmtfc6OLuMcjvEoCvPhlkFbiER0GdpoliaBflNpZidpZHqhMn
         EWyQ==
X-Gm-Message-State: AOAM5324wt771/9QYAUo/kg2D4LvNyU7FgmeIMorzKxNLq4ZBob5JwU8
        sHw12RXACExFOHIAl38hrWVYKA==
X-Google-Smtp-Source: ABdhPJyuAt5XLkeaHa2ADqc8yqRKoh6hwmeK7QXeggSiowkUr6/ybt/t04bLY7BvMRtrHmWBjAcMCQ==
X-Received: by 2002:a19:710:: with SMTP id 16mr3866800lfh.171.1594991585253;
        Fri, 17 Jul 2020 06:13:05 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j4sm1862395lfb.94.2020.07.17.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 06:13:04 -0700 (PDT)
Date:   Fri, 17 Jul 2020 15:13:03 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 16/20] dt-bindings: media: renesas,csi2: Add R8A774E1
 support
Message-ID: <20200717131303.GA175137@oden.dyn.berto.se>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-17-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1594919915-5225-17-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Lad,

Thanks for your patch.

On 2020-07-16 18:18:31 +0100, Lad Prabhakar wrote:
> Add the compatible string for RZ/G2H (R8A774E1) to the list of supported
> SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> index c9e068231d4b..53b078622fd9 100644
> --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> @@ -22,6 +22,7 @@ properties:
>          - renesas,r8a774a1-csi2 # RZ/G2M
>          - renesas,r8a774b1-csi2 # RZ/G2N
>          - renesas,r8a774c0-csi2 # RZ/G2E
> +        - renesas,r8a774e1-csi2 # RZ/G2H
>          - renesas,r8a7795-csi2  # R-Car H3
>          - renesas,r8a7796-csi2  # R-Car M3-W
>          - renesas,r8a77965-csi2 # R-Car M3-N
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
