From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/10] ARM: shmobile: marzen dts: Use generic names for
 device nodes
Date: Mon, 27 Apr 2015 15:53:01 +0200
Message-ID: <CAMuHMdWOWmE9CwqEdcW_zm34P6+SifV0j9_KyBsXKT3kJsyg1w@mail.gmail.com>
References: <1430139334-15272-1-git-send-email-geert+renesas@glider.be>
	<1430139334-15272-11-git-send-email-geert+renesas@glider.be>
	<553E3455.9070003@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <553E3455.9070003@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 27, 2015 at 3:06 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>> -       lan0_pins: lan0 {
>> +       ethernet_pins: ethernet {
>
>
>    Why change the label?

If there's only one instance, we usually name the pins like the device node.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
