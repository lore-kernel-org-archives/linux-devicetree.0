From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
Date: Wed, 22 May 2019 18:15:26 +0200
Message-ID: <CAJiuCcdaZVLQyupEf8HPaUySakufXXAhzundo6VeyQaAyZ8Trw@mail.gmail.com>
References: <20190521160330.28402-1-peron.clem@gmail.com> <20190521160330.28402-4-peron.clem@gmail.com>
 <20190522103243.mmrfato5p2mhtf4j@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522103243.mmrfato5p2mhtf4j@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Wed, 22 May 2019 at 12:32, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Tue, May 21, 2019 at 06:03:28PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 has a second watchdog on the r-blocks which is
> > compatible with the A31.
> >
> > This commit add the H6 compatible for the r_watchdog.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Unless you have some evidence that the two blocks are different, then
> you should just reuse the same one.

I have no evidence it's different nor identical, it's not documented
in the user manual.
I thought it would better to have separate bindings in case there is a
difference.
Than don't have and find later that we have to introduce one.

But as you prefer.

Regards,
Cl=C3=A9ment



>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
