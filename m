Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B74FC34047
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 20:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F420D2176D
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 20:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582056839;
	bh=Acc7PN7duriLeMEBn/i+Ipfei5C84iWC+Cce28eKV88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=z1Au7QpK4RZStfXHZHxp4BeCtLKafD7PssLK4bv/Ur3ql4HaAJGMfDi1LUzn63Dgx
	 umIsoJa+K7vK+pasKvd7RH+BRVvLC3vGb65E9UMCZi/w4COSGy5uxjwrOosMe440OV
	 vo6F0604PboqxfuOm3O2A36uoT9bGveQwb2wJ1+o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgBRUN6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 15:13:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:50752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgBRUN6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Feb 2020 15:13:58 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BF422176D
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 20:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582056837;
        bh=Acc7PN7duriLeMEBn/i+Ipfei5C84iWC+Cce28eKV88=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Xa/HojNS7ER7D9LpiPBpcCfF6aZVcYWftXni4e5EASAVVXte1GKF3yeNl/bHrqUyS
         lCi4weB9ny/H2vgj+IhAebwSlPwCWWj2FOb+Pf5QtjEL6wDjBCaeDdKH4TzelELbBY
         rvY4Y4fbPtlnpFBnZxwCCkbsGp5LpMIZuh7dPF5w=
Received: by mail-qk1-f177.google.com with SMTP id p7so20820794qkh.10
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 12:13:57 -0800 (PST)
X-Gm-Message-State: APjAAAUf8EJtnt+bjtUak4WTzEU3PIRrHjR7N74XQie5oAmAvQFIJxu/
        sxurwoUNSaB3YloykmUmxuqAkn+H7SNpmGdPPA==
X-Google-Smtp-Source: APXvYqybczt9BgmXl0zwE3fcZYEM5u3dyflmTv2R+FtGMnj+y9Zn0gyqJ/tbhIImcIrVhl4UZqXSMboy7eCznWHRWIY=
X-Received: by 2002:a37:9d47:: with SMTP id g68mr15663876qke.119.1582056836665;
 Tue, 18 Feb 2020 12:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20200216181513.28109-1-sam@ravnborg.org> <20200216181513.28109-5-sam@ravnborg.org>
In-Reply-To: <20200216181513.28109-5-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 18 Feb 2020 14:13:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
Message-ID: <CAL_Jsq+AbXEiLCYiAvwr5qzbSnuo9G8bTwAM3G9J4cPYz1_FMw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Feb 16, 2020 at 12:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Add data-mapping property that can be used to specify
> the media format used for the connection betwwen the
> display controller (connector) and the panel.
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Missing blank line.

> ---
>  .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> index 40079fc24a63..6a03d2449701 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> @@ -21,6 +21,16 @@ properties:
>        - {}
>        - const: panel-dpi
>
> +  data-mapping:
> +    enum:
> +      - rgb24
> +      - rgb565
> +      - bgr666
> +      - lvds666

Doesn't lvds666 come from i.MX IPU which as I remember has built-in
LVDS block? I'd think this format would be implicit when using the
LVDS block and panel. It doesn't seem this is actually used anywhere
either.

Rob
