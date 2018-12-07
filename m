MIME-Version: 1.0
Date: Fri, 7 Dec 2018 07:54:11 -0600
References: <87r2f83uww.fsf@soft-dev15.microsemi.net>
	<CACRpkdZ47tELuJR3DG-d8tsvz4ez_j6TxCYiiGT3L01CJ1LSTA@mail.gmail.com>
In-Reply-To: <CACRpkdZ47tELuJR3DG-d8tsvz4ez_j6TxCYiiGT3L01CJ1LSTA@mail.gmail.com>
Message-ID: <CAL_JsqKCY7ZwYhSXW=-vS_hYji31Ez0ZJsD_tsFUGTiBK22bAw@mail.gmail.com>
Subject: Re: [PATCH] mips: gpio: mscc_sgpio: Add DT bindings documentation
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Linus Walleij <linus.walleij@linaro.org>, lars.povlsen@microchip.com
Cc: devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 7, 2018 at 3:43 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Lars,
>
> thanks for your patch!
>
> On Mon, Nov 26, 2018 at 1:22 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> > +MSCC Serial GPIO driver
>
> Expand the acronym please, if IIUC this is
> "Microsemi Corporation (MSCC) Serial GPIO driver"
>
> > +- mscc,sgpio-frequency: The frequency at which the serial bitstream is
> > +  generated and sampled. Default: 12500000 (Hz).
>
> Uhm what is a serial bitstream in this context, I am lost.
> Please elaborate.

Is this SGPIO as in this[1]? If so, then I don't think using the GPIO
binding is appropriate here. SGPIO is pretty fixed use. There is a
bitbanged SGPIO implementation in the Calxeda SATA driver BTW.

Rob

[1] https://en.wikipedia.org/wiki/SGPIO
