From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: berlin: add the SDHCI nodes for the BG2Q
Date: Wed, 23 Apr 2014 11:02:46 +0200
Message-ID: <20140423090246.GG24355@kwain>
References: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com>
 <1398155248-1659-2-git-send-email-antoine.tenart@free-electrons.com>
 <5356A85F.6030708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5356A85F.6030708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Ball <chris-OsFVWbfNK3isTnJN9+BGXg@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sebastian,

On Tue, Apr 22, 2014 at 07:35:27PM +0200, Sebastian Hesselbarth wrote:
> On 04/22/2014 10:27 AM, Antoine T=C3=A9nart wrote:

[=E2=80=A6]

> > +		sdhci0: sdhci@ab0000 {
> > +			compatible =3D "mrvl,pxav3-mmc";
> > +			reg =3D <0xab0000 0x200>;
> > +			clocks =3D <&sdio1clk>;
> > +			interrupts =3D <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		sdhci1: sdhci@ab0800 {
> > +			compatible =3D "mrvl,pxav3-mmc";
> > +			reg =3D <0xab0800 0x200>;
> > +			clocks =3D <&sdio1clk>;
> > +			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		sdhci2: sdhci@ab1000 {
>=20
> Didn't Jisheng ask for sdhci2 being registered at mmc0?

Yes sure, but I don't know if he agreeded on this solution. I'll ask hi=
m.
Otherwise aliases seems ok from my point of view.

> Renaming the node labels will not help, but have you tried using an:
>=20
> aliases {
> 	mmc0 =3D &sdhci2;
> 	mmc1 =3D &sdhci0;
> 	mmc2 =3D &sdhci1;
> };
>=20
> node and set the platform_device's .id field with what you get
> from of_alias_get_id(np, "mmc")?
>=20
> @Chris, Ulf: Is there any generic alias, e.g. "sdhci", you prefer for
> drivers/mmc so we can put it into sdhci_get_of_property()?

I'd also like the subsystem maintainers to give their opinion on this
before updating.

Thanks!

Antoine

--=20
Antoine T=C3=A9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
