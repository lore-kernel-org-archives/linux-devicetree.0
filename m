From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 29/30] ARM: dts: r8a7794: Reference both DMA controllers
 in SDHI nodes
Date: Thu, 10 Mar 2016 13:09:41 +0100
Message-ID: <CAMuHMdVEQZXc=nqn7w5YbNOWGX8XevSLm0pRbQ5HF5a+dPqYRQ@mail.gmail.com>
References: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
	<1457609782-24108-30-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1457609782-24108-30-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 10, 2016 at 12:36 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> R-Car Gen2 have two DMA controllers, which are equivalent. Add
> references to both dmac0 and dmac1 so the driver can fallback to the
> later if the first one is unavailable.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
