Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CAFBinCDLWqXCcB3b3SAOxxkq+EbQazGmMVLbVLyTjWCD4wTarA@mail.gmail.com>
References: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
 <20180721192846.18811-2-martin.blumenstingl@googlemail.com>
 <20180725200755.GA24555@rob-hp-laptop>
 <CAFBinCAdsC-VisufKu9jm0vZER6JjFq4O5WAfsMoXdQfzNFcfg@mail.gmail.com>
 <18543f2e-0162-9201-571c-73ce8d707e50@baylibre.com>
 <CAFBinCDLWqXCcB3b3SAOxxkq+EbQazGmMVLbVLyTjWCD4wTarA@mail.gmail.com>
Message-ID: <153573714081.93865.1632567834341845994@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: meson8b: use the registers from the HHI
 syscon
Date: Fri, 31 Aug 2018 10:39:00 -0700
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Martin Blumenstingl (2018-08-12 11:35:17)
> Hi Rob,
> =

> On Thu, Jul 26, 2018 at 9:32 AM Neil Armstrong <narmstrong@baylibre.com> =
wrote:
> >
> > Hi Rob, Martin,
> >
> > On 25/07/2018 23:16, Martin Blumenstingl wrote:
> > > Hi Rob,
> > >
> > > On Wed, Jul 25, 2018 at 10:07 PM Rob Herring <robh@kernel.org> wrote:
> > >>
> > >> On Sat, Jul 21, 2018 at 09:28:44PM +0200, Martin Blumenstingl wrote:
> > >>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> > >>> register region called "HHI". This register area contains more
> > >>> functionality than just a clock controller:
> > >>> - the clock controller
> > >>> - some reset controller bits
> > >>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> > >>> - HDMI controller
> > >>>
> > >>> The HHI register area may be accessed concurrently. Allow this by u=
sing
> > >>> a "system controller" as parent node.
> > >>
> > >> Why? A single node can be a provider of multiple things. Maybe the H=
DMI
> > >> should be a child since it will involve graph nodes, but the rest ca=
n be
> > >> one node. There should be numerous examples of blocks that are clock=
 and
> > >> reset controllers.
> > > I understand that a node can provide multiple "things" - currently
> > > it's a clock controller and a reset controller
> > > the HDMI controller could also be integrated in a similar way
> > >
> > > however, I do not know how to access the temperature sensor calibrati=
on data
> > > there is an ADC - one of it's channel has access to a temperature sen=
sor
> > > this ADC is located at CBUS offset 0x8680 and we already have a driver
> > > for it (meson-saradc)
> > > my problem is that the temperature sensor has to be calibrated - this
> > > is done by:
> > > - read data from efuse
> > > - write 4 bits of calibration data to some register in the ADC's regi=
ster space
> > > - write a 5th bit of calibration data to a (seemingly random) register
> > > in the HHI register space
> > > (if one of the 5 bits is not written to it's correct location then the
> > > temperature sensor reads bogus values)
> > >
> > > I am not sure how to handle this without passing the HHI region to the
> > > meson-saradc driver and letting that initialize all the temperature
> > > calibration data bits (in it's own register space as well as the HHI
> > > register space)
> > > do you have any suggestion here?
> >
> > The clock controller node was badly represented from the beginning, the
> > HHI register zone *is* a "system control" zone with a lot of different
> > registers controller the system, including all the EE clocks, *some* HD=
MI
> > PHY settings, *some* Video DAC settings, *some* memory power control...
> >
> > Thus, the clock controller *is* entirely in the HHI registers space, but
> > the HHI register space should be used by other nodes for control some
> > part of the SoCs. This is why we decided to model the HHI zone as a
> > "syscon" to permit other node to have access to these registers and
> > "simple-mfd" to expose the *big* feature of the HHI : the clock control=
ler.
> does our (Neil's and mine) explanation make sense to you?
> I understand your point that a DT node can provide multiple "things".
> this is the case on the Meson HHI region, but in addition to that the
> HHI region contains additional bits for other IP blocks. so my
> understanding is that using a syscon here is fine
> =


I'm dropping this from my review queue because nobody has replied in
many weeks. I think Rob wants people to move away from syscon so if you
can't do that then we need good reasons. I recommend putting those
reasons in the commit text and resending this series.
