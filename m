From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Tue, 23 Feb 2016 13:11:24 +0200
Message-ID: <56CC3E5C.3060101@ti.com>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
 <1455541259-8967-7-git-send-email-architt@codeaurora.org>
 <20160222025345.GB15973@rob-hp-laptop> <56CAB678.3080505@codeaurora.org>
 <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
 <56CC23CD.5010708@ti.com> <56CC37BB.3060305@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0pgpiVW26VaSMi6w86cDHnxUB1vF4VG7R"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56CC37BB.3060305@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

--0pgpiVW26VaSMi6w86cDHnxUB1vF4VG7R
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 23/02/16 12:43, Archit Taneja wrote:
>=20
>=20
> On 02/23/2016 02:48 PM, Tomi Valkeinen wrote:
>>
>> On 22/02/16 22:10, Rob Herring wrote:
>>
>>>> If we want all DSI host controllers to use a common binding to descr=
ibe
>>>> lanes, we'd need to go with the most flexible one, and the driver
>>>> restricts it to the subsets that we support.
>>
>> True, but I wonder if that's necessary. The lane property for the SoC
>> should be read by the SoC specific driver, right? So the DT property c=
an
>> be anything. I'm not sure if there's ever a reason for a generic code =
to
>> observe the DSI lane setup.
>=20
> Yeah, it is very SoC specific.
>=20
> The only place where it might matter is if a panel/bridge ever needs to=

> know what pins implement what lanes on the platform. A common binding
> there might help us keep the panel driver generic. Although, this need
> itself is a bit hypothetical.

My opinion here is that if the panel/bridge needs to know something
about the DSI lanes/pins, we should have that data in the
panel's/bridge's endpoint data.

So if both SoC and the DSI peripheral need complex DSI pin/lane setup,
you might have very similar data on both sides. There's possibly some
duplication there, but I think it keeps things much simpler.

For example, if the SoC needs OMAP style DSI pin data, and the DSI
peripheral needs to know the amount of DSI lanes used (but nothing
else), you might think it's nice if the DSI peripheral would peek at the
SoC side data, finding out about the DSI lanes.

But I think in that case you should just add a "num-lanes" property to
the DSI peripheral. The DT data for a device should be private to the
driver handling the device, except for some special cases like following
the graph.

 Tomi


--0pgpiVW26VaSMi6w86cDHnxUB1vF4VG7R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWzD5cAAoJEPo9qoy8lh71qc0P/RGk80HOlthvE6JSbiO/gpKA
fSNBhVdEFavqB0+FPcVN6FagLwkpWdqKIx/TcIjkekzxKXQz4hCN9niF/MpsoWwc
Ptwh8uEyUlc1hHW17bKjJWwzLx8yG999eqpDUj02y95nT7fxUCTuz04v6RQRvXDz
gNyZCO2OljkG4s7/lpg2DHp6yFEXacAGVW8OKTLMEU2ZgTwOi1W2G4ola0I7T1Wl
2mqlOn3vgg4lNnAPvhZRAtHCgm08LKlbUTSV73L1Ctcz7yBYXLNNfI19N0cz8n2n
cBb/OK+2dQ9KU3WxJcUtb2IUOAplKVO0hogPRG68RYXwvFRow+hxNj1UGT6RR2aK
r2VO8wM0OKX9O38aJNGFT+vTa0FHnFC1kuJHy08NnsxkMDYJ3vpGoDlmm4vqa61f
BvmP4kPqyqFJf5eqHAZcBt0yM8A61COWvCwg/tGR2fmdxkpREIoM3yqAGW+I+5t5
wJ3QgAqnKTJRHTOsE+I6QMrT1H/DnRrsSqfERDn4Sm50g6EAIiUcE3tvBxtY2XsM
ICpaEvKY+ghs9gkdcLEsSJ/o/saQwjjhaeuBbnOfVw2hyMWunJvtqglSKlDbJMmX
yWATL0e6ST3KepNwjltwTk2GRcaquPnA1Fqd/+o75+Qs5mcSKEU+MBtgr1DJGuYY
FpC/s+3sI9dz8PDzBraM
=sZrz
-----END PGP SIGNATURE-----

--0pgpiVW26VaSMi6w86cDHnxUB1vF4VG7R--
