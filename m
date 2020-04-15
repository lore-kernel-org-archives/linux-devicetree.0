Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF0AC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1766720768
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GoFcaSGn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441893AbgDOTxG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 15:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406367AbgDOTxF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 15:53:05 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4A6C061A0C
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d24so419601pll.8
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=wqYFqvgnJLp6jfCb/pT1ltjRniXVG7wFzSm2iZUIg6w=;
        b=GoFcaSGnLowNKUY4YRjMhjiMRBGA/jdKAlUVUZTQPxoBsFvIFSTTlnUehLhjTt6XW/
         pkYTbEE6cy80TR2qnidJEqejtnyMCFJlEJd5Ry68Rf8bPBDYeQI2nD1yeqTmG3b971Pj
         BWwmiYOx0iPDY1vbwU8QfuFYq/OFuzuNQYDwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=wqYFqvgnJLp6jfCb/pT1ltjRniXVG7wFzSm2iZUIg6w=;
        b=dsxCb2Nkg0x04om5KmctQQ5wIZz/7UHa4DjOBgHKKDz0zP9bwhv4lXevqyslZKc8kB
         2cMD3AleD1hbmn5IxY7ox8jwx0XdFmsNQM88bf5dcBDYbvltw0kEXMwTUL1VlRZcoWtx
         sg+UtCaaQHbCvxiO9KvD/0dOs8pVVL33fcdSel+V62nKgb7WNg7UMFyNMYIXhwVQsxij
         6pl+hF9an3NwD670QZyS8qPEhRRWam1mtPao3eK0qiPUHltOg/tAYQC0DKwpcqlRO73t
         yMxHyeyhC9wzQe2CnoDY2IkG5JPi/JCqFIr+nbNBeGWmVsy7Ix8WyanV9vvLOkDqT/XF
         Adhg==
X-Gm-Message-State: AGi0PuY8SPT9GKv/2WIkvqQc16AsqU0q2YkafTg+bARhVtHq6coWkgfv
        CS8qugEhoOgCjNLo4bT2yYtEtw==
X-Google-Smtp-Source: APiQypKW2QCwYlYY+1tV4ZUdnxB7+EL5+2eKfXLs2OXbzTVeg9HjP9FGOirAs7OCA3jRywMzN3Tt7g==
X-Received: by 2002:a17:90a:17ce:: with SMTP id q72mr892159pja.139.1586980384222;
        Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x76sm14312883pfc.190.2020.04.15.12.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:53:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid> <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios to the bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        jernej.skrabec@siol.net, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, daniel@ffwll.ch, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 15 Apr 2020 12:53:02 -0700
Message-ID: <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2020-04-15 08:48:40)
> Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> example.
>=20
> NOTE: The current patch adding support for hpd-gpios to the Linux
> driver for hpd-gpios only adds enough support to the driver so that
> the bridge can use one of its own GPIOs.  The bindings, however, are
> written generically.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 8cacc6db33a9..554bfd003000 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -60,6 +60,10 @@ properties:
>      const: 1
>      description: See ../../pwm/pwm.yaml for description of the cell form=
ats.
> =20
> +  hpd-gpios:
> +    maxItems: 1
> +    description: If present use the given GPIO for hot-plug-detect.

Shouldn't this go in the panel node? And the panel driver should get the
gpio and poll it after powering up the panel? Presumably that's why we
have the no-hpd property in the simple panel binding vs. putting it here
in the bridge.
