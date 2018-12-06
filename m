From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add generic bindings
Date: Thu, 6 Dec 2018 11:36:59 +0100
Message-ID: <CAMuHMdX9xZgAiBeXCXxLRSJYMefsFwhH3NGC7=EYteFd6kODMQ@mail.gmail.com>
References: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111193114.24307-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On Sun, Nov 11, 2018 at 8:31 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> Add generic binding documentation for the RTC subsystem.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Thanks for your patch!

> new file mode 100644
> index 000000000000..221b7da50aca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc.txt
> @@ -0,0 +1,30 @@

> +The following properties may not be supported by all drivers. However, if a
> +driver wants to support one of the below features, it should adapt the bindings
> +below.
> +- trickle-resistor-ohms : Selected resistor for trickle charger. Should be given

Can this resistor be less than 1 ohm?
trickle-resistor-milli-ohms?

> +                          if trickle charger should be enabled
> +- trickle-diode-disable : Do not use internal trickle charger diode Should be
> +                          given if internal trickle charger diode should be
> +                          disabled
> +- wakeup-source :         Enables wake up of host system on alarm

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
