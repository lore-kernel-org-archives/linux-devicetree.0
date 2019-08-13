From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: sun4i: Add the watchdog interrupts
Date: Tue, 13 Aug 2019 15:32:31 -0600
Message-ID: <CAL_JsqL5v1nd85FuuU1aHDDvojnWqs-4aDZAUDm0iCR0akhF9g@mail.gmail.com>
References: <20190813124744.32614-1-mripard@kernel.org> <20190813124744.32614-3-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124744.32614-3-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 6:47 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner watchdog has an interrupt, either shared or dedicated
> depending on the SoC, that has been described in some DT, but not all of
> them.
>
> The binding is also completely missing that description. Let's add that
> property to be consistent.

I'm fine with fixing errors like this in the conversion patch.

> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)

Either way:

Reviewed-by: Rob Herring <robh@kernel.org>
