From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] devicetree: cadence_ttc: Document binding for timer
 width
Date: Thu, 18 Sep 2014 07:07:40 +0200
Message-ID: <db43281a-06bc-436b-a082-212d1f95d974@BL2FFO11FD034.protection.gbl>
References: <3537996136ec435ea660da869102d0a019214979.1410964243.git.michal.simek@xilinx.com>
 <20140917161737.GA7983@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="I6N0pA3pweUb3RretUeX63i0c81lrO6p1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140917161737.GA7983@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--I6N0pA3pweUb3RretUeX63i0c81lrO6p1
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/17/2014 06:17 PM, Mark Rutland wrote:
> On Wed, Sep 17, 2014 at 03:30:49PM +0100, Michal Simek wrote:
>> From: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>
>> Modern TTC implementations can extend the timer width to 32 bit. This
>> feature is not self identifying so the driver needs to be made aware
>> via device tree.
>>
>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>>  Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt | 4 +++=
+
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/cadence,ttc-timer=
=2Etxt b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
>> index 993695c659e1..5439976eca6b 100644
>> --- a/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
>> +++ b/Documentation/devicetree/bindings/timer/cadence,ttc-timer.txt
>> @@ -6,6 +6,9 @@ Required properties:
>>  - interrupts : A list of 3 interrupts; one per timer channel.
>>  - clocks: phandle to the source clock
>>
>> +Optional properties:
>> +- timer-width: Bit width of the timer. Either 16 or 32 (default 16).
>=20
> Are we expecting TTC implementations with widths other than 16 or 32?

IRC if you use 32bit timer and setup for example 24bit width it should wo=
rk
too and you are just ignoring that upper bits.

>=20
> This looks sane to me, but we might be able to just have a 32-bit-timer=

> property if we don't expect arbitrary widths.

Definitely model different timer width is easily possible to do in qemu
that's why I think having more generic property timer-width is just bette=
r than
having property used just for one case.

Thanks,
Michal



--I6N0pA3pweUb3RretUeX63i0c81lrO6p1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlQaaKAACgkQykllyylKDCFVWgCfS1L5RGKBS39l+QPshq2fBsZn
W+YAnRKGrMh1wMN6pouINT3Dr0T+3Rxu
=5O5P
-----END PGP SIGNATURE-----

--I6N0pA3pweUb3RretUeX63i0c81lrO6p1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
