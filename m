From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH RESEND] Documentation: devicetree: Fix Xilinx VDMA specification
Date: Wed, 12 Nov 2014 19:03:32 +0100
Message-ID: <5463A0F4.6060300@suse.de>
References: <1415800277-6817-1-git-send-email-afaerber@suse.de> <6067bede14b9421fa87db96bdc66dc66@BN1AFFO11FD040.protection.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="RV2nqRrBwfXN2aQKKTmifqoqvfstFLKwx"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6067bede14b9421fa87db96bdc66dc66@BN1AFFO11FD040.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Srikanth Thokala <sthokal@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RV2nqRrBwfXN2aQKKTmifqoqvfstFLKwx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 12.11.2014 um 16:57 schrieb S=C3=B6ren Brinkmann:
> On Wed, 2014-11-12 at 02:51PM +0100, Andreas F=C3=A4rber wrote:
>> The specification requires xlnx,data-width, but example and driver use=

>> xlnx,datawidth. Change the specification to match the implementation.
>=20
> Isn't this the wrong way around? The bindings are considered API, so
> shouldn't the driver be fixed to match the spec?

In theory, patch review should've never let the two differ... ;)

It's not my driver, so I fixed the perceived inconsistency the least
invasive way; Michal and Srikanth seemed to concur at the time.

https://patchwork.kernel.org/patch/4620261/

> Are there already dts files out there using either of these options?

In upstream, no. microblaze and virtex440 use a
xlnx,include-datawidth-matching-0 property as precedence for the
spelling, whereas there is an fsl,data-width and an unused msix-data-widt=
h.

Downstream, yes: Beyond my own patch derived from the Parallella tree,
there's some in the ADI tree. None in the Xilinx tree on quick check.

I haven't encountered any using the documented xlnx,data-width - but
this patch was authored pre 3.17, haven't ran a full Web search again.

Regards,
Andreas

--=20
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 21284 AG N=C3=BC=
rnberg


--RV2nqRrBwfXN2aQKKTmifqoqvfstFLKwx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJUY6D0AAoJEPou0S0+fgE/GIcP/A4aBSqMjpJYvawAVHdS4dp3
fGqSxhVoLj8tVXkraU6ayrT8NH8vPIP1zPPRuk9Cab5/XLNNqflnvpFIk5EhGU7j
tcdLM3qB4jc/vCwLeNVyp/BVJEqA+t0nMqaiZVHmLP8QEG5Wnaflo+LNx6bASjZj
kSoxOKJWchuGD60YnHwbMTMe69tJn2ahdls7JWHVwInUUfFuAO4m0RMKuDYkiJbo
yBxsiR5eF7D5uOQ28bNmYFgt1iCnMcUGdoqVlpV86Gzq/e/ctnwM/LlnXd9N5DY9
93asvp9HT+5Tpq4+dznNcuHpQpVTDmqDSlth5jvt+RKYZvRrW0P5fLTdRsfp1y0Q
MS9M0Y7ZTSnEUAGmED4QyjyiW2Y/88foGq07HdpdKwzuoA3Ouik41HFbCau8gTFL
+eb+gaRTbS7MReG+JbFyts+jebE5TFmswgNQQl74VvoBzxj6YV3olHqKr7jcui09
3AavU704pDK1btucqZ98qGiOHcEvGVHh/YbnqUxBNcc7SU/KqJBW/xw1//5pd8Zm
ZJttGg+6xrMN9KvMf8xvSqIH4rSohjo3GtuySCMHRoaaLHkxW6OkK5GGBRFhLA5P
2PAyI2MB1q+fEfmIit6Z28N4gvSjFzn+U9s/sX+0keAYx9KEQnrSx3mcL1EsaM0K
oPvXPHsQIt4/qVB6HcwB
=aJgM
-----END PGP SIGNATURE-----

--RV2nqRrBwfXN2aQKKTmifqoqvfstFLKwx--
