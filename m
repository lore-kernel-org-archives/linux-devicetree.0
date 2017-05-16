From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a7794: add R8A7745 support
Date: Tue, 16 May 2017 13:53:06 +0200
Message-ID: <CAMuHMdWJJghzfgZoSo15DSvOgs8dRL07R1RakcpUKevPA6_N1A@mail.gmail.com>
References: <20170428185245.428747882@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170428185245.428747882@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Apr 28, 2017 at 8:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Renesas RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
> however it doesn't have several automotive specific peripherals.
> Annotate all the items that only exist on the R-Car SoCs...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thank you!

Queuing in sh-pfc-for-v4.13 after dropping the annotations, as they are
implied by pin groups/functions

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
