Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B53BCA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 06:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBC822166E
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 06:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y0Ugk/Gk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408530AbfJXGWn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 02:22:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35332 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727750AbfJXGWn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 02:22:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id z6so19680149otb.2
        for <devicetree@vger.kernel.org>; Wed, 23 Oct 2019 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yZG9jtnuedOt/dHRAYWtgX9vQPKuKorOkKTpY87wyXk=;
        b=Y0Ugk/GkYYSJvfvSLIIRehaDu7G67d+YIEMhVeWgQ6hkMbNhBCGfy/0Ti7kxXNizWQ
         hMbjNMj+HgU8BbK7r0tTchIFVVQbV5lhYo8/lG/R1mVuI4F2cvog2Y4YcJgMdHG5CteZ
         uirFwSv4l+I+eYBe1BRuO2vM6IPfVSWHf6iNqKsviquihddTxgf10/zDKQu/gnDl10mF
         kbPz3KsxZrayQyuzNyiwIVIk8meycKiYg7Mg93ladWbWIRjMbZIgtFhKfU7ssbHgjwzD
         rTbkpI1mUHKts4Wn2qyoFblGlASbBIUxPsGLJF+uGyhAvLuQ/3Cz8fF8AvVBunekpIy9
         S/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yZG9jtnuedOt/dHRAYWtgX9vQPKuKorOkKTpY87wyXk=;
        b=ilAoKtnffJtiuFJ5nWT8XLZ1K3IwdcZQuFRHoc22Qp19Pk3KrEu1r0UZEzOUtQFfa3
         q1dN/jLEVtLeIFYNDRLcqDUJ2vcGNt2uaEoZsriudK1BBkmx6aPUYoKv6QtS2+yo1U/c
         kofTCOaWfW7APGv+WiTdpq656lGXiSpsZdL87342eGhELCE3z+MvUaR9z9siYAsCXydF
         z9v80zkbB1W65zBwGZ37e376zVP91RNwJ44yvawvKUIx0Wn98Y950ZjqLv26+TufNojU
         ee7b1MUt6pCJLH2ckO43SBVkbb9hXuV48PA29eHHvn9Ko2QhK3y/ciwrLezFsJh07gXU
         gHKw==
X-Gm-Message-State: APjAAAXC1jsd1GE72FKTQTQb05Cs1Y8ljDKcTP3yf7CO9Wgenu74X+T0
        alfVPbU3UuWJqai+Wq5lCTNmSZc9GfIsJIOh5E+6ig==
X-Google-Smtp-Source: APXvYqxJku0jD1DLeuOdSJmz+cYvJj75K9Mr00GQYG+N9hxnoES/hgjbwd23TIaXuqUWdX5hvF6wbbZk3Q31ac5fT4k=
X-Received: by 2002:a9d:7dd6:: with SMTP id k22mr10090655otn.256.1571898160578;
 Wed, 23 Oct 2019 23:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <20191018082557.3696-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Oct 2019 08:22:29 +0200
Message-ID: <CAMpxmJW_HQnL8i5FnKcVUs=ZyrnaFe6X+oqG38-v=O05d5vNxw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

pt., 18 pa=C5=BA 2019 o 10:26 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=
=C5=82(a):
>
> In some platforms, they disable the power-supply of eeprom and i2c due
> to power consumption reduction.
>
> This patch add two supply properties: vcc-supply, i2c-supply.
>
> Changes since v1:
>  - change supply name
>  - rebase to next
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index e8778560d966..578487a5d9b7 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -167,6 +167,14 @@ properties:
>      minimum: 1
>      maximum: 8
>
> +  vcc-supply:
> +    description:
> +      phandle of the regulator that provides the supply voltage.
> +
> +  i2c-sypply:
> +    description:
> +      phandle to the regulator that provides power to i2c.
> +

Something was bothering me about this patch so I came back to take a
look. Can you explain what i2c actually stands for in this doc? I hope
I'm misinterpreting something and it isn't that the driver disables
the regulator powering the i2c bus controller?

Bart

>  required:
>    - compatible
>    - reg
> --
> 2.18.0
>
