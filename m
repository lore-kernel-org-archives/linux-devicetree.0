Return-Path: <SRS0=WjJE=NM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-it1-f196.google.com ([209.85.166.196]:40085 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbeKASYs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 1 Nov 2018 14:24:48 -0400
Received: by mail-it1-f196.google.com with SMTP id i191-v6so1147896iti.5
        for <devicetree@vger.kernel.org>; Thu, 01 Nov 2018 02:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20181031204927.3801-1-bunk@kernel.org>
In-Reply-To: <20181031204927.3801-1-bunk@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Nov 2018 10:22:25 +0100
Message-ID: <CAMRc=McdO1WnfKUP9d-O6xnPsf3rhwmrVhc2tW-+gXHO_-sbMg@mail.gmail.com>
Subject: Re: [PATCH v3] eeprom: at24: Add 24c2048
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: bunk@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-i2c <linux-i2c@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

=C5=9Br., 31 pa=C5=BA 2018 o 21:49 Adrian Bunk <bunk@kernel.org> napisa=C5=
=82(a):
>
> Works with an ST M24M02.
>
> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
>  drivers/misc/eeprom/Kconfig                       | 2 +-
>  drivers/misc/eeprom/at24.c                        | 3 +++
>  3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Document=
ation/devicetree/bindings/eeprom/at24.txt
> index aededdbc262b..f9a7c984274c 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -27,6 +27,7 @@ Required properties:
>                  "atmel,24c256",
>                  "atmel,24c512",
>                  "atmel,24c1024",
> +                "atmel,24c2048",
>
>                  If <manufacturer> is not "atmel", then a fallback must b=
e used
>                  with the same <model> and "atmel" as manufacturer.
> diff --git a/drivers/misc/eeprom/Kconfig b/drivers/misc/eeprom/Kconfig
> index 68a1ac929917..d382b13c27dd 100644
> --- a/drivers/misc/eeprom/Kconfig
> +++ b/drivers/misc/eeprom/Kconfig
> @@ -13,7 +13,7 @@ config EEPROM_AT24
>           ones like at24c64, 24lc02 or fm24c04:
>
>              24c00, 24c01, 24c02, spd (readonly 24c02), 24c04, 24c08,
> -            24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024
> +            24c16, 24c32, 24c64, 24c128, 24c256, 24c512, 24c1024, 24c204=
8
>
>           Unless you like data loss puzzles, always be sure that any chip
>           you configure as a 24c32 (32 kbit) or larger is NOT really a
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 7e50e1d6f58c..94836fcbe721 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -173,6 +173,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLA=
G_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
>  /* identical to 24c08 ? */
>  AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
>
> @@ -199,6 +200,7 @@ static const struct i2c_device_id at24_ids[] =3D {
>         { "24c256",     (kernel_ulong_t)&at24_data_24c256 },
>         { "24c512",     (kernel_ulong_t)&at24_data_24c512 },
>         { "24c1024",    (kernel_ulong_t)&at24_data_24c1024 },
> +       { "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
>         { "at24",       0 },
>         { /* END OF LIST */ }
>  };
> @@ -227,6 +229,7 @@ static const struct of_device_id at24_of_match[] =3D =
{
>         { .compatible =3D "atmel,24c256",         .data =3D &at24_data_24=
c256 },
>         { .compatible =3D "atmel,24c512",         .data =3D &at24_data_24=
c512 },
>         { .compatible =3D "atmel,24c1024",        .data =3D &at24_data_24=
c1024 },
> +       { .compatible =3D "atmel,24c2048",        .data =3D &at24_data_24=
c2048 },
>         { /* END OF LIST */ },
>  };
>  MODULE_DEVICE_TABLE(of, at24_of_match);
> --
> 2.11.0
>

This patch doesn't even apply to current master, but first off: send
the DT and code changes as separate patches.

Bart
