From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: ulcb-kf: enable USB2 PHY of channel 0
Date: Wed, 15 Nov 2017 17:36:21 +0100
Message-ID: <CAMuHMdWuHV38=XupXxH1TXFONpsjmY=3zN7iaKDT54xBd_DSGw@mail.gmail.com>
References: <1510143698-17306-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1510143698-17306-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, Nov 8, 2017 at 1:21 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports USB2 PHY channel #0 on ULCB Kingfisher board
>
> The dedicated USB0_PWEN pin is used to control CN13 VBUS source from U43
> power supply.
> MAX3355 can also provide VBUS, hence it should be disabled via OTG_OFFVBUSn
> node coming from gpio expander TCA9539.
> Set MAX3355 enabled using OTG_EXTLPn node to be able to read OTG ID of CN13.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
> Changes in version 2:
> - added gpio hogs for MAX3355 VBUS and SHDN

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
