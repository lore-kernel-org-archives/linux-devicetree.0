From: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
Date: Thu, 24 Jul 2014 00:56:56 +0200
Message-ID: <94F87063-D717-435B-B7C5-EDAC9B26742C@perenite.com>
References: <1406154923-13612-1-git-send-email-yahoo@perenite.com> <1406154923-13612-2-git-send-email-yahoo@perenite.com> <20140723224236.GC28485@lunn.ch>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140723224236.GC28485-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org

No worries, sorry it makes more email for you guys, I've added the colo=
rs for power and revert order hdd:blue instead of blue:hdd for the hdd =
led.

=46or the marvell,mv78230-a0-i2c unfortunately i've spend 3 hours tryin=
g to understand this but it only works with this on the ix4-300d :(. Th=
ere was multiple patch around this and maybe one broke the auto-detect =
part of this, I've tried compiling with some 3.10 or lower kernel but n=
o luck here I still have to put this a0 option.

Benoit
Le 24 juil. 2014 =E0 00:42, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> a =E9crit :

>> +			i2c@11000 {
>> +				compatible =3D "marvell,mv78230-a0-i2c",
>> +					"marvell,mv64xxx-i2c";
>=20
> Ah sorry, i missed this first time. Do you really need
> "marvell,mv78230-a0-i2c"?
>=20
> Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt says:
>=20
>                     - "marvell,mv78230-a0-i2c"
>                       * Note: Only use "marvell,mv78230-a0-i2c" for a
>                         very rare, initial version of the SoC which
>                         had broken offload support.  Linux
>                         auto-detects this and sets it appropriately.
>=20
> So i don't think you should have this hear.
>=20
> Gregory, please could you comment.
>=20
>> +		power-led {
>> +			label =3D "ix4-300d:power";
>=20
> It is normal to include the colour, and you did for all the other
> LEDs.
>=20
> 	Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
