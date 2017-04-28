From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v2] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Fri, 28 Apr 2017 11:03:19 +0200
Message-ID: <dbd307d0-6360-8105-aeda-274097c8ac07@rempel-privat.de>
References: <CACRpkdYnK=7C=F5hZUo-nYv6Z+Pb+eT7vm1e4hL8N-QgJnuLfg@mail.gmail.com>
 <1470384404-6796-1-git-send-email-linux@rempel-privat.de>
 <CACRpkdZn7-SL5kmGn7Pysz=QiQFBEm8+c6bw=hE5F0CV4ct0RQ@mail.gmail.com>
 <60d2e24d-91c8-7563-9ecc-f203b12e0983@rempel-privat.de>
 <CACRpkdZcnJ1eCNW4ZF_A4zbeCt3JcAuw-1meB_Pn7ctMy99B_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247649043493596360=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZcnJ1eCNW4ZF_A4zbeCt3JcAuw-1meB_Pn7ctMy99B_g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1247649043493596360==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xXc6cMRedQI8Fujsks8hk4b6hqvN4C4fw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xXc6cMRedQI8Fujsks8hk4b6hqvN4C4fw
Content-Type: multipart/mixed; boundary="rR7mScJ7N5xjV9c40SCPL1uKXfAqqtKX7";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Chen-Yu Tsai <wens@csie.org>
Message-ID: <dbd307d0-6360-8105-aeda-274097c8ac07@rempel-privat.de>
Subject: Re: [PATCH v2] arm: dts: sun7i-a20-bananapi: name the GPIO lines
References: <CACRpkdYnK=7C=F5hZUo-nYv6Z+Pb+eT7vm1e4hL8N-QgJnuLfg@mail.gmail.com>
 <1470384404-6796-1-git-send-email-linux@rempel-privat.de>
 <CACRpkdZn7-SL5kmGn7Pysz=QiQFBEm8+c6bw=hE5F0CV4ct0RQ@mail.gmail.com>
 <60d2e24d-91c8-7563-9ecc-f203b12e0983@rempel-privat.de>
 <CACRpkdZcnJ1eCNW4ZF_A4zbeCt3JcAuw-1meB_Pn7ctMy99B_g@mail.gmail.com>
In-Reply-To: <CACRpkdZcnJ1eCNW4ZF_A4zbeCt3JcAuw-1meB_Pn7ctMy99B_g@mail.gmail.com>

--rR7mScJ7N5xjV9c40SCPL1uKXfAqqtKX7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 28.04.2017 um 10:45 schrieb Linus Walleij:
> On Fri, Apr 28, 2017 at 7:11 AM, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>> Am 08.08.2016 um 19:51 schrieb Linus Walleij:
>>> On Fri, Aug 5, 2016 at 10:06 AM, Oleksij Rempel <linux@rempel-privat.=
de> wrote:
>>>
>>>> This names the GPIO lines on the Banana Pi board in accordance with
>>>> the A20_Banana_Pi v1.4 Specification.
>>>>
>>>> This will make these line names reflect through to userspace
>>>> so that they can easily be identified and used with the new
>>>> character device ABI.
>>>>
>>>> Some care has been taken to name all lines, not just those used
>>>> by the external connectors, also lines that are muxed into some
>>>> other function than GPIO: these are named "[FOO]" so that users
>>>> can see with lsgpio what all lines are used for.
>>>>
>>>> Ps: most of the text was taken from Linus Wallej patch.
>>>>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: Chen-Yu Tsai <wens@csie.org>
>>>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>>>
>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Hm... i assume this patch was lost. Should i resend it?
>=20
> Yes, but I'm not applying DTS patches. Make sure that the
> sunxi maintainers get it and merge it.

Chen-Yu Tsai - ping.

--=20
Regards,
Oleksij


--rR7mScJ7N5xjV9c40SCPL1uKXfAqqtKX7--

--xXc6cMRedQI8Fujsks8hk4b6hqvN4C4fw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlkDBVcACgkQHwImuRkmbWktBAD/b9C/I0dXWHyFNoUsTITRNTND
bVOyhSLPd9kNZtfoHXEA+wcaKcHKt3mZxyfbgX7u5mzGc9yJ03gD1RsWMovhVv3n
=6n1U
-----END PGP SIGNATURE-----

--xXc6cMRedQI8Fujsks8hk4b6hqvN4C4fw--


--===============1247649043493596360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1247649043493596360==--
