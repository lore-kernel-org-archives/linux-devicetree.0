From: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] V4 ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
Date: Mon, 28 Jul 2014 16:13:59 +0200
Message-ID: <02CE8576-5CD8-4AA5-971E-85CBC8CE05D3@perenite.com>
References: <1406503839-4662-1-git-send-email-yahoo@perenite.com> <20140728140805.GQ23220@titan.lakedaemon.net>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140728140805.GQ23220-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org


Le 28 juil. 2014 =E0 16:08, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> a =E9cr=
it :

> Benoit,
>=20
> On Sun, Jul 27, 2014 at 04:30:39PM -0700, Benoit Masson wrote:
>> The Lenovo Iomega ix4-300d is a 4-Bay sata NAS with dual Gb,
>> USB2.0 & 3.0, powered by a Marvell Armada XP MV78230 dual core CPU.
>>=20
>> http://shop.lenovo.com/us/en/servers/network-storage/lenovoemc/ix4-3=
00d/
>> Signed-off-by: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
>> ---
>> arch/arm/boot/dts/Makefile                      |   3 +-
>> arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts | 285 ++++++++++++++=
++++++++++
>> 2 files changed, 287 insertions(+), 1 deletion(-)
>> create mode 100644 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts
>=20
> I've applied this to mvebu/dt with a few minor fixups.
>=20
>  - Insert empty line between URL and S-o-B
>  - Removed i2c compatible property
>  - Removed trailing whitespace from multi-line comment at end of file
>=20
> Also, traditionally, the 'V4' goes inside the square brackets, eg
>=20
>  [ PATCH V4 2/2 ] ...
>=20
> This is done because 'git am ...' automagically removes everything
> between the square brackets and then takes the rest of the subject li=
ne
> to be the first line of the commit message.
>=20
> Well done!

Thanks Jason and all for supporting this and following up long discussi=
ons on A0 stepping ... !

Just one question is how would you link this patch to the quirk a0 patc=
h since this patch can't work without it ...

>=20
> You can view the commit here:
>=20
>  http://git.infradead.org/linux-mvebu.git/commitdiff/40c2da45366171bd=
c9ad1968489aaae190248383
>=20
> thx,
>=20
> Jason.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
