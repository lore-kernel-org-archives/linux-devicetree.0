From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/3] ARM: dts: r8a7791: Correct critical CPU temperature
Date: Thu, 14 Dec 2017 11:24:30 +0100
Message-ID: <CAMuHMdWwL4xMPRi3wJoBNdjc_UCjVYjqLP=Db-15mqM8FUAo4w@mail.gmail.com>
References: <1513242521-11236-1-git-send-email-chris.paterson2@renesas.com> <1513242521-11236-3-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513242521-11236-3-git-send-email-chris.paterson2@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 14, 2017 at 10:08 AM, Chris Paterson
<chris.paterson2@renesas.com> wrote:
> The R-Car M2W hardware manual states that Tc =3D =E2=80=9340=C2=B0C to +1=
05=C2=B0C. The

M2-W

> thermal sensor has an accuracy of =C2=B15=C2=B0C and there can be a tempe=
rature
> difference of 1 or 2 degrees between Tjmax and the thermal sensor due
> to the location of the latter.
>
> This means that 95=C2=B0C is a safer value to use.
>
> Fixes: cac68a56e34b9810 ("ARM: dts: r8a7791: enable to use thermal-zone")
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
