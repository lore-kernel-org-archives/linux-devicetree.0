From: Benoit Masson <benoitm@perenite.com>
Subject: Re: [PATCH 1/2] Added dts defintion for Lenovo ix4-300d nas
Date: Wed, 23 Jul 2014 17:52:57 +0200
Message-ID: <47823826-CDE8-47D2-B1B6-B688118CF985@perenite.com>
References: <1406117232-5962-1-git-send-email-yahoo@perenite.com> <20140723134534.GF23220@titan.lakedaemon.net> <20140723141443.GC2856@lunn.ch>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140723141443.GC2856@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, benoitm974 <yahoo@perenite.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@googlemail.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew I've taken your comment into account, yet for the PHY init co=
mment, see my answer below.

Le 23 juil. 2014 =E0 16:14, Andrew Lunn <andrew@lunn.ch> a =E9crit :
>=20
>>> +	/* warning: you need both eth1 & 0 to be initialize for poweroff =
to shutdown otherwise it reboots */
>=20
> What do you mean by initialized? Driver loaded? Interface up?=20
Well actually the PHY need to be initialized (at least 1 mII reg writte=
n), which from marvel LSP driver always occurs, while it doesn't with m=
ainline PHY driver (drivers/net/phy/marvell.c), so the only simple way =
I found to have at least one PHY reg on both interface written is to ha=
ve both eth up at OS config level.

Probably the best option would be to have a reg-init =3D <reg offset va=
lue> on both phy dts definition but the current armada mii doesn't supp=
ort this dts config...

>=20
>> This is a great first version
>=20
> I agree with Jason, well done.
>=20
Thanks !
>  Andrew
