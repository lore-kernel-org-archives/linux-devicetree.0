From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH/RFC] ARM: shmobile: r8a7790: Fix HSUSB clock to hp_clk
 from mp_clk
Date: Mon, 16 Feb 2015 10:20:10 +0100
Message-ID: <CAMuHMdX=cdHaiHCnYsJvZFc2RNv=Pk8cLXuvkezg4Ht4U4mXsg@mail.gmail.com>
References: <1424011746-3787-2-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424011746-3787-2-git-send-email-ykaneko0929-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Kaneko <ykaneko0929-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kazuya Mizuguchi <kazuya.mizuguchi.ks-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kaneko-san, Mizuguchi-san,

On Sun, Feb 15, 2015 at 3:49 PM, Yoshihiro Kaneko <ykaneko0929-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>
> HSUSB uses hp_clk for H/W register access.

That indeed seems to be true, and that's what this patch is changing.

> HSUSB uses mp_clk for USB-DMAC access.

However, page 64-2 doesn't mention the MP clock for USB-DMAC:
   "AXI bus clock (ZS=CF=86: 260 MHz), HPB bus clock (HP=CF=86: 130 MHz=
).
    USB local bus clock (48 MHz)"
So your statement doesn't seem to be true?

Note that mstp3_clks in dtsi has hp_clk as the parent for both usbdmac0=
 and
usbdmac1, so if your statement would be true, that has to changed, too?

The same is true for other members of the R-Car Gen2 family, e.g. your =
patch
for r8a7791.

> The clock is defined for H/W register access.
>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>
> This patch is based on devel branch of Simon Horman's renesas tree.
>
>  arch/arm/boot/dts/r8a7790.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a77=
90.dtsi
> index 24de994..113edf2 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi

> @@ -1132,7 +1133,7 @@
>                 mstp7_clks: mstp7_clks@e615014c {
>                         compatible =3D "renesas,r8a7790-mstp-clocks",=
 "renesas,cpg-mstp-clocks";
>                         reg =3D <0 0xe615014c 0 4>, <0 0xe61501c4 0 4=
>;
> -                       clocks =3D <&mp_clk>, <&mp_clk>, <&zs_clk>, <=
&zs_clk>, <&p_clk>,
> +                       clocks =3D <&mp_clk>, <&hp_clk>, <&zs_clk>, <=
&zs_clk>, <&p_clk>,
>                                  <&p_clk>, <&zx_clk>, <&zx_clk>, <&zx=
_clk>, <&zx_clk>,
>                                  <&zx_clk>;
>                         #clock-cells =3D <1>;

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
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
