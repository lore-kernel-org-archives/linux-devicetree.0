From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH] pinctrl-mcp23s08: Fix property-name in dt-example
Date: Thu, 29 Aug 2019 16:52:24 +0200
Message-ID: <eaa0f631-bf71-4ca9-b3ff-06d5d43cc58d@cesnet.cz>
References: <20190828195609.4176-1-peter.vernia@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828195609.4176-1-peter.vernia@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Vernia <peter.vernia@gmail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, poeschel@lemonage.de
List-Id: devicetree@vger.kernel.org

On st=C5=99eda 28. srpna 2019 21:56:09 CEST, Peter Vernia wrote:
> The device-tree properties documentation-file specifies the property
> "microchip,spi-present-mask" as required for MCP23SXX chips. However,
> the device-tree-source example below it uses only "spi-present-mask".
> Without "microchip," on the front, the driver will print "missing
> spi-present-mask" when it initializes.
>
> Update the device-tree example with the correct property-name.
>
> Signed-off-by: Peter Vernia <peter.vernia@gmail.com>

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt=20
> b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> index 625a22e2f211..8b94aa8f5971 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> @@ -82,7 +82,7 @@ gpiom1: gpio@0 {
>          compatible =3D "microchip,mcp23s17";
>          gpio-controller;
>          #gpio-cells =3D <2>;
> -        spi-present-mask =3D <0x01>;
> +        microchip,spi-present-mask =3D <0x01>;
>          reg =3D <0>;
>          spi-max-frequency =3D <1000000>;
>  };
