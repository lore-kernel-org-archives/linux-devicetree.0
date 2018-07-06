From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/2] clk: pxa: export 32kHz PLL
Date: Fri, 06 Jul 2018 13:53:53 -0700
Message-ID: <153091043355.143105.4051882411997045585@swboyd.mtv.corp.google.com>
References: <20180627194124.26366-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627194124.26366-1-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Robert Jarzmik (2018-06-27 12:41:23)
> This clock is especially used by the RTC driver, so export it so that
> devicetree users can use it.
> =

> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-next
