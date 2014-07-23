From: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] Added dts defintion for Lenovo ix4-300d nas
Date: Wed, 23 Jul 2014 23:15:18 +0200
Message-ID: <9AE6F1AD-9296-47E9-91E2-9E34AA48EBB4@perenite.com>
References: <1406117232-5962-1-git-send-email-yahoo@perenite.com> <20140723134534.GF23220@titan.lakedaemon.net> <20140723141443.GC2856@lunn.ch> <47823826-CDE8-47D2-B1B6-B688118CF985@perenite.com> <20140723164958.GH2856@lunn.ch>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140723164958.GH2856-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, benoitm974 <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Well after several test with the original BSP driver I found that this =
is not fully WOL related. It could be that the LED pin is linked to pow=
eron for WOL, yet here the issue is on shutdown pulling up MPP24 should=
 poweroff the deice but only reboots it except is both PHY have some re=
g written to...

By the way the current nv_neta does not seems to support WOL for 88e131=
8 and still having them both up is enough to have poweroff to work, whi=
ch is why I'm putting the WOL as a side track.

Both phy are :
marvell,88e1318

example of a minimal reg write that lead MPP24 to shutdown instead of r=
ebooting on original BSP driver
XXXXX BasicInit
XXXXXXXXXXXXXX phyAdr 0: regOffs: 16 data: 3 caller: mvEthE1310PhyBasic=
Init+0x2c/0x58
XXXXXXXXXXXXXX phyAdr 0: regOffs: 10 data: 830 caller: mvEthE1310PhyBas=
icInit+0x3c/0x58
XXXXXXXXXXXXXX phyAdr 0: regOffs: 16 data: 0 caller: mvEthE1310PhyBasic=
Init+0x4c/0x58
XXXXX BasicInit
XXXXXXXXXXXXXX phyAdr 1: regOffs: 16 data: 3 caller: mvEthE1310PhyBasic=
Init+0x2c/0x58
XXXXXXXXXXXXXX phyAdr 1: regOffs: 10 data: 830 caller: mvEthE1310PhyBas=
icInit+0x3c/0x58
XXXXXXXXXXXXXX phyAdr 1: regOffs: 16 data: 0 caller: mvEthE1310PhyBasic=
Init+0x4c/0x58

I've tried something like:
compatible =3D "marvell,88e1318";
                                        device_type =3D "ethernet-phy";
                                        marvell,reg-init =3D
                                          /* Init led/activity workarou=
nd for MP24 shutdown. */
                                          <3 0x10 0 0x830>;

In the dts but without luck

Regards,
Benoit


Le 23 juil. 2014 =E0 18:49, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> a =E9crit :

>> Well actually the PHY need to be initialized (at least 1 mII reg
>> written), which from marvel LSP driver always occurs, while it
>> doesn't with mainline PHY driver (drivers/net/phy/marvell.c), so the
>> only simple way I found to have at least one PHY reg on both
>> interface written is to have both eth up at OS config level.
>=20
> Thanks for the information. This sounds like a wake on LAN feature.
> I've seen other Marvell hardware connect a PHY LED output pin to the
> circuit controlling the main power supply. When the PHY detects the
> magic wake-up packet, it 'blinks' the LED so turning the power back
> on.
>=20
> My guess is, the register write to the PHY is configuring the LED. Do
> you have the datasheet for the PHY? Can you check this?
>=20
>> Probably the best option would be to have a reg-init =3D <reg offset
>> value> on both phy dts definition but the current armada mii doesn't
>> support this dts config...
>=20
> Once we understand what is going on here, we can consider adding
> support for this.
>=20
> 	Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
