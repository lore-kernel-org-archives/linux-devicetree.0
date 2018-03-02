Return-Path: <SRS0=C5ln=FY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:40256 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1945926AbeCBKRp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 2 Mar 2018 05:17:45 -0500
Received: by mail-oi0-f65.google.com with SMTP id c12so6678951oic.7
        for <devicetree@vger.kernel.org>; Fri, 02 Mar 2018 02:17:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1517240748-14780-6-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1517240748-14780-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1517240748-14780-6-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Mar 2018 11:17:44 +0100
Message-ID: <CAMRc=MdBFBqts1G7m9mXfok+ZHTK8EtB=T6Nmn7ACmLQptxyDw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] dt-bindings: at24: add bindings for Rohm BR24T01
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, geert@linux-m68k.org, kieran.bingham@ideasonboard.com, Wolfram Sang <wsa@the-dreams.de>, Magnus Damm <magnus.damm@gmail.com>, linux-i2c <linux-i2c@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

2018-01-29 16:45 GMT+01:00 Ulrich Hecht <ulrich.hecht+renesas@gmail.com>:
> Both manufacturer and name variant.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
> index 1812c84..dd29937 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -40,6 +40,7 @@ Required properties:
>                  "microchip",
>                  "ramtron",
>                  "renesas",
> +                "rohm",
>                  "nxp",
>                  "st",
>
> @@ -47,6 +48,7 @@ Required properties:
>                  variants of the above. Known such exceptions are listed below:
>
>                  "renesas,r1ex24002" - the fallback is "atmel,24c02"
> +                "rohm,br24t01" - the fallback is "atmel,24c01"
>
>    - reg: The I2C address of the EEPROM.
>
> --
> 2.7.4
>

Applied to for-next, thanks.

Bart
