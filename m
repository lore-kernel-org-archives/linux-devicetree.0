From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] export of_irq_count
Date: Thu, 13 Feb 2014 07:29:32 +0100
Message-ID: <52FC664C.7040609@monstr.eu>
References: <1392226444-30507-1-git-send-email-delicious.quinoa@gmail.com> <CAL_JsqLT=w5wDnFBcQdeF5KgpJK76xJhH=ZYJy24CEeV2uQ2aQ@mail.gmail.com> <CANk1AXTbnBXzxf_WiQAbWKxNhm2wKVrj0O=nDcW7j27i4T3YBw@mail.gmail.com> <CAL_JsqLFAj_nCpuCg8qVchrfeSJ4HgOpt6ht9URkBuKZ6ztWow@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="7w8FftFIEubxxa6NpPdRUGIULL9FHQcKv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLFAj_nCpuCg8qVchrfeSJ4HgOpt6ht9URkBuKZ6ztWow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Yves Vandervennet <rocket.yvanderv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7w8FftFIEubxxa6NpPdRUGIULL9FHQcKv
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 02/12/2014 08:56 PM, Rob Herring wrote:
> On Wed, Feb 12, 2014 at 12:43 PM, delicious quinoa
> <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Feb 12, 2014 at 12:32 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>> On Wed, Feb 12, 2014 at 11:34 AM, delicious quinoa
>>> <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> export of_irq_count so it can be used in drivers that are built
>>>> as modules.
>>>
>>> What drivers? Drivers generally should be using resources rather than=

>>> this function directly.
>>
>> It's for the DesignWare GPIO driver I've been upstreaming.  The
>> DesignWare IP can be configured to be one irq for all the gpios or one=

>> irq per gpio.  I want to support both cases.  So I need to know how
>> many irqs are specified in the device tree.
>=20
> Okay. You should merge this as part of that then, so:
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I think we should be consistent and there are other methods how
to solve this. I have sent the same patch long time ago.
https://lkml.org/lkml/2013/5/30/265

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--7w8FftFIEubxxa6NpPdRUGIULL9FHQcKv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEUEARECAAYFAlL8ZkwACgkQykllyylKDCFlFwCY4CBZsR8lxSiwlbWmCWIWUQpq
rQCeOOkpgvfGkGTa7Hla5LYht89sWOU=
=D722
-----END PGP SIGNATURE-----

--7w8FftFIEubxxa6NpPdRUGIULL9FHQcKv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
