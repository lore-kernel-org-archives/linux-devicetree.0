From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Wed, 8 Jan 2014 10:45:18 +0100
Message-ID: <CACRpkdYq11_fSWMzb+CCgWzjeUq2TeSja7h0UrbxB2_-yPYG9w@mail.gmail.com>
References: <1387463671-1164-1-git-send-email-b.brezillon@overkiz.com>
	<1387463671-1164-2-git-send-email-b.brezillon@overkiz.com>
	<20131219164109.GB27409@kroah.com>
	<20131219164737.GA4536@saruman.home>
	<52B32A70.1080700@overkiz.com>
	<20131219182227.GB4536@saruman.home>
	<52C14180.4080801@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <52C14180.4080801@overkiz.com>
Sender: linux-omap-owner@vger.kernel.org
To: boris brezillon <b.brezillon@overkiz.com>
Cc: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Landley <rob@landley.net>, Alexandre Courbot <gnurou@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, Ben Gamari <bgamari.foss@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pekon Gupta <pekon@ti.com>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 30, 2013 at 10:48 AM, boris brezillon
<b.brezillon@overkiz.com> wrote:
> On 19/12/2013 19:22, Felipe Balbi wrote:

>> that's quite a weird argument from Linus W, considering you _do_ have a
>> discrete mux on the board.
>
>> We have quite a few of such "crazy" scenarios here at TI and we were
>> going to send a pinctrl-gpio driver.

Hm I'm all in the blue as to what a "pinctrl-gpio driver" is ... I'm
confused :-)

>> If that's not acceptable, then I
>> suppose there is no way to boot from NAND on a board where NAND signals
>> go through a discrete mux where the select signal is a GPIO pin.

One problem I have is that I still don't really understand if this is a pin
mux, i.e. changing the connection to a certain device onto some actual
*PIN* or just some other mux muxing some certain line from one silicon
block to another.

> Linus, tell me if I'm wrong, but I think, the pinctrl-gpio is the right way
> to solve
> the at91rm9200ek board use case.

I don't know, because I don't know exactly what you mean by
"pinctrl-gpio".

Yours,
Linus Walleij
