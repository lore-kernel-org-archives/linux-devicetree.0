Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1546C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEB8120768
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:50:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QDHfG7KG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406555AbgDOTuU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 15:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406382AbgDOTuN (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 15:50:13 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCB7C061A0C
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:50:13 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nu11so317792pjb.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=V6l2X70ea3XCzQRMPtn3nNECLb1DlkpL6KAzQKMivmc=;
        b=QDHfG7KGee7J1KR47wIe2BcCVaIwOUy359B1jIpJK6V6RZdEZTsG1tC/zWVGD6eoAy
         zqXsKEdsGmvzvqZ/h5rNFAlGDTU5LGgrT2ZlkqHpVKAIH7CwFw8824U2wR7hNIGtXebO
         lhm2pA1hLKA8lC23UcRJlY1avXPMOsYoEwweY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=V6l2X70ea3XCzQRMPtn3nNECLb1DlkpL6KAzQKMivmc=;
        b=gTyWaGJpR61jtg/qVGlXTgC/OuJl/49qOxhXbGxo6Ja1/FOOdmjRRZEFSAkwGWQItW
         WlzCQ1+f8tKL49NWNXgsJ0xt7pnbqLZDxQMCRIMsh5f7UwDV93Ip6DxcpLWkZmYCJkEa
         3wkPgCHL/vETl3VvODiOYh0BiYC9WSa+jGLbquQeXcc+x/sHupqVR6FIZUaZPwNxQ3aR
         Ih+jLyaHWSyN2VyBuUF/tMjzJxdI7Ormv7sykehfrUMDnvl8TqvXpC0519lQIh8oMQLd
         /sv1s/w3jKn/way+bDkQP3faho2wGSBh96X5B8d0Qigw+UQ62Uy0/Z/6QaeUJsnd/XX1
         sqxA==
X-Gm-Message-State: AGi0PubT0Fl/GQxHhDCM9AzR2UE+uik0vxqkflmDiCXk6ZWNrdl3/lmU
        X0hCbU6sGHzL0GbQ7NsaWPzKLw==
X-Google-Smtp-Source: APiQypKKY/tI8Uw1isr1iQMILFKeueLoYBL4RBrGVZULxPvpuI/+LxZFeV9xNIXzn0OzVsvK+vHMbw==
X-Received: by 2002:a17:902:a40f:: with SMTP id p15mr1132482plq.154.1586980212402;
        Wed, 15 Apr 2020 12:50:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r189sm13505392pgr.31.2020.04.15.12.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:50:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, daniel@ffwll.ch, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 15 Apr 2020 12:50:10 -0700
Message-ID: <158698021097.105027.12960498982161983978@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2020-04-15 08:48:39)
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Awesome!

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> new file mode 100644
> index 000000000000..8cacc6db33a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI86 DSI to eDP bridge chip
> +
> +maintainers:
> +  - Sandeep Panda <spanda@codeaurora.org>
> +
> +description: |
> +  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs e=
DP.
> +  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=
=3Dsn65dsi86&fileType=3Dpdf
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi86
> +
> +  reg:
> +    const: 0x2d
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specification for bridge_en pin (active high).

s/specification/specifier/ ? I know the previous binding said
specification but I don't know what that is. It's a specifier.

> +
> +  vccio-supply:
> +    description: A 1.8V supply that powers up the digital IOs.
> +
> +  vpll-supply:
> +    description: A 1.8V supply that powers up the DisplayPort PLL.
> +
> +  vcca-supply:
> +    description: A 1.2V supply that powers up the analog circuits.
> +
> +  vcc-supply:
> +    description: A 1.2V supply that powers up the digital core.

Nitpick: Can we remove 'up' from these descriptions?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Specification for input reference clock. The reference clock rate =
must

Clock specifier for input reference clock?

> +      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> +
> +  clock-names:
> +    const: refclk
> +
