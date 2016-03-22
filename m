From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Tue, 22 Mar 2016 11:56:51 +0100
Message-ID: <CAMuHMdWTteucxUgBU=d6=bckaZrn0vmr8LYW08UdULEtQYFzpg@mail.gmail.com>
References: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
	<CAMuHMdW5Owzv06wnV34W3cYp=ibrONcfBVV6WST5VyvQ1ENjsA@mail.gmail.com>
	<20160322104207.GA2842@marie-Aspire-5600>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160322104207.GA2842@marie-Aspire-5600>
Sender: linux-gpio-owner@vger.kernel.org
To: nicolas saenz julienne <nicolassaenzj@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On Tue, Mar 22, 2016 at 11:42 AM, nicolas saenz julienne
<nicolassaenzj@gmail.com> wrote:
>> Why did you choose the "lvc" variant?
> Well to be honest the HW people did and it's all I could test with.  I don't
> know much about these naming schemes, apart from the intuition it has to do
> with frequency and line levels.
>
>> Ideally, you want to put the oldest "manuf,74x594" variant here.
> What do you mean by oldest? What would you suggest? it's funny because the chip
> is going to be used on a new product that is meant to be produced for years.

For DT bindings, it doesn't matter who manufactured the part, or which
technology was used (TTL, HC, LVC, ...).

Logically, the shiny new parts are compatible with the old ones, from as early
as the 1960s.

Especially for standard logic glue, where you can source parts from several
manufacturers, and which are available in many different technologies, it
doesn't make much sense to have all combinations in the DT bindings.

https://en.wikipedia.org/wiki/7400_series

Now, which one to pick?
Given the precedence set by the existing compatible value "fairchild,74hc595",
perhaps the most logical one to add is "fairchild,74hc594"?

Or can we just drop the manufacturer?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
