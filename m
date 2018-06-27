From: Rob Herring <rob.herring@linaro.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: pxa: fix the rtc controller
Date: Wed, 27 Jun 2018 15:40:23 -0600
Message-ID: <CABGGisxeC=1Lc+ZKpR=Uzy75BQ8k=Tah4cYmZDnc_mdJWiCD1w@mail.gmail.com>
References: <20180627194124.26366-1-robert.jarzmik@free.fr> <20180627194124.26366-2-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627194124.26366-2-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: robert.jarzmik@free.fr
Cc: daniel@zonque.org, haojian.zhuang@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2018 at 1:41 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> The RTC controller is fed by an external fixed 32kHz clock. Yet the
> driver wants to acquire this clock, even though it doesn't make any use
> of it, ie. doesn't get the rate to make calculation.
>
> Therefore, use the exported 32.768kHz clock in the PXA clock tree to
> make the driver happy and working.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: change the dummy clock by the actual 32.768kHz
> Since v3: remove spurious bracket
> ---
>  arch/arm/boot/dts/pxa25x.dtsi | 4 ++++
>  arch/arm/boot/dts/pxa27x.dtsi | 4 ++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
