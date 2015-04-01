From: Vianney le =?iso-8859-1?q?Cl=E9ment?=
	<vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Add Embest MarS Board
Date: Wed, 1 Apr 2015 15:25:36 +0200
Message-ID: <1427894736.2449.2@mail.essensium.com>
References: <1427875809-10444-1-git-send-email-vianney.leclement@essensium.com>
	<CAOMZO5DM66sUX-YojCyY5BC3Pdk4p4bkEqQ+W3tyDeNEL6nU5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5DM66sUX-YojCyY5BC3Pdk4p4bkEqQ+W3tyDeNEL6nU5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Iain Paton <ipaton0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 1, 2015 at 1:39 , Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Apr 1, 2015 at 5:10 AM, Vianney le Cl=C3=A9ment de Saint-Marc=
q
> <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org> wrote:
>>  Add device tree for the Embest/Element 14 MarS Board [1], an i.MX6=20
>> Dual
>>  based development board.
>>=20
>>  The e-MMC chip is disabled because initialization fails (error=20
>> -110).
>>  A possible cause is described in [2].
>>=20
>>  [1] http://www.embest-tech.com/shop/star/marsboard.html
>>  [2] https://community.freescale.com/message/442168#442168
>>=20
>>  Signed-off-by: Vianney le Cl=C3=A9ment de Saint-Marcq=20
>> <vianney.leclement-buIOx9BAs4sybS5Ee8rs3A@public.gmane.org>
>=20
> Couldn't this be combined with the existing
> arch/arm/boot/dts/imx6dl-riotboard.dts?

While both boards do indeed share a lot of the schematics, the=20
marsboard has some differences, e.g., in pin configuration, that=20
requires a separate dts.  We could split common parts out in a new=20
dtsi, but I am not sure it is worth the hassle.

Regards,
Vianney

Vianney le Cl=C3=A9ment de Saint-Marcq
Embedded Software Developper =C2=B7 +32 485 84 55 05
Essensium, Mind division =C2=B7 www.mind.be
GPG: 727B CFE9 355F 1B02 0820 EE1C 9042 3E07 A804 0316

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
