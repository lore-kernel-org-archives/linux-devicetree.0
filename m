From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6ul-kontron-ul2: Add Exceet/Kontron iMX6-UL2 SoM
Date: Tue, 16 Jul 2019 09:50:34 +0200
Message-ID: <CAJKOXPdq5e1OPmxamicAVf4ZDoSAuD=yvfOgZD04aQD9PtnCEQ@mail.gmail.com>
References: <20190712141242.4915-1-krzk@kernel.org> <5cbd8bb2-6ecb-7e55-1580-e580e2c340dd@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5cbd8bb2-6ecb-7e55-1580-e580e2c340dd@kontron.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Jul 2019 at 17:21, Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hi Krzysztof,
>
> On 12.07.19 16:12, Krzysztof Kozlowski wrote:
> > Add support for iMX6-UL2 modules from Kontron Electronics GmbH (before
> > acquisition: Exceet Electronics) and evalkit boards based on it:
> >
> > 1. i.MX6 UL System-on-Module, a 25x25 mm solderable module (LGA pads and
> >     pin castellations) with 256 MB RAM, 1 MB NOR-Flash, 256 MB NAND and
> >     other interfaces,
> > 1. UL2 evalkit, w/wo eMMC, without display,
> > 2. UL2 evalkit with 4.3" display,
> > 3. UL2 evalkit with 5.0" display.
> >
> > This includes device nodes for unsupported displays (Admatec
> > T043C004800272T2A and T070P133T0S301).
> >
> > The work is based on Exceet source code (GPLv2) with numerous changes:
> > 1. Reorganize files,
> > 2. Rename Exceet -> Kontron,
> > 3. Fix coding style errors,
> > 4. Fix DTC warnings,
> > 5. Extend compatibles so eval boards inherit the SoM compatible,
> > 6. Use defines instead of GPIO flag values,
> > 7. Adjust operating points of CPU0,
> > 8. Sort nodes alphabetically.
> >
> > In downstream BSP the Exceet name still appears in multiple places
> > therefore I left it in the model names.
>
> First, thanks for your work. I planned to upstream these boards myself
> after the FSL QSPI spi-mem driver was merged in 5.1, but didn't have
> time to finalize and send the patches.
>
> Meanwhile we came up with a new naming scheme for our boards, that
> hasn't been implemented yet. But I would like to take this chance to
> implement the new scheme.

Sure, I see no problem in using different names, matching downstream
kernel. Just point me to proper names.

> Also there are some more flavors of the SoM (with i.MX6ULL instead of
> i.MX6UL, with 512MiB instead of 256MiB flash/RAM), that I would like to
> add and for which common parts of the SoM dtsi would need to be factored
> out to a separate file.

I have only this one particular flavor so I would prefer to upstream
only this one. I do not know all the possible combinations or for
example the most interesting ones. I think after this patchset we can
refactor the DTS whenever its needed - split common parts, add new
files.

> I would prefer to at least apply the naming changes before merging. The
> additional board flavors could be added before merging or I could send
> them as follow-up patches. What do you think?

Let's change the naming and add new flavors as follow ups?

Best regards,
Krzysztof
