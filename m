From: Eric Anholt <eric@anholt.net>
Subject: Re: [RESEND PATCH v2 5/7] drm/vc4: Document VEC DT binding
Date: Fri, 09 Dec 2016 15:37:15 -0800
Message-ID: <87bmwkvfmc.fsf@eliezer.anholt.net>
References: <1480686493-4813-1-git-send-email-boris.brezillon@free-electrons.com>
 <1480686493-4813-6-git-send-email-boris.brezillon@free-electrons.com>
 <20161209210028.ehylahb6o4mv5eil@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1390627523=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161209210028.ehylahb6o4mv5eil@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Scott Branden <sbranden@broadcom.com>, Stephen Warren <swarren@wwwdotorg.org>, Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1390627523==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> writes:

> On Fri, Dec 02, 2016 at 02:48:11PM +0100, Boris Brezillon wrote:
>> Document the DT binding for the VEC (Video EnCoder) IP.
>>=20
>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> ---
>>  Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt | 14 +++++++=
+++++++
>>  1 file changed, 14 insertions(+)
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks.  Pulling the series now.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhLQCsACgkQtdYpNtH8
nui+OhAAsiDmuUuD2oiKRTGNuDipVV3ziw2Bv62O3UZtoM+6VPfa0eeIMsqZWE2I
lwZziJcV5zy2eec2w7FnrhDlQ5IIhtvohEEXlfyQ25VDPW9MwMFmcaMof4xS+1Q/
AyEd/xJiGr51lfwH5HrQK9vYgrXUd9z/bu0BdvZ7g9vMoj4K3Xy+05pCP01+yFLJ
r2oporNb+iwaePIR+DmocD+PyoaJiAXWTDMqgHmE3Gjle8IxekqZcAY5uXQOG9MK
IccCC1XfFIx9Ei5EvgFLH40OvgliQ9Kd7Yr3gXRPdrlt3lsWx3JImthLEKUxwje2
dAVxFiSNtjM2Iq5f1eWh7I73l5A/8wTmEVA+WpFnYmvUJwzFqDreho2ugNg+oudz
4tbts4Wgo+meupXC3vlgcEyiu624VDlcHO8E45LyqlhjY5uluqQU3zlo0uUenjwW
J7RH0QQbCGzOXeYT8TyHvsiH9z+nAPMemSL6Dy2Yx4DAoUXdzEd/+FArs2fqVyvL
oRAnLYRhRXYeyv5IxR9qNTysNimOwslzUA/W5QgTJceaGViXXpfOMbQvzf1u2m1G
y60fTzRCqjrgQan7agTGXlCUqQi43lB7f2BzaUw3R1251pcXBebIXUIX6hNvPRJR
ydNfv3mlBnt2lE1AIAUhZk/3j5MIHs6ftD6NLjaVOIOeRA2GzrU=
=p6X4
-----END PGP SIGNATURE-----
--=-=-=--

--===============1390627523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1390627523==--
