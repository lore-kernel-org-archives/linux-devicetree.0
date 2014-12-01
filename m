From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v4 5/6] ARM: zynq: Add OCM controller driver
Date: Mon, 01 Dec 2014 15:24:36 +0100
Message-ID: <547C7A24.8090403@monstr.eu>
References: <cover.1415962281.git.michal.simek@xilinx.com>	<6741d995fbec801d795c5db481e39425bd912f8a.1415962281.git.michal.simek@xilinx.com>	<CACRpkdbZ8Pwy=04dhJq5ONZ1B-SQK1f=eLZjjCDmV7UQ0aHduA@mail.gmail.com>	<857cab03bd6445c59cc345349a00f67c@BL2FFO11FD010.protection.gbl> <CACRpkdbL=yOwjC7j=eacg9K2Mb3rwcKy3b0F8y2H9Nz8RsRRcg@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="2AsdAsqHF2xPXskKiCUTaaq0noPXHl39x"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbL=yOwjC7j=eacg9K2Mb3rwcKy3b0F8y2H9Nz8RsRRcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sandee
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2AsdAsqHF2xPXskKiCUTaaq0noPXHl39x
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/28/2014 04:35 PM, Linus Walleij wrote:
> On Thu, Nov 27, 2014 at 2:57 PM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>=
 wrote:
>> On 11/27/2014 02:20 PM, Linus Walleij wrote:
>>> On Fri, Nov 14, 2014 at 11:52 AM, Michal Simek <michal.simek@xilinx.c=
om> wrote:
>=20
>>> (...)
>>>> +       zynq_ocmc->pool =3D devm_gen_pool_create(&pdev->dev,
>>>> +                                              ilog2(ZYNQ_OCMC_GRANU=
LARITY),
>>>> +                                              -1);
>>>
>>> Do this:
>>>
>>> #include <linux/sizes.h>
>>>
>>> zynq_ocmc->pool =3D devm_gen_pool_create(&pdev->dev,
>>>                                        ilog2(SZ_64K),
>>>                                        -1);
>>>
>>> And get rid of the #define for ZYNQ_OCMC_GRANULARITY
>>
>> ilog2 from 32 is different to ilog2 from ilog2 from 0x10000.
>=20
> Bah I misread the code, forget this comment.
>=20
> Maybe it's more like I wanted
>=20
> +#define ZYNQ_OCMC_BLOCK_SIZE   0x10000
>=20
> To be replaced with SZ_64K
>=20
> But it's a petty detail anyway.

I have fixed it.

>> Do you have any opinion regarding calling zynq_slcr_get_ocm_config()?
>>
>> Is it better to expose slcr this interface to drivers?
>> Or use regmap and read this value directly?
>=20
> Depends on what provides that call. The pattern I usually follow
> is to expose the mixed-registers range as a syscon device
> using drivers/mfd/syscon.c and then use one of the methods from
> <linux/mfd/syscon.h> to look up a reference to the regmap and
> use it to access misc registers.

I have tried it and I can just use it without any problem.
I have sent v5 with origin version but in cover letter there
is a code for that.


>> Also I do read for CONFIG_SMP case jump trampoline size - maybe
>> you can have better idea how this can be done.
>=20
> No I have no clue about that... :(

ok - fair enough. One option is to keep it as is. The second
option is to allocate any hardcoded size or size passed via DT.
But run-time detection is the best IMHO.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--2AsdAsqHF2xPXskKiCUTaaq0noPXHl39x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlR8eiQACgkQykllyylKDCGcpgCcDfe1o5NRLnIkE6pvyCEKFFV/
P8QAnRMffxdxjlrYP98UeYu9DPEMZ5N5
=5bYS
-----END PGP SIGNATURE-----

--2AsdAsqHF2xPXskKiCUTaaq0noPXHl39x--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
