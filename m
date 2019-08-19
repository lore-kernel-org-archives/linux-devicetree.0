From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: watchdog: sun4i: Add the watchdog clock
Date: Mon, 19 Aug 2019 13:56:52 -0500
Message-ID: <CAL_Jsq+wd=z3e72VUP1rkEagrrQu+Cg2Ypqo_ZmBFaZ1LOkRvw@mail.gmail.com>
References: <20190819182039.24892-1-mripard@kernel.org> <20190819182039.24892-4-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819182039.24892-4-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 1:20 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner watchdog has a clock that has been described in some DT, but
> not all of them.
>
> The binding is also completely missing that description. Let's add that
> property to be consistent.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - New patch
> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
