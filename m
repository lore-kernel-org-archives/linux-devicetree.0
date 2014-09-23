From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 0/9] ARM: Berlin: Ethernet support
Date: Tue, 23 Sep 2014 16:01:52 +0200
Message-ID: <20140923140152.GD18924@kwain>
References: <1411474536-22626-1-git-send-email-antoine.tenart@free-electrons.com>
 <3200502.7xjfrZcKCM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3200502.7xjfrZcKCM@wuerfel>
Sender: netdev-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 23, 2014 at 02:41:47PM +0200, Arnd Bergmann wrote:
> On Tuesday 23 September 2014 14:15:27 Antoine Tenart wrote:
> >=20
> > This series introduce support for the Ethernet controller on Berlin=
 SoCs,
> > using the existing pxa168 Ethernet driver. In order to do this, DT
> > support is added to the driver alongside some other modifications a=
nd
> > fixes.
> >=20
>=20
> Looks great overall, I've commented on two issues I've found, but onl=
y
> the phy-addr one really needs to be addressed. Once that is out of th=
e
> way, please add
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
