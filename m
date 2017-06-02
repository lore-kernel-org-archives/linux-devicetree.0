From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v4 3/3] USB3/DWC3: Enable undefined length INCR burst type
Date: Fri, 02 Jun 2017 13:07:24 +0300
Message-ID: <87a85qvh2b.fsf@linux.intel.com>
References: <1484727138-3264-1-git-send-email-jerry.huang@nxp.com> <1484727138-3264-3-git-send-email-jerry.huang@nxp.com> <DB5PR0401MB1813965DDC8CC6CD0BD85980FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com> <87y3xeqvsl.fsf@linux.intel.com> <DB5PR0401MB1813AAB5AA84B0B310ED1B10FE440@DB5PR0401MB1813.eurprd04.prod.outlook.com> <87tw71xthj.fsf@linux.intel.com> <DB5PR0401MB181366E27C238DF8B2228B00FE170@DB5PR0401MB1813.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB5PR0401MB181366E27C238DF8B2228B00FE170@DB5PR0401MB1813.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerry Huang <jerry.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jerry Huang <jerry.huang@nxp.com> writes:
>> Jerry Huang <jerry.huang@nxp.com> writes:
>> >> >> --
>> >> >> 1.7.9.5
>> >> > Hi, Balbi and all guys,
>> >> > Any comment for these patches? Can they be accepted?
>> >>
>> >> Rob had comments which you didn't reply yet. I cannot take this
>> >> patchset yet ;-)
>> >>
>> > Balbi,
>> >
>> > I look into his mail again, which was based v3, and I replied it.
>> >
>> > He had different understanding for undefined length burst mode.
>> >
>> > It seems he think for this mode, just setting bit[0] (INCRBrstEna) and
>> > don't need to set other field.
>> >
>> > However, according to the DWC USB3.0 controller databook, when it is
>> > undefined length INCR burst mode, we still need to set one max burst
>> > type, such as INCR8, which means controller will use any length less
>> > than or equal to this INCR8.
>>=20
>> Rob, do you agree with the patch now?
>>=20
>> --
>> balbi
>
> Hi, Balbi,
> Any comment for these patches? Or any chance to merge them?

I'm not sure you understand how development is carried out here. I
*can't* apply patches touching Device Tree properties without an
Acked-by from any of the Device Tree maintainers. Until then, there's
nothing I can say/do.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlkxONwACgkQzL64meEa
mQaaRg//R3mclqymF77i+Z5ZtaMh+H/BNu+iP4NocdTnOk8UCsU7rBWCq1lJg9Pp
4dXBzVNRoltz2VbAn87VTwIzkNrdYQpdjPqVpJsd+guCEeIKY+4SPi6DpTfCDrM6
xCykvpIWYnzUKw2QO8jTYTg0svbQd3sZBGJtPIeRypaiPbWkBpHDe7xMmRHQaiEt
FLTRqBxa1BcfekyoQIgJvCaRZn+SwbGyk7U89DsReSfhvFR5VCMKKFyikI0sZOFw
uboMAXiHffmpPyNv3AqjpwBpj4Ae9uEyV0a0BYTdHmK1QV2gXuhfMsdLdJsGdS96
mYLZwUcykXeU6xoe8pH5VUyuTiIhbtSRzvG0KzhDzt/5GjF5qjehRWLg6eT2xgDz
2/sM1L+wU1/ChKG+9sY2w29/446etGfG2meovrb1ySqs89BrHVhnLUsknWvFjluW
kPbMwXzRn2nUoyLIZQbbpR1pzhYkkuDMK0+x2lOSwAJfw2U2qOHvtXR/P/5qcqIN
awVhlp3WoQV9IssIEN+PRMMSxJzPlGCI8dCVIod08M39/Bq+Ph3rEGnODscn3hgQ
vnpID8Gdd/3VnvQV61MTPsqzEdyqL564OhW3A7d5EUR3xXqJ09qSwyjLj/HfxzEt
9HydxyGPOCwuIf9QyxS8i6XBxcgWGFIGdBB2YDTxs1yYU5JkvJg=
=E9mq
-----END PGP SIGNATURE-----
--=-=-=--
