From: Andrew <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/1] ARM: mvebu: dts: Add dts file for DLink DNS-327L
Date: Mon, 04 May 2015 01:05:56 +0300
Message-ID: <ad0fbb28b4b74de4c6685a5ddd21010c@mail.ncrmnt.org>
References: <1430663256-22714-1-git-send-email-andrew@ncrmnt.org>
 <20150503205043.GA23342@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150503205043.GA23342-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andrew Lunn =D0=BF=D0=B8=D1=81=D0=B0=D0=BB 03.05.2015 23:50:
> Hi Andrew
>=20
>> DNS-327L is a 2-bay NAS with the following specs:
>>      - 512MiB RAM
>>      - 128MiB NAND Flash
>>      - 1 GbE interface (Marvell PHY)
>=20
> ...
>=20
>> /* Set RGMII voltage to 1.8v, according to public docs. Nice! */
>> mw.l 0xd00184e0 0xa8a;
>> /* Some weird magic that goes into phy registers, no public docs */
>> phyWrite 0 16 2;
>> phyWrite 0 19 77;
>> phyWrite 0 18 5747;
>=20
> Take a look at the marvell,reg-init property. Might do what you need.
>=20
>      Andrew

Thanks for the tip. So far I'm solving it via u-boot.
You have to set RGMII voltage there anyway if you want tftp for the=20
updates,
so it looks like the right place to do this kind of stuff.


I'll add the proper magic to the dts file and resend tomorrow.

--=20
Regards,
Andrew

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
