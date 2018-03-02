Return-Path: <SRS0=C5ln=FY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:34277 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424699AbeCBQ7D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 2 Mar 2018 11:59:03 -0500
Received: by mail-ot0-f193.google.com with SMTP id n74so9309643ota.1
        for <devicetree@vger.kernel.org>; Fri, 02 Mar 2018 08:59:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1520001067-12111-1-git-send-email-geert+renesas@glider.be>
References: <1520001067-12111-1-git-send-email-geert+renesas@glider.be>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Mar 2018 17:59:01 +0100
Message-ID: <CAMRc=MfNv6EoFZ9R=nzeQK2Y1dDpyy7uMusRaNWxedYb1FkjRQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: at24: Add Renesas R1EX24128
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

2018-03-02 15:31 GMT+01:00 Geert Uytterhoeven <geert+renesas@glider.be>:
> Document the compatible value for the Renesas R1EX24128ASAS0A two-wire
> serial interface EEPROM, so it can be used in DTS files without causing
> checkpatch warnings.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v2:
>   - Add Acked-by,
>   - Rebase on top of commit 6da28acf745fe253 ("dt-bindings: at24:
>     consistently document the compatible property").
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
> index 1812c848e369e2a2..0bd685f0cff1b7fa 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -47,6 +47,7 @@ Required properties:
>                  variants of the above. Known such exceptions are listed below:
>
>                  "renesas,r1ex24002" - the fallback is "atmel,24c02"
> +                "renesas,r1ex24128" - the fallback is "atmel,24c128"
>
>    - reg: The I2C address of the EEPROM.
>
> --
> 2.7.4
>

Applied to for-next, thanks,

Bartosz
