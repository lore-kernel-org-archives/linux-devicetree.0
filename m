Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <CABb+yY3ubLb9+VPBWHAEr4U=2WO5M1X6RL-7BTShHBELh8uXoA@mail.gmail.com>
References: <1516358213-4400-1-git-send-email-jassisinghbrar@gmail.com>
 <1516358251-4523-1-git-send-email-jassisinghbrar@gmail.com>
 <CAKv+Gu_Bzs8iW4xiA-N47Q_58QQcmt=VrNK2fe3URoRMcFswTw@mail.gmail.com>
 <CABb+yY3ubLb9+VPBWHAEr4U=2WO5M1X6RL-7BTShHBELh8uXoA@mail.gmail.com>
Message-ID: <152310546992.180276.3304279877657041698@swboyd.mtv.corp.google.com>
Subject: Re: [PATCHv3 2/3] spi: Add spi driver for Socionext Synquacer platform
Date: Sat, 07 Apr 2018 05:51:09 -0700
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-spi@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, tpiepho@impinj.com, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Jassi Brar (2018-02-08 18:43:49)
> On Fri, Feb 9, 2018 at 2:12 AM, Ard Biesheuvel
> <ard.biesheuvel@linaro.org> wrote:
> > On 19 January 2018 at 10:37,  <jassisinghbrar@gmail.com> wrote:
> >
> > It looks like the call
> >
> > clk_prepare_enable(sspi->clk[IPCLK]);
> >
> > is passing the ERR() value of devm_clk_get() rather than NULL. Adding
> > 'if (!IS_ERR())' fixes it for me.
> >
> I had thought the clk_xyz() calls would immediately return if invalid
> clock was provided, but I see they return only if the passed clock is
> a NULL pointer, and not when its ERR_PTR. I think a better option
> would be to make it NULL if devm_clk_get returns ERR_PTR.
> =

> Stephen, does it make sense to also catch the ERR_PTR in
> clk_enable/prepare?   Like clk_disable, clk_unprepare already does.
> =


No? Check return values instead.

The kernel did its job here and blew up with a nice stacktrace instead
of a one line error message or requiring us to add WARN_ON() to the clk
framework. We have the IS_ERR_OR_NULL checks in the disable and
unprepare paths to save some lines on error paths when clks are optional
and clk_get() returns an error pointer. We could change those checks if
we decide to introduce a clk_get_optional() API or something like that
which returns NULL pointers, but so far we haven't done that. Feel free
to propose such an API if you need it.
