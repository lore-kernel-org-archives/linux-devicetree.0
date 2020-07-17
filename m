Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E82C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 07:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E4E82076A
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 07:54:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KTA86zJn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgGQHyy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 03:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgGQHyy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 03:54:54 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CADDC061755
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 00:54:54 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l63so6291162pge.12
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2020 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uEOtVzALEOybmeb84SvDv2op2z0MYD8oWExMgtzeNfE=;
        b=KTA86zJnJDb4rjNHx0BQ/XeZrGINJUf7tpXs3v+tsbOyPUPV2FGjOkgwhg63KLfVSX
         xujyoPR46+x5mE9ZFEOQFZFj8RjvXNF+18LAg6w7lSDgILZiAjltXi5D59eBI27Rru1e
         eI8CS03LIVGPmEvBJWawxCE4fugAdqSbEjhQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uEOtVzALEOybmeb84SvDv2op2z0MYD8oWExMgtzeNfE=;
        b=aoS0oIz7mYd1IwzOlwZQzaxUlxMD09Fvxt+bgM45VJSHwc86+g3uGbrph43+1HIogc
         Dl3nOoBT5F5biLVgNkAN7Feyj0kDMvBSOApjPzp9Gd56lDIJPUJm/Yt519f2GGUS0tgQ
         AfpSdzFJy1L9DkE8Dw6tdEqtk9eXg2Qhpl/Jm4S5H6GDhvBnb2XzweJzRsj5h9FRYDrg
         cp+qpdupjpSKSyPg5x9pf5tVKS0tcOedqs2QpV3mtfSVVr4IHcPPnsFHf9c7Dwt0Xp1l
         dr7jfWvZVBbbD0OL2Efar1gUVtrLnQxc4kg7SngmsMVXDzIT8o8iFyFUQy+oUY9c6zGf
         aifA==
X-Gm-Message-State: AOAM5308BSFbfPBcbApcMbMgGe4D2y4kXrvEJmeGwQIoL9QYiID0zywX
        go4WR3LGS3+o7FRqEwB8+fxLAw==
X-Google-Smtp-Source: ABdhPJzk3ngbL+pgOeNTy5qxHQ1CNLPdpQwLSIrwagxwUcc1Om1v/gP5ZoR/qxuiZeTIq2HwMXVo7A==
X-Received: by 2002:a05:6a00:4c:: with SMTP id i12mr6783536pfk.71.1594972493663;
        Fri, 17 Jul 2020 00:54:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id m22sm7505577pfk.216.2020.07.17.00.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:54:53 -0700 (PDT)
Date:   Fri, 17 Jul 2020 00:54:52 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <treding@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: update usb-c-connector required property
Message-ID: <20200717075452.GD68629@google.com>
References: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Biju,

On Fri, Jul 17, 2020 at 08:34:33AM +0100, Biju Das wrote:
> Some boards have a single SS capable connector. Update usb-c-connector
> bindings to list port@1 as at least one of the required property.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Ref: https://patchwork.kernel.org/patch/11129567/
> ---
>  Documentation/devicetree/bindings/connector/usb-connector.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 9bd52e6..41e0685 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -139,8 +139,11 @@ properties:
>          description: Sideband Use (SBU), present in USB-C. This describes the
>            alternate mode connection of which SBU is a part.
>  
> -    required:
> -      - port@0
> +    anyOf:
> +      - required:
> +        - port@0
> +      - required:
> +        - port@1

So the connector[1] doesn't have any High Speed (D+/D-) lanes? Those are
supposed to be present on all Type C connectors.

[1] : https://patchwork.kernel.org/patch/11129567/

Regards,

-Prashant
>  
>  required:
>    - compatible
> -- 
> 2.7.4
> 
