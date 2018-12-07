Return-Path: <SRS0=mGha=OQ=bgdev.pl=brgl@kernel.org>
MIME-Version: 1.0
References: <20181129195858.32367-1-bunk@kernel.org>
In-Reply-To: <20181129195858.32367-1-bunk@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Dec 2018 14:59:55 +0100
Message-ID: <CAMRc=Mc8JkzfYFidaJpWUnyS1FtQKYtkRkZKVwLSfwzWRqschQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: eeprom: at24: add "atmel,24c2048"
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>, bunk@kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

czw., 29 lis 2018 o 20:59 Adrian Bunk <bunk@kernel.org> napisa=C5=82(a):
>
> Signed-off-by: Adrian Bunk <bunk@kernel.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 +
>  1 file changed, 1 insertion(+)
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
> --
> 2.11.0
>

Hi Rob,

this is a trivial patch - can we have your Ack so that I can send my
PR to Wolfram for 4.21?

Thanks in advance,
Bartosz
