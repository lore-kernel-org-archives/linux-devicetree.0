From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] arm64: defconfig: Enable USB-DMAC for R-Car
Date: Wed, 14 Feb 2018 11:04:53 +0100
Message-ID: <CAMuHMdUgYEyqjci9_2TGLWWVhKxvw73y=Qf7gV173CagS=14Ug@mail.gmail.com>
References: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1518589412-7330-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1518589412-7330-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14, 2018 at 7:23 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable the R-Car's USB-DMAC controller. This controller will be used
> by HS-USB (renesas_usbhs driver). Since the renesas_usbhs driver
> (CONFIG_USB_RENESAS_USBHS_UDC) is enabled as module, the USB-DMAC
> driver is also enabled as module.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
