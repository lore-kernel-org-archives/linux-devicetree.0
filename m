From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: mmp2: separate LCDC peripheral clk form the display clock
Date: Thu, 21 Feb 2019 13:53:44 -0800
Message-ID: <155078602492.77512.6283122570028118811@swboyd.mtv.corp.google.com>
References: <20190121063129.552580-1-lkundrak@v3.sk> <20190121063129.552580-3-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121063129.552580-3-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Quoting Lubomir Rintel (2019-01-20 22:31:29)
> These are in fact two clocks, they shouldn't be exposed as one. One is
> required for accessing LCD controller registers (peripheral clock), while
> other (AXI clock) can be optionally used as a pixel clock source for the
> panel.
>=20
> LCDC can alternatively use different clocks than the Display 1 AXI clock
> for generating the pixel clock: the second AXI clock (fixed in this
> commit too), the HDMI PLL, or the AXI bus clock.
>=20
> They should really be controlled independently.
>=20
> Link: https://lists.freedesktop.org/archives/dri-devel/2019-January/20397=
5.html
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---

Applied to clk-next
