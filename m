From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
Date: Thu, 26 Sep 2019 20:34:28 +0200
Message-ID: <CAFBinCAv=_3vWSanQg1S5EXBVzdgTu2Ub3Hyad_ajF3v6PcbGQ@mail.gmail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <1jzhivs6n6.fsf@starbuckisacylon.baylibre.com> <CAFBinCA0NaCJEDfNEg+LRfW3wxfNFGbXmGS+z7D5792TsupVAA@mail.gmail.com>
 <7h7e5wt2m1.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7h7e5wt2m1.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Thu, Sep 26, 2019 at 12:47 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > Hi Jerome,
> >
> > On Mon, Sep 23, 2019 at 11:29 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >> On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> >>
> >> > So far the HHI clock controller has been providing the XTAL clock on
> >> > Amlogic Meson8/Meson8b/Meson8m2 SoCs.
> >> > This is not correct because the XTAL is actually a crystal on the
> >> > boards and the SoC has a dedicated input for it.
> >> >
> >> > This updates the dt-bindings of the HHI clock controller and defines
> >> > a fixed-clock in meson.dtsi (along with switching everything over to
> >> > use this clock).
> >> > The clock driver needs three updates to use this:
> >> > - patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
> >> >   the explicit reference to CLKID_XTAL while at the same time making
> >> >   the code much easier (thanks to Neil for providing this new method
> >> >   as part of the G12A CPU clock bringup!)
> >> > - patch #3 ensures that the clock driver doesn't rely on it's internal
> >> >   XTAL clock while not losing support for older .dtbs that don't have
> >> >   the XTAL clock input yet
> >> > - with patch #4 the clock controller's own XTAL clock is not registered
> >> >   anymore when a clock input is provided via OF
> >> >
> >> > This series is a functional no-op. It's main goal is to better represent
> >> > how the actual hardware looks like.
> >>
> >> I'm a bit unsure about this series.
> >>
> >> On one hand, I totally agree with you ... having the xtal in DT is the
> >> right way to do it ... when done from the start
> > yep
> >
> >> On the other hand, things have been this way for years, they are working
> >> and going for xtal in DT does not solve any pending issue. Doing this
> >> means adding complexity in the driver to support both methods. It is
> >> also quite a significant change in DT :/
> > my two main motivations were:
> > - keeping the 32-bit SoCs as similar as possible to the 64-bit ones in
> > terms of "how are the [clock] drivers implemented"
> > - with the DDR clock controller the .dts looked weird: &ddr_clkc took
> > CLKID_XTAL from &clkc as input and &clkc took DDR_CLKID_DDR_PLL as
> > input from &ddr_clkc
> >
> > RE complexity in the driver to support both:
> > I still have a cleanup of the meson8b.c init code on my TODO-list
> > because we're still supporting .dtbs without parent syscon
> > my plan is to drop that code-path along with the newly added fallback
> > for "skip CLKID_XTAL" (assuming this is accepted) together for v5.6 or
> > v5.7
>
> TBH, I'm big(ish) "functional no-op" changes like this are not things I
> get super exicted about, especially for SoCs that have been working well
> for awhile, and are do not have a large (upstream) userbase.
>
> OTOH, since Martin is doing most of the heavy lifting for keeping this
> platform working upstream, I'm happy to take the changes, as long as
> Martin is willing to deal with any fallout.
I agree: it has to work and if it doesn't then I will have to fix it so it is
so I will be taking care of any fallout


Martin
