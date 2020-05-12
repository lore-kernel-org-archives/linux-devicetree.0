Return-Path: <SRS0=NYOC=62=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1C8C54E8E
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C01220661
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 May 2020 12:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IQl0bX9u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgELM0h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 May 2020 08:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727783AbgELM0h (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 May 2020 08:26:37 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237A0C061A0C
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 05:26:36 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id i68so10797259qtb.5
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 05:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=slxR8Or9fOtkKCuML/8tuAolE3hEe64VEScXtdsZ78c=;
        b=IQl0bX9uQDZSEpBL1QdfnvVQb8awt2oSN0BrIlRlgW1pwJfRCjDwUTp19/3ZeROH05
         0tf94tK0qA4dDBba5NXmGMv30httX8Mqo53Er//jmXx0dftupi3hpGDdQPVnPgDquwn9
         /iT13QbDxnSir5uxYKehpbQgRy8F8uPXfSzTq70VIUL7a11D+GMf1y0j5mSAQJhbqYth
         QdFahA/jEdBqLiXs2CFDMERcGwVFSFvl20mSl1vDqvPtrypgXqt6Znf3zcnfBGeDibnX
         087fZH1oXn1RNoDLJ1Jp7fWOkg/jEAqQbpCWwAwdFNQGiEQBHfVx7YySNN8xHBJKrUeh
         Y3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=slxR8Or9fOtkKCuML/8tuAolE3hEe64VEScXtdsZ78c=;
        b=RHCDeDAvP6jqfIgIZRxdEQIb66rDHeibr2gwLqz04zyO59YhzfIleSEhOMYbcmdVn6
         FoT3mUV0JH4b7V/BAxeA/i15f0hRrfTFF/v9yGNUiDFnY15UProAMZ7AH/u+N0gxBCPX
         u2SBpwzO0h5XA+A3qVd76lZTswz7PS2+0xqWqfZjhgvvJmSg1kRzeZi0vNRzvkjVer62
         KJwuqczi5QyKtkXeuwAhIAHseM2jr6JUhUCqjkdMRW4FVfGmU1+6TPHs2XtnUNtdPH8W
         lFGwH7+CLh3Zyr//oQzmqPeSSAk8Edtc+IqNxoDDiM6v66fYKTyCrI3sY5WM9lWWFtG7
         Na/A==
X-Gm-Message-State: AGi0PuasJSLQclDSLOupdgnQue4VPPJYagF01knhBOtQ2FOCsTSdL1fL
        CHXxBYnmv+4GNFV4CoZEIjTKDhNnvn279r2Wa7mHAjOJ
X-Google-Smtp-Source: APiQypKFDytL4bKscWfdjy5F9YyMJ/6jtqUYtOVGna/o9F6ezUY6UD1yurIS+AgPzIq3ZX+6wEa/65/CN5uf4f6vwHs=
X-Received: by 2002:aed:257c:: with SMTP id w57mr17477020qtc.208.1589286395304;
 Tue, 12 May 2020 05:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200512122450.20205-1-geert+renesas@glider.be>
In-Reply-To: <20200512122450.20205-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 12 May 2020 14:26:24 +0200
Message-ID: <CAMpxmJWfEb_TiOu=cRSYLOHxi4C1icvnHyyCLfZHN=BSL9xZJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix list of page sizes for writing
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

wt., 12 maj 2020 o 14:24 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> "258" is an odd power-of-two ;-)
> Obviously this is a typo, and the intended value is "256".
>
> Fixes: 7f3bf4203774013b ("dt-bindings: at24: convert the binding document=
 to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index d77bc475fd148d99..4cee72d5331877a8 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -124,7 +124,7 @@ properties:
>        may result in data loss! If not specified, a safety value of
>        '1' is used which will be very slow.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [1, 8, 16, 32, 64, 128, 258]
> +    enum: [1, 8, 16, 32, 64, 128, 256]
>      default: 1
>
>    read-only:
> --
> 2.17.1
>

Ha! Of course it is. :)

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
