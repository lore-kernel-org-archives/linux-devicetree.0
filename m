From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 2/5] ARM: zynq: dt: Convert to preprocessor includes
Date: Mon, 07 Apr 2014 14:24:07 +0200
Message-ID: <534298E7.2020409@monstr.eu>
References: <1396653256-28397-1-git-send-email-soren.brinkmann@xilinx.com> <1396653256-28397-3-git-send-email-soren.brinkmann@xilinx.com> <53423E75.3020008@monstr.eu> <53429754.8080105@topic.nl>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="FjHgvRCGHXXBk3uBA4is7JeNubgpQPmD7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53429754.8080105-Oq418RWZeHk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FjHgvRCGHXXBk3uBA4is7JeNubgpQPmD7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On 04/07/2014 02:17 PM, Mike Looijmans wrote:
> On 04/07/2014 07:58 AM, Michal Simek wrote:
>> Hi Soren,
>>
>> On 04/05/2014 01:14 AM, Soren Brinkmann wrote:
>>> Convert all Zynq DT files to the dtc preprocessor include syntax.
>>> This allows to include header files in the devicetrees like other
>>> SoC-types already do.
>>>
>>> Inspired-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> (http://www.spinics.net/lists/arm-kernel/msg319832.html)
>>>
>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>
>> These 4 patches needs more wider discussion if this is helpful or
>> not. Currently I can't see any value in it because everything
>> is just generated and fixed. I think I had the same discussion
>> with Laurent some weeks ago regarding this.
>=20
> I would be kinda neutral here. I'd consider it helpful, it improves rea=
dability (regardless of whether they=20
are generated or hand crafted). That's convenient for things like interru=
pt sensitivity,
I can't remember whether 4 is level or edge type. On the other hand, the =
clock indices are just
 as much magic numbers as the memory addresses. If I suspect an error in =
that area, I'd start by lokking
in /sys/kernel/debug/clk but wouldn't start in the DT.
>=20
>> IRC the origin idea to use this was especially for people who
>> writing these DTS by hand which is not our case - at least
>> for majority of our customers.
>=20
> I write them by hand. Is there any other way?

Device-tree BSP and in 2014.01 there will be new BSP which just generate
them directly from the Vivado tools which just target your reference desi=
gn.
You can connect your custom IP (or Xilinx or 3rd party) directly to the G=
IC
which using different IRQ sensitivity with whatever register addresses
and make no sense to write it by hand.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--FjHgvRCGHXXBk3uBA4is7JeNubgpQPmD7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNCmOcACgkQykllyylKDCFmFQCaApJaw6/8TZPhAwpZ8Pw0aI5j
7QEAn0KeJu/1axANFxaBbBwAr0kNahND
=svZR
-----END PGP SIGNATURE-----

--FjHgvRCGHXXBk3uBA4is7JeNubgpQPmD7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
