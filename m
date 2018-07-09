MIME-Version: 1.0
Date: Mon, 9 Jul 2018 08:36:25 -0600
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
	<1530102225-6459-3-git-send-email-shubhrajyoti.datta@xilinx.com>
	<20180703224239.GA6756@rob-hp-laptop>
	<cbcc75219d9c9721341f237f31f44549@vanmierlo.com>
In-Reply-To: <cbcc75219d9c9721341f237f31f44549@vanmierlo.com>
Message-ID: <CAL_JsqJdFj+Dxy=8rt0FnXNPDyMQLLcMtM98okm4boY3w0YR_A@mail.gmail.com>
Subject: Re: [PATCH 3/4] doc: uartlite: Add binding for the driver
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: m.brock@vanmierlo.com
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>, linux-serial-owner@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 9, 2018 at 8:15 AM Maarten Brock <m.brock@vanmierlo.com> wrote:
>
> On 2018-07-04 00:42, Rob Herring wrote:
> > On Wed, Jun 27, 2018 at 05:53:44PM +0530, Shubhrajyoti Datta wrote:
> >> +
> >> +Optional properties:
> >> +- port-number          : Set Uart port number
> >
> > Nope. Use aliases.
>
> You may not like the current implementation, but that is no reason to
> deny
> this documentation of the current state.

Okay, didn't realize it was already in use.

> Personally I don't get this preference for aliases. It is a one way
> mapping
> in the wrong direction if you ask me. If e.g. you have serial0 pointing
> to
> a 16550 it will give /dev/ttyS0. This prevents you to create
> /dev/ttyUL0,
> because serial0 is already taken. Note that ttySx and ttyULx are in
> different namespaces. It would only make sense if ttyULx was an illegal
> name for a UART.

The problem here is that each UART defines its own namespace. We don't
do that for any other type of device. The problem hasn't been fixed
because doing so without breaking userspace is hard.

Rob
