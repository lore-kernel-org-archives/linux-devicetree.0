From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 2/6] pinctrl: berlin: add the berlin4ct pinctrl driver
Date: Sun, 11 Oct 2015 00:33:38 +0200
Message-ID: <20151010223338.GG2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-3-git-send-email-jszhang@marvell.com>
 <20151009090353.GA2842@kwain>
 <20151009172238.68fdd51c@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151009172238.68fdd51c@xhacker>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jisheng,

On Fri, Oct 09, 2015 at 05:22:38PM +0800, Jisheng Zhang wrote:
> On Fri, 9 Oct 2015 11:03:53 +0200
> Antoine Tenart <antoine.tenart@free-electrons.com> wrote:
> >=20
> > Finally you can move the OF dependency to the PINCTRL_BERLIN config=
 as
> > all Berlin pinctrl drivers depends on it.
>=20
> PINCTRL_BERLIN isn't user visible and it's selected by PINCTRL_BERLIN=
_BG4CT. So
> we may have the following random config case:
>=20
> CONFIG_OF=3Dn
> CONFIG_PINCTRL_BERLIN_BG4CT=3Dy
>=20
> In this case, there will be build errors for we missed OF. So we have=
 to
> make PINCTRL_BERLIN_BG4CT depends on OF. What do you think? Or is the=
re
> better solution?

That's true.

But because other Berlin pinctrl drivers also depends on CONFIG_OF, we
need to make then depend on it too. This isn't the topic of this series
so I'll send a separate patch later.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
