From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6ul-kontron-ul2: Add Exceet/Kontron iMX6-UL2 SoM
Date: Wed, 17 Jul 2019 10:17:54 +0200
Message-ID: <CAJKOXPcLdfo6XCc--HneYjCHOYKdKgWDBDSVjxQBR+pc+1mcfg@mail.gmail.com>
References: <20190712141242.4915-1-krzk@kernel.org> <cde6f251-4b15-a4f0-57ed-ca2ed014b511@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cde6f251-4b15-a4f0-57ed-ca2ed014b511@kontron.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Jul 2019 at 17:38, Schrempf Frieder
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
>
> We will use a new naming scheme for these and other boards. The new
> names would be:
>
> 1. Kontron N6310 SOM    (i.MX6UL SoM with 256MB RAM/NAND)
> 2. Kontron N6310 S      (Evalkit with SoM)
> 3. Kontron N6310 S 43   (Evalkit with SoM and 4.3" display)
> 4. Kontron N6310 S 50   (Evalkit with SoM and 5.0" display)

OK (and OK for all other comments which I will skip below).

(...)

> > +
> > +     memory@80000000 {
> > +             reg = <0x80000000 0x10000000>;
> > +     };
> > +};
> > +
> > +&cpu0 {
> > +     clock-frequency = <528000000>;
> > +     operating-points = <
> > +             /* kHz  uV */
> > +             528000  1175000
> > +             396000  1025000
> > +             198000  950000
> > +     >;
> > +     fsl,soc-operating-points = <
> > +             /* KHz  uV */
> > +             528000  1175000
> > +             396000  1175000
> > +             198000  1175000
> > +     >;
> > +};
>
> What's the reason behind overwriting the operating-points and setting
> clock-frequency? Doesn't imx6q-cpufreq.c already read the speed grades
> from the hardware and adjust the operating-points accordingly?

Good point. From the driver point of view overwriting of opps is not
needed. As you said, the driver will adjust the speed to the reported
grade. This could have meaning for the completeness of hardware
description however I see that there are no even bindings for CPU and
other boards do not overwrite it. I'll skip it then.

(...)

> > +
> > +     regulators {
> > +             compatible = "simple-bus";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
>
> We copied this from some other devicetree and I'm not sure in what case
> we should really group the regulators in a simple-bus, or what's the
> reason behind this. But others do it like this, so it's probably not so
> wrong.

Either simple-bus with regulator@address or unique regulator node
names (regulator-1, no unit address). Both are popular but I think in
recent submissions and comments Rob Herring was proposing the second
option - unique regulator names without addresses. I can use such
approach (unless DTC complains).

Thanks for review and feedback!

Best regards,
Krzysztof
