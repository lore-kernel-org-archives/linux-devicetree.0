From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] GPIO: Add support for dual channel in gpio-xilinx.c
Date: Fri, 31 May 2013 09:34:57 +0200
Message-ID: <51A852A1.7020505@monstr.eu>
References: <4b90b06fce0475b579cfba4d968b4778359154f6.1369826814.git.michal.simek@xilinx.com>
 <CACRpkdY4xaCOe28nu-NrYQ7pafjhj8-xqFcJRF9iJUy3SrCVrA@mail.gmail.com>
 <51A8387C.4030704@monstr.eu>
 <CACRpkdbHiaK6YPgXyxNgEeZxAsddK4x0vS-q3YfyXnj_BgHvuw@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4494579782347808024=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdbHiaK6YPgXyxNgEeZxAsddK4x0vS-q3YfyXnj_BgHvuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4494579782347808024==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2TIANRJBSIWEKMHWDBEAO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2TIANRJBSIWEKMHWDBEAO
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 05/31/2013 09:14 AM, Linus Walleij wrote:
> On Fri, May 31, 2013 at 7:43 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:=

>> On 05/30/2013 09:46 PM, Linus Walleij wrote:
>=20
>>> (...)
>>>> +/* Read/Write access to the GPIO registers */
>>>> +#define xgpio_readreg(offset)          __raw_readl(offset)
>>>> +#define xgpio_writereg(offset, val)    __raw_writel(val, offset)
>>>
>>> So you're swithing in_be32/out_be32 to the CPU-dependent
>>> __raw_readl/__raw_writel functions? Why?
>>
>> The reason is that this driver can be used on ARM where in_be32/out_be=
32
>> is not implemented.
>=20
> OK I buy this (and the following explanation).
>=20
> I think readl/writel is always in LE (PCI) endianness anyway, which
> is likely not what you want. (I suspect the next point was about
> that.)

readl/writel yes it is all the time little endian
but __raw_readl/__raw_writel is just *(u32 *)ptr access
without any endian checking and barriers.

Probably the best way how to handle is to write
#ifdef ARCH_ZYNQ
# define xgpio_readreg(offset)          readl(offset)
# define xgpio_writereg(offset, val)    writel(val, offset)
#else
# define xgpio_readreg(offset)          __raw_readl(offset)
# define xgpio_writereg(offset, val)    __raw_writel(val, offset)
#endif

But still it is not correct in sense that I shouldn't pretend
that __raw_readl is ok to run on ppc and microblaze big endian.
But using another ifdef BIG_ENDIAN or ARCH don't improve it.

If there is one more register which I can use for autodetection,
it will be easy to choose but that's not this case.

>>> Have you documented these new bindings? It doesn't seem so.
>>> Documentation/devicetree/bindings/gpio/*...
>>>
>>> If it's undocumented so far, this is a good oppotunity to add it.
>>
>> Isn't it enough what it is in 2/2?
>=20
> I didn't see 2/2, I guess I wasn't on CC...
>=20
> Anyway I guess it's this:
> http://marc.info/?l=3Dlinux-kernel&m=3D136982686732560&w=3D2

Yes. it is. I am using patman and you are probably not listed
in MAINTAINERS for this folder to automatically add you.
Will add you manually.

> It's OK, but fix the boolean member so as to just needing to
> be present:
>=20
> xlnx,is-dual;
>=20
> Rather than
>=20
> xlnx,is-dual =3D <1>;

Surely I can do it but it means to change our BSP and because
this IP is used on Microblaze from beginning this change
breaks all DTSes from past.
That's why I would prefer not to change logic here because
it just breaks all Microblaze DTSes which were generated
till this change (All of them contains xlnx,is-dual =3D <0>
if dual channel is not used).

I will definitely look at dt function in the whole driver
and use the

>> Or do you want to describe current binding in the first patch
>> and then extend it in this patch when dual channel is added?
>=20
> Nah. 2/2 is fine.

ok.

>>> This is basically a jam table (hardware set-up) in the device tree.
>>
>> Not sure what you mean by that. Xilinx GPIO is soft IP which can be co=
nfigured
>> to different configurations before bitstream is generated.
>> At the end you will get different setting/addresses setup for every pi=
n
>> which is described by these xlnx,X descriptions.
>>
>>> I don't exactly like this. Is this necessary?
>>
>> If you mean names or values in there that all of them are autogenerate=
d
>> from design tools and they are reflect IP hardware description and all=

>> configuration options which you can have there.
>> It means that all these values give you exact hardware description.
>>
>> Do I answer your question?
>=20
> Yes, this is OK, I buy that explanation. I thought it was
> something else.

ok

> I think the overall problem is that I do not understand what a
> "channel" is in this context, and thus it is hard to understand the
> patch as a whole. 2/2 could add some more verbose explanation
> about the HW IP so I get comfortable and can understand the
> whole hardware block...

ok. Good.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2TIANRJBSIWEKMHWDBEAO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlGoUqEACgkQykllyylKDCGhywCfR+1fsgegOUavzCpvtQ59y/y4
ekAAnRe98jiP9lvOpGitOcZ2hC9ByCMS
=ZbAM
-----END PGP SIGNATURE-----

------enig2TIANRJBSIWEKMHWDBEAO--

--===============4494579782347808024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4494579782347808024==--
