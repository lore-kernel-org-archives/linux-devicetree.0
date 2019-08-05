From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6ul-kontron-n6310: Add Kontron
 i.MX6UL N6310 SoM and boards
Date: Mon, 5 Aug 2019 11:11:31 +0200
Message-ID: <CAJKOXPc347ffPmwjtNWBwurEOip+0-8xoxoAJS6cw6JP4b4w-w@mail.gmail.com>
References: <20190729172007.3275-1-krzk@kernel.org> <20190729172007.3275-2-krzk@kernel.org>
 <20190803154724.GS8870@X250.getinternet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190803154724.GS8870@X250.getinternet.no>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Schrempf Frieder <frieder.schrempf@kontron.de>
List-Id: devicetree@vger.kernel.org

On Sat, 3 Aug 2019 at 17:47, Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Mon, Jul 29, 2019 at 07:20:07PM +0200, Krzysztof Kozlowski wrote:
> > Add support for i.MX6UL modules from Kontron Electronics GmbH (before
> > acquisition: Exceet Electronics) and evalkit boards based on it:
> >
> > 1. N6310 SOM: i.MX6 UL System-on-Module, a 25x25 mm solderable module
> >    (LGA pads and pin castellations) with 256 MB RAM, 1 MB NOR-Flash,
> >    256 MB NAND and other interfaces,
> > 2. N6310 S: evalkit, w/wo eMMC, without display,
> > 3. N6310 S 43: evalkit with 4.3" display,
> > 4. N6310 S 50: evalkit with 5.0" display.
> >
> > This includes device nodes for unsupported displays (Admatec
> > T043C004800272T2A and T070P133T0S301).
>
> Do not include unsupported devices.
>
> >
> > The work is based on Exceet/Kontron source code (GPLv2) with numerous
> > changes:
> > 1. Reorganize files,
> > 2. Rename Exceet -> Kontron,
> > 3. Rename models/compatibles to match newest Kontron product naming,
> > 4. Fix coding style errors and adjust to device tree coding guidelines,
> > 5. Fix DTC warnings,
> > 6. Extend compatibles so eval boards inherit the SoM compatible,
> > 7. Use defines instead of GPIO and interrupt flag values,
> > 8. Use proper vendor compatible for Macronix SPI NOR,
> > 9. Sort nodes alphabetically.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v2, after Fabio's review:
> > 1. Add "imx6ul" compatible to board name (that's what I understood from
> >    review),
> > 2. Add vendor/device prefix to eeprom and document the compatible,
> > 3. Use "admatecde" as vendor compatible to avoid confusion with Admatec
> >    AG in Switzerland (also making LCD panels),
> > 4. Use generic names for nodes,
> > 5. Use IRQ_TYPE_LEVEL_LOW,
> > 6. Move iomux to the end of files,
> > 7. Remove regulators node (include regulators in top level),
> > 8. Remove cpu clock-frequency,
> > 9. Other minor fixes pointed by Fabio.
> >
> > Changes since v1, after Frieder's review:
> > 1. Remove unneeded license notes,
> > 2. Add Kontron copyright (2018),
> > 3. Rename the files/models/compatibles to new naming - N6310,
> > 4. Remove unneeded CPU operating points override,
> > 5. Switch regulator nodes into simple children nodes without addresses
> >    (so not simple bus),
> > 6. Use proper vendor compatible for Macronix SPI NOR.
> > ---
> >  .../devicetree/bindings/arm/fsl.yaml          |   4 +
> >  .../devicetree/bindings/eeprom/at25.txt       |   1 +
>
> Please make them two separate patches.

You mean split at25 change to separate patch? or split both - at25 and
fsl bindings - to separate patches?

Best regards,
Krzysztof
