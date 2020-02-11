Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626CCC352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BA7B206DB
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:16:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W1+92dCh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgBKMQd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 07:16:33 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45633 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgBKMQd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Feb 2020 07:16:33 -0500
Received: by mail-wr1-f65.google.com with SMTP id g3so11008778wrs.12
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=GUGVeWyTamE7UDj1FKSQ+oAogvWYH8rVlMddW6H23bo=;
        b=W1+92dChYL38m0QO++WYETYen2Fxo5eUiRgk2TXSr9E1riiBm5WQ5epUQwHBYgg5Q4
         Fgj6CeZHrKZuTII/KbyWNpNova/3fm1WK1YB+EWM8MuFQoeiwyXsLJu0xxmMw9kbhEL4
         N+BG29zaELbKteYXpKNUVouXWqrCxd5WW3WFjRtmzzSrfidgwlKwdgtgeFF3LLuBCshQ
         NsNnPCC8kBXMywXCzzhUC8bhTGFWah1fLdtCgVoXTbrQBFhSImu2zH4Mi9an7sS70ecf
         guw+cYpi5JzNhlxU5nEkl4Bn6jGt9i+ZXNRTWOE0w9X/DDON7Hc1CAW1ZmHeiLROLJ7U
         CTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=GUGVeWyTamE7UDj1FKSQ+oAogvWYH8rVlMddW6H23bo=;
        b=Wm51VUIKl6Gbv50Kdym9venl+0iaDbpOWiXtqh79a6+mY8ETWXqnGkPHIeKXw4GZCm
         xSbr5nzRbC/iu1oaWbef1gboDMY9nChhHCVhMaQemUrJWKxCOBGAz3Cbqz2womMI/2aK
         NzLlbEuUrekWuTSURoKTPs7/DMPTsRKWITgEOyJQrpB1CndssK54jQmtdozsIg6DlLLF
         QByaJIu8I+PlSrL2q3bRZtg9485WH4ovNl3qno+CNtwBDBnrNn/2S1h/BfG2jBu9wrfy
         b9UwV7QLD8T9UW3qJGIDlT6uEgLfacOw6mt7dpZ3YeOu3EKRbIJzFV52irk7P+PWSgyi
         PWLA==
X-Gm-Message-State: APjAAAUrWdz/x4GZZS6Neu/8Ou1/KQdltba56l05qgCxXlowqz1ncrQs
        nwBPZk/npEXcYLBROeZRZqRp1Q==
X-Google-Smtp-Source: APXvYqwfT/nPvnV/mY2Ya9vBY1B2CXqBG3HndSvJlIoc9nkQdXy7phO8sDESz0qr6Hw1YB1/L4rIrw==
X-Received: by 2002:adf:82ce:: with SMTP id 72mr8363015wrc.14.1581423391418;
        Tue, 11 Feb 2020 04:16:31 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c4sm3446467wml.7.2020.02.11.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 04:16:30 -0800 (PST)
References: <1581419454-12667-1-git-send-email-hanjie.lin@amlogic.com> <1581419454-12667-2-git-send-email-hanjie.lin@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Kevin Hilman" <khilman@baylibre.com>
Cc:     Yue Wang <yue.wang@amlogic.com>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        "Victor Wan" <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
In-reply-to: <1581419454-12667-2-git-send-email-hanjie.lin@amlogic.com>
Date:   Tue, 11 Feb 2020 13:16:29 +0100
Message-ID: <1jpnelb9pe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Tue 11 Feb 2020 at 12:10, Hanjie Lin <hanjie.lin@amlogic.com> wrote:

> Add the Amlogic A1 Family USB2 PHY Bindings
>
> It supports Host mode only.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
> index 57d8603..3b7e763 100644
> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-g12a-usb2-phy
> +      - amlogic,meson-a1-usb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -49,6 +50,20 @@ required:
>    - reset-names
>    - "#phy-cells"
>  
> +allOf:

Is 'allOf' really needed when there is only one if clause ?

> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-a1-usb-ctrl
> +
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +      required:
> +        - power-domains
> +
>  examples:
>    - |
>      phy@36000 {

