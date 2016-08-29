From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] ARM: dts: wheat: add Ethernet support
Date: Mon, 29 Aug 2016 10:05:19 +0200
Message-ID: <CAMuHMdU6zu2J8dBfC7EySCtk79uSi=NmaOXDHpZf+pAp48HhLw@mail.gmail.com>
References: <3665116.9BjHTnhfR3@wasted.cogentembedded.com> <6321460.7sCGaKUd5m@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <6321460.7sCGaKUd5m@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 10:23 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> R8A7792  SoC  doesn't have the  EtherMAC core, so SMSC LAN89218 Ethernet
> chip was used instead on the Wheat debug board; this chip is compatible
> with SMSC LAN9115 for which  there's a (device  tree aware)  driver.
> Describe the chip  in the Wheat device tree unconditionally (the driver
> should fail the probe if the debug board isn't connected); enable DHCP and
> NFS root in the command line for the kernel boot...
>
> Based  on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov@cogentembedded.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
(limited to review that can be done without board documentation)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
