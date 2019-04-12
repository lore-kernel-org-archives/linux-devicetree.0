From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 1/3] ARM: dts: da850: add cpu node and operating points
 to DT
Date: Fri, 12 Apr 2019 14:11:21 +0200
Message-ID: <CAMRc=McGwGh9RKhxxCDnz3aMG_EVjjXzN+pmMZVtE7aChdU3jw@mail.gmail.com>
References: <20190408075924.2284-1-brgl@bgdev.pl> <20190408075924.2284-2-brgl@bgdev.pl>
 <5f72a26b-428a-c50e-cb6a-7c888ea22329@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5f72a26b-428a-c50e-cb6a-7c888ea22329@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Adam Ford <aford173@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

pt., 12 kwi 2019 o 13:26 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> Hi Bartosz,
>
> On 08/04/19 1:29 PM, Bartosz Golaszewski wrote:
> > From: David Lechner <david@lechnology.com>
> >
> > This adds a cpu node and operating points to the common da850.dtsi file=
.
> >
> > Additionally, a regulator is added to the LEGO EV3 board along with
> > some board-specific CPU configuration.
> >
> > Regulators need to be hooked up on other boards to get them working.
> >
> > Signed-off-by: David Lechner <david@lechnology.com>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I remember you mentioning about some problems using OCHI and cpufreq
> together. Are those resolved now? CPU PLL on DA850 can affect other
> peripheral clock frequencies too. So enabling it should really be a
> per-board decision.
>

The problems are still there. I've never been able to find the
culprit, but it also occurs on TI BSP in the same way (a couple
cpufreq transitions will make the controller unresponsive).

> No problems with adding OPPs to da850.dtsi, but which of those are
> enabled on any board should be after some thorough testing and analysis.
>
> Because of that, I think its also better to split da850.dtsi from board
> specific changes in this patch.
>

Sure, I'll split it.

> > +     opp_table: opp-table {
> > +             compatible =3D "operating-points-v2";
> > +
> > +             opp_100: opp100-100000000 {
> > +                     opp-hz =3D /bits/ 64 <100000000>;
> > +                     opp-microvolt =3D <1000000 950000 1050000>;
> > +             };
> > +
> > +             opp_200: opp110-200000000 {
> > +                     opp-hz =3D /bits/ 64 <200000000>;
> > +                     opp-microvolt =3D <1100000 1050000 1160000>;
> > +             };
> > +
> > +             opp_300: opp120-300000000 {
> > +                     opp-hz =3D /bits/ 64 <300000000>;
> > +                     opp-microvolt =3D <1200000 1140000 1320000>;
> > +             };
> > +
> > +             /*
> > +              * Original silicon was 300MHz max, so higher frequencies
> > +              * need to be enabled on a per-board basis if the chip is
> > +              * capable.
> > +              */
> > +
> > +             opp_375: opp120-375000000 {
> > +                     status =3D "disabled";
> > +                     opp-hz =3D /bits/ 64 <375000000>;
> > +                     opp-microvolt =3D <1200000 1140000 1320000>;
> > +             };
> > +
> > +             opp_415: opp130-415000000 {
> > +                     status =3D "disabled";
> > +                     opp-hz =3D /bits/ 64 <415000000>;
> > +                     opp-microvolt =3D <1300000 1250000 1350000>;
> > +             };
> > +
> > +             opp_456: opp130-456000000 {
> > +                     status =3D "disabled";
> > +                     opp-hz =3D /bits/ 64 <456000000>;
> > +                     opp-microvolt =3D <1300000 1250000 1350000>;
> > +             };
>
> Here, lets stick to OPPs defined in OMAP-L138 data manual (irrespective
> of what existing board code has). Page 93 of
> http://www.ti.com/lit/ds/symlink/omap-l138.pdf
>

Will do in the next version.

Bart

> Thanks,
> Sekhar
