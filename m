From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/3 v2] drm/vc4: Turn the V3D clock on at runtime.
Date: Tue, 18 Apr 2017 17:02:42 -0700
Message-ID: <87k26h463h.fsf@eliezer.anholt.net>
References: <20170418191157.18517-1-eric@anholt.net>
 <20170418233805.15767-1-eric@anholt.net>
 <7906db2f-cfb8-e2e6-5869-b6e829dd8c6f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023400929=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7906db2f-cfb8-e2e6-5869-b6e829dd8c6f@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Florian Fainelli <f.fainelli@gmail.com>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--===============2023400929==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Florian Fainelli <f.fainelli@gmail.com> writes:

> On 04/18/2017 04:38 PM, Eric Anholt wrote:
>> For the Raspberry Pi's bindings, the power domain also implicitly
>> turns on the clock and deasserts reset, but for the new Cygnus port we
>> start representing the clock in the devicetree.
>>=20
>> v2: Document the clock-names property, check for -ENOENT for no clock
>>     in DT.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>
>> +	if (v3d->clk)
>> +		clk_disable_unprepare(v3d->clk);
>
> The clock API allows you to pass a NULL clk and do nothing in these
> cases which is what you seem to have done a few lines below, you could
> simplify these checks?

Sounds good.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj2qSIACgkQtdYpNtH8
nujV4RAAkkIby7kKKKKgp2s4KVHHopiOR5gSYGkgu1MEMOJa53ThvLvnpytrxtGV
LXRyTBIDcdahKDUQ/7kXU4InSbc54Mxr2SGU8RxiNDLLqPdTRb99XIAqxw3kfK45
x/cWZV91n4i0aSfM8kRDgbs1aLLHLwVh6yZ3AI1gEMsFam8W2y0aHk2mEJmGWBAN
BXgFY7mqnrmdwAf9lnV0bmYxr9vmpy4NiRRkgES1vnZWHSpWzymoVR7RvaBqyzL5
pzTH4sHNYuihp+utkOMRNO0QGoRbGDN34ICq/IZ2561ay3oJFEH4VrsEmh65aJs9
uU4PD2ZOPUIeJMKMutynca9BjW50NQ+X/aIUV4/vwBdiiCnzmbeO890e9jJ5x+nv
jw/ZscFsm9gGct8NVJSfPScJ7mHIHNAIHIJumyUZE5DCal8/C9hY/QaL1UCzCqJl
8cQTrG2oIFbPXl6st4rXBNQ2d7oWdCqJabaksi9XxAA78Pz15vtKULSoNORtdDGI
RPG55qsESIXToEROxJ+P5Aqr33NFh2CbBdDtg2N1/Yd4wvCQYHH4/T0sLnMlcq9f
p8ONxmsJzu4Qx174FSzvOV7oojeyda7TlGNOQ5kxs7mrMopSjV0LvJNTyB6ekR+x
ZnYcQu2tUcQSyVsNHYd6RR/owxkr13qCbWKW0hzpMqNLrxGI/q0=
=1nGc
-----END PGP SIGNATURE-----
--=-=-=--

--===============2023400929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2023400929==--
