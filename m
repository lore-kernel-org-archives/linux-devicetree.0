Return-Path: <SRS0=Q2N/=LS=baylibre.com=jbrunet@kernel.org>
Message-ID: <31463c95ba928534c8329c4665f92f6153b1840b.camel@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: meson8b: use the registers from
 the HHI syscon
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 04 Sep 2018 14:08:53 +0200
In-Reply-To: <153573714081.93865.1632567834341845994@swboyd.mtv.corp.google.com>
References: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
	 <20180721192846.18811-2-martin.blumenstingl@googlemail.com>
	 <20180725200755.GA24555@rob-hp-laptop>
	 <CAFBinCAdsC-VisufKu9jm0vZER6JjFq4O5WAfsMoXdQfzNFcfg@mail.gmail.com>
	 <18543f2e-0162-9201-571c-73ce8d707e50@baylibre.com>
	 <CAFBinCDLWqXCcB3b3SAOxxkq+EbQazGmMVLbVLyTjWCD4wTarA@mail.gmail.com>
	 <153573714081.93865.1632567834341845994@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 2018-08-31 at 10:39 -0700, Stephen Boyd wrote:
> > > The clock controller node was badly represented from the beginning, the
> > > HHI register zone *is* a "system control" zone with a lot of different
> > > registers controller the system, including all the EE clocks, *some* HDMI
> > > PHY settings, *some* Video DAC settings, *some* memory power control...
> > > 
> > > Thus, the clock controller *is* entirely in the HHI registers space, but
> > > the HHI register space should be used by other nodes for control some
> > > part of the SoCs. This is why we decided to model the HHI zone as a
> > > "syscon" to permit other node to have access to these registers and
> > > "simple-mfd" to expose the *big* feature of the HHI : the clock controller.
> > 
> > does our (Neil's and mine) explanation make sense to you?
> > I understand your point that a DT node can provide multiple "things".
> > this is the case on the Meson HHI region, but in addition to that the
> > HHI region contains additional bits for other IP blocks. so my
> > understanding is that using a syscon here is fine
> > 
> 
> I'm dropping this from my review queue because nobody has replied in
> many weeks. I think Rob wants people to move away from syscon so if you
> can't do that then we need good reasons. I recommend putting those
> reasons in the commit text and resending this series.

Doubling down on what Neil and Martin already reported:

When this clock controller what initially added, It was thought that the HHI
register space only contained clocks and resets, which we know how to handle in
a single driver and does not mandate a 'syscon'

Since then, we learn that HHI has more than just clocks and reset. This is the
case on every amlogic platform, which is why we already moved gxbb/gxl to
syscon. axg arrived later and used this model directly. Meson8 did not mandate
the change so far. We tried to avoid this mess as long as it was not absolutely
necessary.

This particular platform (meson8) has an ADC block with is own registers space.
The ADC comes with temperature sensor which has a few compensation values. 4 of
these compensation values are in the ADC register space, the 5th is apparently
in the HHI... HW is what it is ...

Bottom line is, HHI is a typical system controller which need to be access by
several devices. We are not particularly fond of syscon either but there are
still some situations were this is cleanest solution, AFAIK.

Jerome
