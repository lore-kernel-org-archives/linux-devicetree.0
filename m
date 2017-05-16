From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: bcm283x: Reserve first page for firmware
Date: Tue, 16 May 2017 15:19:51 -0700
Message-ID: <87pof8bg1k.fsf@eliezer.anholt.net>
References: <b6aef857-1454-7931-2c60-6d7b55b7a0a8@raspberrypi.org> <e2718c25-fdf1-ead1-cbfa-d23bf729a079@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e2718c25-fdf1-ead1-cbfa-d23bf729a079-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 05/09/2017 02:04 AM, Phil Elwell wrote:
>> The Raspberry Pi startup stub files for multi-core BCM27XX processors
>> make the secondary CPUs spin until the corresponding mailbox is
>> written. These stubs are loaded at physical address 0x00000xxx (as seen
>> by the ARMs), but this page will be reused by the kernel unless it is
>> explicitly reserved, causing the waiting cores to execute random code.
>>=20
>> Use the /memreserve/ Device Tree directive to mark the first page as
>> off-limits to the kernel.
>
> This reserves a 4KB page here, is this good enough, or should we just go
> directly to the maximum page granule size possible on an ARM64/Linux
> system to be on the safe side?
>
>>=20
>> See: https://github.com/raspberrypi/linux/issues/1989
>>=20
>> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
>> ---
>>=20
>> Changes in V2:
>> - Rebase against linux-next
>> - Drop downstream-only patch
>>=20
>>  arch/arm/boot/dts/bcm283x.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.=
dtsi
>> index a3106aa..6d12c3e8 100644
>> --- a/arch/arm/boot/dts/bcm283x.dtsi
>> +++ b/arch/arm/boot/dts/bcm283x.dtsi
>> @@ -3,6 +3,8 @@
>>  #include <dt-bindings/clock/bcm2835-aux.h>
>>  #include <dt-bindings/gpio/gpio.h>
>>=20=20
>> +/memreserve/ 0x00000000 0x00001000;
>
> Can you put a comment above this /memreserve entry here to remind about
> what this is useful for?
>
> Thanks!

Phil, I chatted with Florian and added in:

+/* firmware-provided startup stubs live here, where the secondary CPUs are
+ * spinning.
+ */

and tagged and sent a PR for 4.12.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkbewcACgkQtdYpNtH8
nugDyRAAleiNHPlpPK8wSnnjlCURwYeqy9o4KSAxQJ83yggSc13JR7iXjnaqISrR
8SgHuLX9yHULzDPu7lk5EJ2DTkh7TyZyV5D0L3LriC1jV2LxIxhCCCdSQyFyJW29
UnYu5FzbRpX+N8R07w6GaxY0jVZa21GZjzsDd2c2znEt/qid58bWosq2qjrFndQ6
a0tjbtG5oEeFeuWs1NdViRGpU7/jpxWu72BGK+KY+UGj0+xScH/VRb+DfqjuEwuQ
E+2aNqycBhsolHjB2wJK8YtUJnVlmsf+eTBlIQKKxZmmmBFmtZr8XZb2tOg+DBvn
VNcMZVAZJVrLKqNUnaD3YEWsjY74af2rOOI01dHvVOE3jga0qjeAbl/ynTFevtR/
gt7xKmOCUwTy0QcX8hUjMsBsT5dSxkVCDkpwlhdjIyg9aIb2DWfqI6GiPTRE7eNA
rx3I+JHVsYJH+83nmaMtO4A5uAdgmqni9NyW94GtrF/oCKONJVHGgI4cVKvcsquV
hMJfbNreWmVXPVgimcens4RLqvs9Rl3IBVN03i1PcOUbb1higWcHcBCSJSZD1vGh
yunZlf52v6Qh4CTktwpsHnZQfmSJ3gTwxAmcz00t/ViTShWi2G/0v8eVELYSFM1o
LNytMY5mGtl3zDSPTly7td04oKplteUHMgp6793ugMUSnchx6mo=
=iY4m
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
