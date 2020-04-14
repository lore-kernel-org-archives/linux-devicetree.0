Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73628C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:29:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57F9920774
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586888977;
	bh=Dejw0mOY8BPmI+vovB2Kso0dVswmoAWKUADmwfEjAFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=k492YYLSnhPYN719DCTesrhipjYxGwu24rXMzCBLFgM1SL6ePB66Z7FTy5cnCHj6q
	 kjN1Om0r7Wu4ozDEJeqFmzI4RfRfZPiG6VQ4hVzjoKikztellxBG+SAxWMpnNBhGL7
	 Sxkrp5snJEQXSsFpbmSzOiVwmQsUxzIf/ZhkWmU4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbgDNS3f (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:29:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44987 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbgDNS3d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:29:33 -0400
Received: by mail-ot1-f65.google.com with SMTP id j4so638532otr.11
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9AGTb6lDHBIB4GO1K1r+d8ktTmCVjobWYQ9JHJM4Zyg=;
        b=r75uugkvmEigDjniyKzvIGvgT9YscltQfL9sy2I9r+IKqECODM/XlScQGpDrogJ4jt
         4y/RpU2EknCyuVb1lD8+CRaq/lh0eI097D/SXQsdbcUkY1K4u6ynuxwwo2tuAsQ6XMFn
         sU+HBCrDc/cmAl+juFvUtowdVHonAhSsldQYuiC/aINc+ITfKXH1iPDIAIMK/pGK1YUJ
         s2hD78nYRz1O5jyYVNIuRBnlZifaBR0hRA8ahED+sLq6cDQPJmEwkw1m0Av/QC1Gf23k
         Zaftm96uvqwyEuQGXtkzE3G+fZOFWMBrx2p3Rb+56Xz/W27eWeUmIeIWxL/ZIdIvhNCV
         HxqA==
X-Gm-Message-State: AGi0Pub07xVuMeyaeXZu2kxu5O6/iuI9r6GpJJLZ4Wt/yAcGXLSH4G0n
        hyI77n4eu0fUjtTU2oYOBw==
X-Google-Smtp-Source: APiQypIyuhxdNK/238sgyNwHWUvsPoGzbBLxBPmGRlma8x3qieuGQMoUbK0ZyJw4jS5KKGIHK/slKg==
X-Received: by 2002:a4a:4442:: with SMTP id o63mr6466018ooa.0.1586888972278;
        Tue, 14 Apr 2020 11:29:32 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 186sm6148048ooi.30.2020.04.14.11.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:29:31 -0700 (PDT)
Received: (nullmailer pid 27234 invoked by uid 1000);
        Tue, 14 Apr 2020 18:29:30 -0000
Date:   Tue, 14 Apr 2020 13:29:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Chris Zhong <zyw@rock-chips.com>
Subject: Re: [PATCH v2 09/36] dt-bindings: display: convert innolux,p079zca
 to DT Schema
Message-ID: <20200414182930.GA22691@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-10-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-10-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 08, 2020 at 09:50:42PM +0200, Sam Ravnborg wrote:
> As the binding matches panel-simple, added the compatible to the
> panel-simple list.
> With this change enable-gpios is now optional.

But is a DSI panel, so it should be in panel-simple-dsi.yaml.

> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chris Zhong <zyw@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/innolux,p079zca.txt         | 22 -------------------
>  .../bindings/display/panel/panel-simple.yaml  |  2 ++
>  2 files changed, 2 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> deleted file mode 100644
> index 3ab8c7412cf6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,p079zca"
> -- reg: DSI virtual channel of the peripheral
> -- power-supply: phandle of the regulator that provides the supply voltage
> -- enable-gpios: panel enable gpio
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel@0 {
> -			compatible = "innolux,p079zca";
> -			reg = <0>;
> -			power-supply = <...>;
> -			backlight = <&backlight>;
> -			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 8fc117d1547c..328df95cbe88 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -143,6 +143,8 @@ properties:
>        - innolux,n116bge
>          # InnoLux 15.6" WXGA TFT LCD panel
>        - innolux,n156bge-l21
> +        # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> +      - innolux,p079zca
>          # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
>        - innolux,zj070na-01p
>          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> -- 
> 2.20.1
> 
