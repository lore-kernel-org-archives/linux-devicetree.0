Return-Path: <SRS0=9+2E=TA=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com> <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-13-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Apr 2019 14:58:59 +0200
Message-ID: <CAMuHMdU9URhBDbM7dP+Mq6f3kiUTdcD8+ipDvipFBciq=iUDMw@mail.gmail.com>
Subject: Re: [PATCH V5 12/13] ARM: dts: r8a77470: Add HSUSB device nodes
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 10, 2019 at 4:56 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Define the r8a77470 generic part of the HSUSB0/1 device nodes.
>
> Currently the renesas_usbhs driver doesn't handle multiple phys and we
> don't have a proper hardware to validate such driver changes.
>
> So for hsusb1 it is assumed that usbphy0 will be enabled by either
> channel0 host or device.
>
> In future, if any boards support hsusb1, we will need to add multiple phy
> support in the renesas_usbhs driver and override the board dts to enable
> the same.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
