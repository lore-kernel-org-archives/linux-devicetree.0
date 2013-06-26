From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 1/2] uio: Use of_match_ptr() macro in uio_pdrv_genirq.c
Date: Wed, 26 Jun 2013 14:50:16 +0200
Message-ID: <51CAE388.9030602@monstr.eu>
References: <03c8973cc1e9efcd203e4d95d2dd9469afbcb39b.1372240320.git.michal.simek@xilinx.com> <CAK9yfHzVSt1XN7=OZOtF_n_3jbpXObqoiay_t6n3EauTjUUX+w@mail.gmail.com> <51CAC0A7.7090708@monstr.eu> <CAK9yfHxuHuf1BnzR36c8Ucw_xrVcMW--jE-Gpng6tPNd17sB2A@mail.gmail.com> <51CACABF.4040902@monstr.eu> <CAK9yfHzuUhxUDhBRGJPvH8ftwaE3ZbauUgK=thMTbvc7LdMq7Q@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2HBDHRBQXRXECAMXESBXJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK9yfHzuUhxUDhBRGJPvH8ftwaE3ZbauUgK=thMTbvc7LdMq7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2HBDHRBQXRXECAMXESBXJ
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 06/26/2013 01:13 PM, Sachin Kamat wrote:
> On 26 June 2013 16:34, Michal Simek <monstr@monstr.eu> wrote:
>> On 06/26/2013 12:51 PM, Sachin Kamat wrote:
>>> On 26 June 2013 15:51, Michal Simek <monstr@monstr.eu> wrote:
>>>> On 06/26/2013 12:00 PM, Sachin Kamat wrote:
>>>>> On 26 June 2013 15:22, Michal Simek <michal.simek@xilinx.com> wrote=
:
>>>>>> This eliminates having an #ifdef returning NULL for the case
>>>>>> when OF is disabled.
>>>>>>
>>>>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>>>
>>>>> I have already submitted a similar patch for doing this:
>>>>> https://lkml.org/lkml/2013/3/14/169
>>>>
>>>> Ok. I don't care about it.
>>>> Greg: Can you please add any of this patch to your char-misc tree?
>>>>
>>>> For Sachin patch.
>>>> Acked-by: Michal Simek <monstr@monstr.eu>
>>>
>>> Thanks Michal. Since Hans wasn't active the patch has been pending
>>> since some time.
>>> The latest rebased version has been posted [1] for Greg to apply.
>>>
>>> [1] https://lkml.org/lkml/2013/6/25/7
>>
>>
>> Yeah. As I said I really don't care which version will be applied.
>> It is just necessary to have progress on this.
>>
>> Here is the first version I have sent
>> http://lkml.org/lkml/2013/5/23/311
>>
>> btw: do you agree about removing that uio_pdrv because
>> all functionality is already in uio_pdrv_genirq driver
>> and make no sense to have two drivers for the same thing?
>=20
> Sorry, I have'nt  seen much of this code other than the obvious
> cleanup for which I had sent the patch.

ok. Fair enough.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2HBDHRBQXRXECAMXESBXJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlHK44wACgkQykllyylKDCFmVACdFkwbQ3V+mLpasw5mcoqVqueX
qpQAniYgbkf1bx48uJacd2ZzX6210MEe
=xNMm
-----END PGP SIGNATURE-----

------enig2HBDHRBQXRXECAMXESBXJ--
