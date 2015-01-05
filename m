From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7790: add CAN clocks
Date: Mon, 5 Jan 2015 14:30:55 +0100
Message-ID: <CAMuHMdWq5+KNwV4K0gfiv0RFmJzfUktJdr=AKgsHZgkfDdQsjg@mail.gmail.com>
References: <2616635.bsb7mLynhA@wasted.cogentembedded.com>
	<7045264.74zTCWbb7p@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <7045264.74zTCWbb7p@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 29, 2014 at 11:04 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The R-Car CAN controllers can derive the CAN bus clock not only from their
> peripheral clock input (clkp1) but also from the other internal clock (clkp2)
> and external clock fed on CAN_CLK pin.  Describe those clocks in the device
> tree,  along with  the USB_EXTAL clock  from which clkp2 is derived.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
