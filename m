Return-Path: <SRS0=YV+w=RY=bgdev.pl=brgl@kernel.org>
MIME-Version: 1.0
References: <20190320103351.20609-1-geert+renesas@glider.be>
In-Reply-To: <20190320103351.20609-1-geert+renesas@glider.be>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Mar 2019 09:58:45 +0100
Message-ID: <CAMRc=Md94qf0Nmd8rHGeFyykEqixeKKqTSRBiieVSyTQe83A6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at24: add Renesas R1EX24016
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, linux-i2c <linux-i2c@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

=C5=9Br., 20 mar 2019 o 11:33 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
> Document the compatible value for the Renesas R1EX24128ASAS0A two-wire
> serial interface EEPROM, so it can be used in DTS files without causing
> checkpatch warnings.
>
> This is a 2 KiB EEPROM.  The first 1 KiB can always be written, the
> second 1 KiB cannot be written if the write-protect line is asserted.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Document=
ation/devicetree/bindings/eeprom/at24.txt
> index 0e456bbc121399b7..22aead844d0f58d6 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at24.txt
> @@ -50,6 +50,7 @@ Required properties:
>
>                  "nxp,se97b" - the fallback is "atmel,24c02",
>                  "renesas,r1ex24002" - the fallback is "atmel,24c02"
> +                "renesas,r1ex24016" - the fallback is "atmel,24c16"
>                  "renesas,r1ex24128" - the fallback is "atmel,24c128"
>                  "rohm,br24t01" - the fallback is "atmel,24c01"
>
> --
> 2.17.1
>

Applied, thanks!

Bart
