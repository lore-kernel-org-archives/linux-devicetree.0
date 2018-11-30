From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: Add Fixed MMIO clock driver
Date: Fri, 30 Nov 2018 00:58:30 -0800
Message-ID: <154356831048.88331.9290972200429107619@swboyd.mtv.corp.google.com>
References: <D3711617-229C-4FA5-9E73-A7A3C025893B@global.cadence.com>
 <154223394933.88331.14659021245427374668@swboyd.mtv.corp.google.com>
 <CAE55F09-516A-4737-8F74-07BBA3AF5737@global.cadence.com>
 <154353057449.88331.10017415440005548379@swboyd.mtv.corp.google.com>
 <76BDCB72-CC05-41D1-93A0-6D71CBD97651@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <76BDCB72-CC05-41D1-93A0-6D71CBD97651@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janek Kotas <jank@cadence.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Janek Kotas (2018-11-30 00:52:16)
> =

>         We have a single register in a fixed location which contains =

>         the frequency of the main system clock.
>         This allows us to use the same image in emulation, FPGA
>         and simulation without any changes.
>         We usually don=E2=80=99t use a full bootloader, just a simple wra=
pper,
>         which initializes the necessary stuff and jumps to the kernel.
> =

> =

>     So the hardware team has decided to throw a frequency register in the=
re?
>     Alright! Does that fixed rate clk generate its fixed rate from some
>     other clk? I=E2=80=99m curious if this fixed rate clk has a parent so=
urce.
> =

> =

> It depends, in simulation and emulation we can just generate =

> a clock source with a given frequency.
> On FPGA it=E2=80=99s usually an external oscillator, sometimes a fixed PL=
L.
> The driver is not intended to be used in full, complex SoCs.

Ok, sounds like it isn't worth modeling this then.

> =

> =

>     It would also be good to make sure that any clks registered from this
>     driver can't be populated from regions of memory like DDR. Can you
>     confirm? I think it will fail, but it would be worth checking
> =


Please try this.

>     Yes I'd prefer a platform driver unless there's some reason it can't =
be
>     done. We may need to have both in case this needs to be populated very
>     early, but if that isn=E2=80=99t the case then just a platform driver=
 for now.
> =

> =

> I played with it a bit, and it and it looks like I need both.
> We use this clock source with some of our components, =

> and for some of them the platform driver was initialized too late.
> =


Ok. So do both then.
