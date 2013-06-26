From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 1/2] uio: Use of_match_ptr() macro in uio_pdrv_genirq.c
Date: Wed, 26 Jun 2013 17:06:32 +0200
Message-ID: <51CB0378.60100@monstr.eu>
References: <03c8973cc1e9efcd203e4d95d2dd9469afbcb39b.1372240320.git.michal.simek@xilinx.com> <CAK9yfHzVSt1XN7=OZOtF_n_3jbpXObqoiay_t6n3EauTjUUX+w@mail.gmail.com> <51CAC0A7.7090708@monstr.eu> <20130626150003.GA14117@kroah.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2CUOXWPEFICLXJKFIVQEI"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130626150003.GA14117@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "Hans J. Koch" <hjk@hansjkoch.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2CUOXWPEFICLXJKFIVQEI
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/26/2013 05:00 PM, Greg Kroah-Hartman wrote:
> On Wed, Jun 26, 2013 at 12:21:27PM +0200, Michal Simek wrote:
>> On 06/26/2013 12:00 PM, Sachin Kamat wrote:
>>> On 26 June 2013 15:22, Michal Simek <michal.simek@xilinx.com> wrote:
>>>> This eliminates having an #ifdef returning NULL for the case
>>>> when OF is disabled.
>>>>
>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>
>>> I have already submitted a similar patch for doing this:
>>> https://lkml.org/lkml/2013/3/14/169
>>
>> Ok. I don't care about it.
>> Greg: Can you please add any of this patch to your char-misc tree?
>=20
> I did that yesterday, can't you see it in there already, or did I mess
> something up?

You have applied
drivers: uio_dmem_genirq: Use of_match_ptr() macro
(sha1: 077797117dfa209717e1f3f1416c1101c0e047f0)

which is for uio_dmem_genirq.c
and there is one more for uio_pdrv_genirq.c driver
which we have talked about with Sachin.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2CUOXWPEFICLXJKFIVQEI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlHLA3gACgkQykllyylKDCFizQCfXiATbYl+uyEhjVBzuYZkfGNU
qrQAn2TaHRPF3niJtfoHByauWIB+2aj/
=O8LF
-----END PGP SIGNATURE-----

------enig2CUOXWPEFICLXJKFIVQEI--
