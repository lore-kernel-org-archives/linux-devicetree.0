From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: Add Fixed MMIO clock driver
Date: Fri, 30 Nov 2018 10:56:18 -0800
Message-ID: <154360417873.88331.512675786310551936@swboyd.mtv.corp.google.com>
References: <D3711617-229C-4FA5-9E73-A7A3C025893B@global.cadence.com>
 <154223394933.88331.14659021245427374668@swboyd.mtv.corp.google.com>
 <CAE55F09-516A-4737-8F74-07BBA3AF5737@global.cadence.com>
 <154353057449.88331.10017415440005548379@swboyd.mtv.corp.google.com>
 <76BDCB72-CC05-41D1-93A0-6D71CBD97651@global.cadence.com>
 <154356831048.88331.9290972200429107619@swboyd.mtv.corp.google.com>
 <63A29785-D1AC-4B7C-952E-3A2E5799A21D@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63A29785-D1AC-4B7C-952E-3A2E5799A21D@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Janek Kotas <jank@cadence.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Janek Kotas (2018-11-30 01:57:09)
> =

> I tried it. io_remap doesn=E2=80=99t allow RAM to be mapped,
> even if it=E2=80=99s marked as a reserved memory.
> I got an error, the address couldn=E2=80=99t be mapped.
> =

> ARM64=E2=80=99s memory management has an explicit check for this here:
> https://elixir.bootlin.com/linux/latest/source/arch/arm64/mm/ioremap.c#L55
> =


Ok. Thanks!
