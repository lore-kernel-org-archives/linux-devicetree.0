From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC] gpio: em: Use dynamic allocation of GPIOs
Date: Thu, 27 Nov 2014 15:13:42 +0100
Message-ID: <CACRpkdaFFYw8446JNWJ1AO+snixcYS=XtbaaW9soqeJ8KHueZQ@mail.gmail.com>
References: <1416234632-16166-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416234632-16166-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 3:30 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Use dynamic allocation of GPIOs instead of looking at the gpio%u alias
> in DT.
> ---
>   - Is this correct? Not having to care about the alias would simplify the
>     to-be-written DT binding documentation.
>   - Completely untested.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
