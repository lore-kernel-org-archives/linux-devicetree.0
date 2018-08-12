Return-Path: <SRS0=Ovq8=K3=googlemail.com=martin.blumenstingl@kernel.org>
MIME-Version: 1.0
References: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
 <20180721192846.18811-2-martin.blumenstingl@googlemail.com>
 <20180725200755.GA24555@rob-hp-laptop> <CAFBinCAdsC-VisufKu9jm0vZER6JjFq4O5WAfsMoXdQfzNFcfg@mail.gmail.com>
 <18543f2e-0162-9201-571c-73ce8d707e50@baylibre.com>
In-Reply-To: <18543f2e-0162-9201-571c-73ce8d707e50@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Aug 2018 20:35:17 +0200
Message-ID: <CAFBinCDLWqXCcB3b3SAOxxkq+EbQazGmMVLbVLyTjWCD4wTarA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: meson8b: use the registers from
 the HHI syscon
Content-Type: text/plain; charset="UTF-8"
To: robh@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Thu, Jul 26, 2018 at 9:32 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Rob, Martin,
>
> On 25/07/2018 23:16, Martin Blumenstingl wrote:
> > Hi Rob,
> >
> > On Wed, Jul 25, 2018 at 10:07 PM Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Sat, Jul 21, 2018 at 09:28:44PM +0200, Martin Blumenstingl wrote:
> >>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> >>> register region called "HHI". This register area contains more
> >>> functionality than just a clock controller:
> >>> - the clock controller
> >>> - some reset controller bits
> >>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> >>> - HDMI controller
> >>>
> >>> The HHI register area may be accessed concurrently. Allow this by using
> >>> a "system controller" as parent node.
> >>
> >> Why? A single node can be a provider of multiple things. Maybe the HDMI
> >> should be a child since it will involve graph nodes, but the rest can be
> >> one node. There should be numerous examples of blocks that are clock and
> >> reset controllers.
> > I understand that a node can provide multiple "things" - currently
> > it's a clock controller and a reset controller
> > the HDMI controller could also be integrated in a similar way
> >
> > however, I do not know how to access the temperature sensor calibration data
> > there is an ADC - one of it's channel has access to a temperature sensor
> > this ADC is located at CBUS offset 0x8680 and we already have a driver
> > for it (meson-saradc)
> > my problem is that the temperature sensor has to be calibrated - this
> > is done by:
> > - read data from efuse
> > - write 4 bits of calibration data to some register in the ADC's register space
> > - write a 5th bit of calibration data to a (seemingly random) register
> > in the HHI register space
> > (if one of the 5 bits is not written to it's correct location then the
> > temperature sensor reads bogus values)
> >
> > I am not sure how to handle this without passing the HHI region to the
> > meson-saradc driver and letting that initialize all the temperature
> > calibration data bits (in it's own register space as well as the HHI
> > register space)
> > do you have any suggestion here?
>
> The clock controller node was badly represented from the beginning, the
> HHI register zone *is* a "system control" zone with a lot of different
> registers controller the system, including all the EE clocks, *some* HDMI
> PHY settings, *some* Video DAC settings, *some* memory power control...
>
> Thus, the clock controller *is* entirely in the HHI registers space, but
> the HHI register space should be used by other nodes for control some
> part of the SoCs. This is why we decided to model the HHI zone as a
> "syscon" to permit other node to have access to these registers and
> "simple-mfd" to expose the *big* feature of the HHI : the clock controller.
does our (Neil's and mine) explanation make sense to you?
I understand your point that a DT node can provide multiple "things".
this is the case on the Meson HHI region, but in addition to that the
HHI region contains additional bits for other IP blocks. so my
understanding is that using a syscon here is fine

> We are migrating the Meson8 because we already migrated the GX and because the
> AXG family was pushed like this (and acked like this), so it's common sense
> to align the 3 families because they share the same characteristics here.
>
> Neil
>
> >
> >>>
> >>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >>> ---
> >>>  .../bindings/clock/amlogic,meson8b-clkc.txt         | 13 +++++--------
> >>>  1 file changed, 5 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> >>> index b455c5aa9139..38fb979210d3 100644
> >>> --- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> >>> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
> >>> @@ -9,15 +9,13 @@ Required Properties:
> >>>       - "amlogic,meson8-clkc" for Meson8 (S802) SoCs
> >>>       - "amlogic,meson8b-clkc" for Meson8 (S805) SoCs
> >>>       - "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
> >>> -- reg: it must be composed by two tuples:
> >>> -     0) physical base address of the xtal register and length of memory
> >>> -        mapped region.
> >>> -     1) physical base address of the clock controller and length of memory
> >>> -        mapped region.
> >>> -
> >>>  - #clock-cells: should be 1.
> >>>  - #reset-cells: should be 1.
> >>>
> >>> +Parent node should have the following properties :
> >>> +- compatible: "syscon", "simple-mfd"
> >>
> >> These 2 compatibles alone are not valid.
> > so I should add (for example) "amlogic,meson8b-hhi-sysctrl" as first compatible?
> > so the result would be: compatible = "amlogic,meson8b-hhi-sysctrl",
> > "syscon", "simple-mfd";
>
> yes, we used a specific compatible for GX and AXG like this.
>
> Question, what should be the order between "syscon" and "simple-mfd" ?
for consistency I will go with whatever the GX and AXG dt-bindings use


Regards
Martin
