Return-Path: <SRS0=srtC=SL=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190405234514.6183-1-megous@megous.com> <20190405234514.6183-8-megous@megous.com>
 <20190408074042.74s5qckukcpore3e@flea> <20190408232232.fsl2ddthwo2rr4ql@core.my.home>
In-Reply-To: <20190408232232.fsl2ddthwo2rr4ql@core.my.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Apr 2019 09:35:02 +0200
Message-ID: <CACRpkdYGdLEeX8aBJfPQg=8OHcQR_uTJoA1FaO5p1od+VX2Nzg@mail.gmail.com>
Subject: Re: [PATCH 07/12] arm64: dts: allwinner: orange-pi-3: Enable ethernet
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Maxime Ripard <maxime.ripard@bootlin.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, Kalle Valo <kvalo@codeaurora.org>, Naveen Gupta <naveen.gupta@cypress.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, linux-wireless <linux-wireless@vger.kernel.org>, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 9, 2019 at 1:22 AM Ond=C5=99ej Jirman <megous@megous.com> wrote=
:

> > > +                enable-active-high;
> > > +                gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> >
> > Is enable-active-high still needed? It's redundant with the
> > GPIO_ACTIVE_HIGH flag.
>
> Looking at the code, use/non-use of enable-active-high inhibits
> flags specified in gpio property. So the GPIO_ACTIVE_HIGH flag
> is ignored here (had GPIO_ACTIVE_LOW been used, the kernel would
> ignore it too and print a warning).
>
> So enable-active-high is still necessary here.
>
> See comment in gpiolib-of.c where this is handled:
>
> /*
>  * The regulator GPIO handles are specified such that the
>  * presence or absence of "enable-active-high" solely controls
>  * the polarity of the GPIO line. Any phandle flags must
>  * be actively ignored.
>  */

Yeah this caused me special headache in the current merge
window because of buggy code on my part.

This is an effect of this flag being defined for powerpc
ages before we properly implemented generic GPIO
bindings. We just have to respect it.

See:
https://marc.info/?l=3Dlinux-gpio&m=3D155417774822532&w=3D2

Yours,
Linus Walleij
