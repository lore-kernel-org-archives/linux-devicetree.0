From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6ul-kontron-n6310: Add Kontron
 i.MX6UL N6310 SoM and boards
Date: Mon, 29 Jul 2019 17:57:28 -0600
Message-ID: <CAL_JsqKzsWQoc_xYXxkWa2eUdVwvCvxH-8g-2F90-_YmfU5_fg@mail.gmail.com>
References: <20190729172007.3275-1-krzk@kernel.org> <20190729172007.3275-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729172007.3275-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Schrempf Frieder <frieder.schrempf@kontron.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 11:20 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Add support for i.MX6UL modules from Kontron Electronics GmbH (before
> acquisition: Exceet Electronics) and evalkit boards based on it:
>
> 1. N6310 SOM: i.MX6 UL System-on-Module, a 25x25 mm solderable module
>    (LGA pads and pin castellations) with 256 MB RAM, 1 MB NOR-Flash,
>    256 MB NAND and other interfaces,
> 2. N6310 S: evalkit, w/wo eMMC, without display,
> 3. N6310 S 43: evalkit with 4.3" display,
> 4. N6310 S 50: evalkit with 5.0" display.
>
> This includes device nodes for unsupported displays (Admatec
> T043C004800272T2A and T070P133T0S301).
>
> The work is based on Exceet/Kontron source code (GPLv2) with numerous
> changes:
> 1. Reorganize files,
> 2. Rename Exceet -> Kontron,
> 3. Rename models/compatibles to match newest Kontron product naming,
> 4. Fix coding style errors and adjust to device tree coding guidelines,
> 5. Fix DTC warnings,
> 6. Extend compatibles so eval boards inherit the SoM compatible,
> 7. Use defines instead of GPIO and interrupt flag values,
> 8. Use proper vendor compatible for Macronix SPI NOR,
> 9. Sort nodes alphabetically.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v2, after Fabio's review:
> 1. Add "imx6ul" compatible to board name (that's what I understood from
>    review),
> 2. Add vendor/device prefix to eeprom and document the compatible,
> 3. Use "admatecde" as vendor compatible to avoid confusion with Admatec
>    AG in Switzerland (also making LCD panels),
> 4. Use generic names for nodes,
> 5. Use IRQ_TYPE_LEVEL_LOW,
> 6. Move iomux to the end of files,
> 7. Remove regulators node (include regulators in top level),
> 8. Remove cpu clock-frequency,
> 9. Other minor fixes pointed by Fabio.
>
> Changes since v1, after Frieder's review:
> 1. Remove unneeded license notes,
> 2. Add Kontron copyright (2018),
> 3. Rename the files/models/compatibles to new naming - N6310,
> 4. Remove unneeded CPU operating points override,
> 5. Switch regulator nodes into simple children nodes without addresses
>    (so not simple bus),
> 6. Use proper vendor compatible for Macronix SPI NOR.
> ---
>  .../devicetree/bindings/arm/fsl.yaml          |   4 +
>  .../devicetree/bindings/eeprom/at25.txt       |   1 +
>  arch/arm/boot/dts/Makefile                    |   3 +
>  .../boot/dts/imx6ul-kontron-n6310-s-43.dts    | 119 +++++
>  .../boot/dts/imx6ul-kontron-n6310-s-50.dts    | 119 +++++
>  arch/arm/boot/dts/imx6ul-kontron-n6310-s.dts  | 420 ++++++++++++++++++
>  .../boot/dts/imx6ul-kontron-n6310-som.dtsi    | 134 ++++++
>  7 files changed, 800 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6310-s-43.dts
>  create mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6310-s-50.dts
>  create mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6310-s.dts
>  create mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6310-som.dtsi

Reviewed-by: Rob Herring <robh@kernel.org>
