From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 1/2] net/smscx5xx: use the device tree for mac address
Date: Wed, 03 Feb 2016 16:42:02 +0100
Message-ID: <1454514122.25750.6.camel@v3.sk>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
	 <1454511759-24827-2-git-send-email-lkundrak@v3.sk>
	 <2240729.oauKHqo53h@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2240729.oauKHqo53h@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Lee Jones <lee@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Peter Chen <peter.chen@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-02-03 at 16:23 +0100, Arnd Bergmann wrote:
> On Wednesday 03 February 2016 16:02:38 Lubomir Rintel wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > This takes the MAC address for smsc75xx/smsc95xx USB network
> > devices
> > from a the device tree. This is required to get a usable persistent
> > address on the popular beagleboard, whose hardware designers
> > accidentally forgot that an ethernet device really requires an a
> > MAC address to be functional.
> >=20
> > The smsc75xx and smsc95xx drivers are just two copies of the
> > same code, so better fix both.
> >=20
> > Tested-by: Lubomir Rintel <lkundrak@v3.sk>
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >=20
>=20
> I have no memory of writing this patch, where did you find it?

2011's discussion:=C2=A0https://lkml.org/lkml/2011/3/17/416
(Link also in the cover letter).

> The changelog sounds like I wrote it, so I assume it was me after
> all.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0address =3D of_get_prope=
rty(dev->udev->dev.of_node,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"local-mac-=
address", NULL);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (address) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0memcpy(dev->net->dev_addr, address, ETH_ALEN);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> This should use of_get_mac_address(), not an open-coded property
> lookup. The function was probably added after I wrote the
> the original patch.

Okay. Will fix that up once I get feedback for the devicetree part.

> 	Arnd

Thanks,
Lubo
