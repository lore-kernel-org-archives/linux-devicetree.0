From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 4/5] ARM: dts: sun8i: a83t: Remove the watchdog clock
Date: Wed, 14 Aug 2019 12:38:51 +0800
Message-ID: <CAGb2v66mp-=T=-zDYMf6Qw-vaiR3OB5Xhxie39jeKWS+Kvmecw@mail.gmail.com>
References: <20190813124744.32614-1-mripard@kernel.org>
 <20190813124744.32614-4-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190813124744.32614-4-mripard@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 8:47 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The watchdog binding doesn't define a clock, and it indeed looks like
> there's no explicit clock feeding it.

The diagram on page 133 of the manual shows OSC24M / 750 feeding the watchdog.

Other manuals, such as the A10 one, mention:

    Watchdog clock source is OSC24M. if the OSC24M is turned off, the watchdog
    will not work.

So in fact it does use a clock signal. It's just that we've been lazy, since
the clock rate is fixed and is always on.

ChenYu

> Let's remove it from our DT.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 523be6611c50..15f8c80f69a5 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -817,7 +817,6 @@
>                         compatible = "allwinner,sun6i-a31-wdt";
>                         reg = <0x01c20ca0 0x20>;
>                         interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&osc24M>;
>                 };
>
>                 spdif: spdif@1c21000 {
> --
> 2.21.0
>
