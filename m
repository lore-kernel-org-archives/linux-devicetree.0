Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6BFCA9EA1
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 10:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 673CA222C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 10:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LLPHKZ4L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfJRKHk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 06:07:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38684 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391195AbfJRKHj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 06:07:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id e11so4487063otl.5
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4Vu8JiXTmFUPI/NYdTMI5V6tpTC56aVATRO+EZxqMUg=;
        b=LLPHKZ4L0zMURR2Gs1N6RGR+WCncysqrCQhJ+Up1lLWx1YQAz6Xw7gfUDZwgmexvb3
         bG6f0VYc4/Rlx7PFRao81sUm2E04I2YOQ/lTR937IUMIMCf3bGwMK1D0tlqQW+jmzqEu
         MOzt8N79OaXkoo9zj5sUGBWpYCjkUHX7Z1fPE+gujWcHrkmjPMiaMwfmnUrEu16Wlp3n
         Bb8bZj+xp81L7unvzEa2em6missVtgIktP8tkaA8nO3pKaSYMsQwF1Kzlp3sbPv/1xpP
         8DXBphuQt1aMPqkOzzBwULcHr8+HMfgNZOvIeUtzP2jzrJVhK5PHcDeJ508k/2NCc0Gv
         bB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4Vu8JiXTmFUPI/NYdTMI5V6tpTC56aVATRO+EZxqMUg=;
        b=RLsGnB0E0rEY13Kkg/sdXVYiVm+LD11Z/CnLXm20/zqtlZMzJOC41uSgZH8iHORhTq
         NF6r3nsdhsJ0NKmYPxybcu+ziIu6dNDy1cEQeCW+sCtYuafC9pElhX7JQTlYRfnzCILx
         hTQbL1K9Ny4rV7APTYpdHC+NltGcKGKACVfHU5Kuq4JsuxPkFAJtYozWwzF8+AHMDbgn
         +dDtzkDxVBtAlrpqO6f0yBS7QEYl9qAChwM9RX6aEE3xbO8vVlqT1vbroMEtgvm/ccMW
         YWuKQ/bF1wKUhHvjVZo3/ddqs18cwnvoYflK3tuwkSDQc13Wt8VIoJql/tkYUd3j1nZG
         jpXA==
X-Gm-Message-State: APjAAAUA7kXWVyrMM3cCUvFV4m9i7QBzPIRQhM6fZ9t2BYBWQzRZeOK3
        m/GC91O8St4fb5c++C9ZKOoDYxJ9XbZqolm6JEYKYw==
X-Google-Smtp-Source: APXvYqxRP3wqz5ncW0B7ywyoT7SUYZwc6ng/vET8V34Tk1Ptv2ONCt1vNB82+PthvDjkuJlh5QtMu0jsKD64wyyrAbU=
X-Received: by 2002:a9d:344a:: with SMTP id v68mr7111048otb.85.1571393258795;
 Fri, 18 Oct 2019 03:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com> <20191018082557.3696-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20191018082557.3696-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 18 Oct 2019 12:07:27 +0200
Message-ID: <CAMpxmJXaHqA9S+kxNH_RP3cts2E2Pa5eX0r6GbjYGg1XujyvLg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-binding: eeprom: at24: add supply properties
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
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
>  required:
>    - compatible
>    - reg
> --
> 2.18.0
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Rob: if it looks good - can you take it through your branch together
with the conversion patch from this cycle?

Bart
