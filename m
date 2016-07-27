From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 00/13] arm64: Allwinner A64 support based on sunxi-ng
Date: Wed, 27 Jul 2016 10:46:23 +0200
Message-ID: <20160727104623.e9ca7b708e5c6462f44a5d01@free.fr>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Jul 2016 22:30:28 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> ere is the previous A64 patches made by Andre [1], reworked to use
> the new sunxi-ng clock framework.
>=20
> This uses the current H3 clock code, as both are really similar. The
> first patches are just meant to rework slightly the H3 code, before
> introducing the A64-related patches.
>=20
> Some WiP stuff have been removed, such as the MMC part, but this seri=
e
> already has a decent amount of devices supported: uart, i2c, rsb, etc=
=2E
>=20
> Let me know what you think,

I don't see the interest to have common code for 32bits and 64bits.
The clock driver of a SoC will never evolve, so, it is simpler to
copy the source common with the H3 into a clean A64 clock driver.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
