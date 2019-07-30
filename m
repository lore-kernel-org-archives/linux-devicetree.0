From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6ul-kontron-n6310: Add Kontron
 i.MX6UL N6310 SoM and boards
Date: Tue, 30 Jul 2019 13:33:30 -0300
Message-ID: <CAOMZO5BzA7JfNhJtZjUCewGicWFy1Qemx3jV1=+27MjUnsq4kQ@mail.gmail.com>
References: <20190729172007.3275-1-krzk@kernel.org> <20190729172007.3275-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729172007.3275-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Schrempf Frieder <frieder.schrempf@kontron.de>
List-Id: devicetree@vger.kernel.org

Hi Krzysztof,

On Mon, Jul 29, 2019 at 2:20 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> --- a/Documentation/devicetree/bindings/eeprom/at25.txt
> +++ b/Documentation/devicetree/bindings/eeprom/at25.txt
> @@ -3,6 +3,7 @@ EEPROMs (SPI) compatible with Atmel at25.
>  Required properties:
>  - compatible : Should be "<vendor>,<type>", and generic value "atmel,at25".
>    Example "<vendor>,<type>" values:
> +    "anvo,anv32e61w"

This usually comes as a separate patch, but anyway:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
