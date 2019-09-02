From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: pine64-plus: Add PHY
 regulator delay
Date: Mon, 2 Sep 2019 13:38:46 +0200
Message-ID: <20190902113846.752jdgr3czywuieh@flea>
References: <20190825130336.14154-1-jernej.skrabec@siol.net>
 <20190827133443.fdxl5wjmgkerc3uh@flea>
 <20190827134806.5l7dxyvzjrvabh7o@core.my.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190827134806.5l7dxyvzjrvabh7o@core.my.home>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 03:48:06PM +0200, Ond=C5=99ej Jirman wrote:
> Hi,
>
> On Tue, Aug 27, 2019 at 03:34:43PM +0200, Maxime Ripard wrote:
> > On Sun, Aug 25, 2019 at 03:03:36PM +0200, Jernej Skrabec wrote:
> > > Depending on kernel and bootloader configuration, it's possible that
> > > Realtek ethernet PHY isn't powered on properly. It needs some time
> > > before it can be used.
> > >
> > > Fix that by adding 100ms ramp delay to regulator responsible for
> > > powering PHY.
> > >
> > > Fixes: 94dcfdc77fc5 ("arm64: allwinner: pine64-plus: Enable dwmac-sun=
8i")
> > > Suggested-by: Ondrej Jirman <megous@megous.com>
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > How was that delay found?
>
> I suggested it. There's no delay in the dwmac-sun8i driver, so after enab=
ling
> the phy power, it will start accessing it over MDIO right away, which is =
not
> good.
>
> I suggested the value based on post-reset delay in the PHY's datasheet (3=
0ms).
> Multiplied ~3x (if I remember correctly) to get some safety margin. Chip =
has
> more to do then after the HW reset, and regulator also needs some time to
> ramp-up.

That sounds reasonable, can you add that as a comment?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
