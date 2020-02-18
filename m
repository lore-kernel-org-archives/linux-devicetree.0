Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA52C34047
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 20:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C900324672
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582056123;
	bh=UTF+/7gR0toqAfMaUNuS73nTnbeQrSIFpJkVpDxrIUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=eHKBH6eH7I3GrcrBkl50FW+RUSwk6OiEML83eUvOVPKsbeTwCoa8X0Ujd3A2uOu+N
	 IzbSb6NYpCtm2rzJHHEJJ+VhtpG+BblZBb/foydROSeFqRR0C2GzkWdF7uUu+iLhuR
	 EEic2TVHlaiuC+qU+XpferBvWy3PZJFtzfJRYFMA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgBRUCC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 15:02:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:42044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728466AbgBRUCB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Feb 2020 15:02:01 -0500
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDAA22465D
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582056121;
        bh=UTF+/7gR0toqAfMaUNuS73nTnbeQrSIFpJkVpDxrIUw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wzQo5mIYx+73s1JYemoIK/Iw/wbPEAMqaOTqnZf2dVhZnqtUq563aabbfqx0Geli5
         FAWmkZ/p/52USCQL3TeZFzlhyclWdVptRn/oRWvbEQPh6ba2EIJMV8r8OP0jmhtHz8
         bAQPl7zUl+rFSsUkvYME2oeRrYhT+8+QOlCtiWrw=
Received: by mail-qk1-f176.google.com with SMTP id o28so19451794qkj.9
        for <devicetree@vger.kernel.org>; Tue, 18 Feb 2020 12:02:00 -0800 (PST)
X-Gm-Message-State: APjAAAU6/UmDpq9ujDtS7mSd7SSJ/Q81cV4SW4FMyz/tSJPHV1HXxgVE
        Y5A9tF8rQ3aB5aGq6aRHDtGJqME8sqk4bevysA==
X-Google-Smtp-Source: APXvYqwvKooY9qd0acYCvQX0uTJGaNTiOoUq2dafvZrvGChzderZi1tWdARuLkD2HS4vQ5lHstUl1LPFhBPOkPcZv3g=
X-Received: by 2002:a05:620a:1237:: with SMTP id v23mr3954986qkj.223.1582056119512;
 Tue, 18 Feb 2020 12:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20200216181513.28109-1-sam@ravnborg.org> <20200216181513.28109-4-sam@ravnborg.org>
In-Reply-To: <20200216181513.28109-4-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 18 Feb 2020 14:01:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLATnzZnUSugiu7JnUcDzT1WLNqUSEwJGmj1NkCORFsVg@mail.gmail.com>
Message-ID: <CAL_JsqLATnzZnUSugiu7JnUcDzT1WLNqUSEwJGmj1NkCORFsVg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: display: convert panel-dpi to DT schema
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
> With panel-timing converted, now convert the single
> remaining .txt user in panel/ of panel-timing to DT schema.
>
> v2:
>   - Drop Thierry as maintainer, as this is not a general panel binding
>     and I have no acks.
>   - Drop requirement for a panel- specific binding - "panel-dpi" is enough
>   - Updated example
>
> v3:
>   - added yaml document terminator "..."
>   - always require a specific binding - panel-dpi (based on feedback from Rob)
>   - use "power-supply" for the supply property, and made it mandatory
>     "power-supply" is the standard property for panels
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  .../bindings/display/panel/panel-dpi.txt      | 50 -------------
>  .../bindings/display/panel/panel-dpi.yaml     | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dpi.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
