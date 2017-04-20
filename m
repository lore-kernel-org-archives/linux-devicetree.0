From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] iio: adc: Drop if clock from Renesas GyroADC bindings
Date: Thu, 20 Apr 2017 19:30:15 +0200
Message-ID: <CAMuHMdXFMOZ0c4ptVCUpTK0u7aHfUx1=HfvSozgnbFjJDRorxA@mail.gmail.com>
References: <20170420154216.32709-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170420154216.32709-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 5:42 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> The "if" interface clock speed is actually derived from the "fck"
> block clock, as in the hardware they are the same clock. Drop the
> incorrect second "if" clock and retain only the "fck" clock.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
