Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1556188862-22546-3-git-send-email-sugaya.taichi@socionext.com>
References: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com> <1556188862-22546-3-git-send-email-sugaya.taichi@socionext.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/3] clock: milbeaut: Add Milbeaut M10V clock controller
Message-ID: <155623587387.15276.14839487511493210076@swboyd.mtv.corp.google.com>
Date: Thu, 25 Apr 2019 16:44:33 -0700
To: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Sugaya Taichi <sugaya.taichi@socionext.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Sugaya Taichi (2019-04-25 03:41:01)
> The M10V of the Milbeaut SoCs has an on-chip controller that derive
> mostly clocks from a single external clock, using PLLs, dividers,
> multiplexers and gates. Since the PLLs have already been started and
> will not stop / restart, they are fixed factor. The gates will be added
> in later patch (all of the gates are off state now).
>=20
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---

Applied to clk-next
