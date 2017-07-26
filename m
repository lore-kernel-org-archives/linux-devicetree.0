From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm283x: Move the BCM2837 DT contents from arm64 to arm.
Date: Wed, 26 Jul 2017 13:00:02 -0700
Message-ID: <87y3rbx931.fsf@eliezer.anholt.net>
References: <20170719201916.22369-1-eric@anholt.net> <a2e79c17-f345-e7f2-8438-d4754e4ceb3a@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a2e79c17-f345-e7f2-8438-d4754e4ceb3a-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:

> Hi Eric,
>
> suggestion inline
>
>
> On 17-07-19 01:19 PM, Eric Anholt wrote:
>> BCM2837 is somewhat unusual in that we build its DT on both arm32 and
>> arm64.  Most devices are being run in arm32 mode.
>>
>> Having the body of the DT for 2837 separate from 2835/6 has been a
>> source of pain, as we often need to make changes that span both
>> directories simultaneously (for example, the thermal changes for 4.13,
>> and pinmuxing changes earlier).  Other changes are made more
>> complicated than they need to be, such as the SDHOST enabling, because
>> we end up splitting a single change into a 283[56] half and a 2837
>> half.
>>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>
>> I had asked about what we could do about our DT merging troubles back
>> in https://lkml.org/lkml/2017/5/16/707 with no response.  I'm hoping
>> we can take this patch as a resolution to that, and submit (almost
>> all) future RPi DT changes through the arm32 dt tree.
>>
>>
>>   arch/arm/boot/dts/bcm2837-rpi-3-b.dts              | 42 ++++++++++++++=
+++++++-
>>   .../dts/broadcom =3D> arm/boot/dts}/bcm2837.dtsi     |  0
>>   arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts   | 42 +-------------=
--------
>>   3 files changed, 42 insertions(+), 42 deletions(-)
>>   rename arch/{arm64/boot/dts/broadcom =3D> arm/boot/dts}/bcm2837.dtsi (=
100%)
>>
>> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/b=
cm2837-rpi-3-b.dts
>> index c72a27d908b6..972f14db28ac 100644
>> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
>> @@ -1 +1,41 @@
>> -#include "arm64/broadcom/bcm2837-rpi-3-b.dts"
>> +/dts-v1/;
>> +#include "bcm2837.dtsi"
>> +#include "bcm2835-rpi.dtsi"
>> +#include "bcm283x-rpi-smsc9514.dtsi"
>> +#include "bcm283x-rpi-usb-host.dtsi"
> If you're moving this back to the arm directory why not change the=20
> include path and remove the 4 symlinks in arm64/boot/dts/broadcom?
>
> +#include "arm/bcm2837.dtsi"
> +#include "arm/bcm2835-rpi.dtsi"
> +#include "arm/bcm283x-rpi-smsc9514.dtsi"
> +#include "arm/bcm283x-rpi-usb-host.dtsi"

Even better, it seems we don't need the arm/ here -- when we're
processing the include in arm/, the neighboring files get found.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAll49MIACgkQtdYpNtH8
nuh5PQ/+MhruFd5DEZicJPY7xe3Od2ztwr1n8GxjD1Wc9QBz3hINy3xX8B8ibjI1
NHHcHjs0TgDxHCsO7GaiZwrygYP/pThlI8zExGAu5Y7Bh8w926pUgUYk7pVG/nU8
ew5ksvB9cVgaTYIjXUjOTK3Vb88TQX1GYL1wdaY90It/O8kl1k3we9VyuC7HfZxl
6CUz9iycReIPF4S3t9byI1jlfVwiPjleO49FE6zlMO7lus3kiu1ExWVSlscojmpR
EsAl9Gzg6EpZUyrtDvUBucylvHt8AztwMnwlNVdTCAUMe2mUQry/gR9viRCFtcNz
qvYOyuE/MSmCIEzhXNqxbLpXxDvPaXUfIrm7ny66dBMC067jUA+mbK4OghfOFx23
jM4lQ/Q8x70dGm3ANYwRyAH6Iszv4ea6TC8ttrrzqdTxzAf9BE/lJOWfW7EltRTv
UiEZrNNvOgcqY/vibkx+CPSoWqGIsl+ve7WAEFzrTb9zawNaFYnBJqZSRka5kEnM
TPqIxqCVdRNt9MId7Bc8RdcI1Z6r6Xtw5XAf3R4t2UGNmodVJU2Bldjx4noxz+vX
dmzltn3Nkcg4nRA2GHqBInqSMqWFiC9tQ8guhTJ+HB7oo+tSsd3wdn9wYWJhP4Gy
yZHaUtvOTk7xP71qcjjLCPckAfIOGSRZi+vHxjj7QXUqr1UVEBY=
=J1PF
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
