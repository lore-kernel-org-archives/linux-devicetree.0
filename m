From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/2] clk: pxa: export 32kHz PLL
Date: Fri, 06 Jul 2018 13:52:06 -0700
Message-ID: <153091032623.143105.13689700534218065371@swboyd.mtv.corp.google.com>
References: <20180627194124.26366-1-robert.jarzmik@free.fr>
 <87d0w2gsa5.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87d0w2gsa5.fsf@belgarion.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Robert Jarzmik (2018-07-04 22:34:10)
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> =

> > This clock is especially used by the RTC driver, so export it so that
> > devicetree users can use it.
> >
> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> > ---
> > Since v2: fix missing parenthesis in clk-pxa25x.c and clk-pxa3xx.c
> =

> Hi Michael and Stephen,
> =

> Could you have a look please ?
> =


I'll apply patch 1, and leave patch 2 to someone else?
