From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 1/3] drm/vc4: Remove the need for the GPU-subsystem DT
 node.
Date: Tue, 17 Apr 2018 14:48:17 -0700
Message-ID: <87r2ndijxa.fsf@anholt.net>
References: <CAL_JsqKJD86tV0jno_cZR=nLoOThT5rjRu3BPpzAwpcHgxSArQ@mail.gmail.com>
 <20180416225259.6571-1-eric@anholt.net>
 <CAL_JsqJxG1b2NO6CJTge=7PuYJgLfD9uzit_GiXbH8B79v+aZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010752103=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAL_JsqJxG1b2NO6CJTge=7PuYJgLfD9uzit_GiXbH8B79v+aZQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, bcm-kernel-feedback-list@broadcom.com, "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0010752103==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Herring <robh+dt@kernel.org> writes:

> On Mon, Apr 16, 2018 at 5:52 PM, Eric Anholt <eric@anholt.net> wrote:
>> The GPU subsystem node was a workaround to have a central device to
>> bind V3D and display to.  Following the lead of 246774d17fc0
>> ("drm/etnaviv: remove the need for a gpu-subsystem DT node"), remove
>> the subsystem node usage and just create a platform device for the DRM
>> device to attach to if any of the subsystem devices are present.
>>
>> v2: Simplify the DT walking code.
>> v3: Always put the node.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>  .../bindings/display/brcm,bcm-vc4.txt         |  7 -----
>>  drivers/gpu/drm/vc4/vc4_drv.c                 | 28 +++++++++++++------
>>  drivers/gpu/drm/vc4/vc4_hvs.c                 |  1 +
>>  drivers/gpu/drm/vc4/vc4_v3d.c                 |  1 +
>>  4 files changed, 22 insertions(+), 15 deletions(-)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Unfortunately, on further testing, this ends up broken.  My guess is
that our new platform device isn't on the same bus, so we don't get our
dma-ranges translation when we use drm->dev, and that breaks caching
behavior.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlrWa6EACgkQtdYpNtH8
nujR1A//XZ6VJgbtKHCrmrYGu3QvpXX1cFCKB+BMivjANjWjJlNwJVfg9xajHsZQ
O32ic/ovRfI1KASVqV4ibrDTwgT6lFCjLmp1Sqklztk8WIuCDFQAlH8t+bVDPA3c
9WEkSn3bmhl25n3tb3PJL+FoAdA4V7DkAKVMr1EY8YRn+bgQj1ap5xkHMlfXcgZu
TlbDko/5keAU9Qecam0toSeikdxgUDm1b8Z4E2ZUcEorTaWom4ArDYwt7eJbLbfJ
QZy9+7FcitQfgzppsR4+pRVnYhdgPwXho1RPONcjXugEsxq2q4koY5KYQ3xV1x0z
8tlH8BZ0ey+1V5eoi9YuSyxhpBVzdyQdPMBx/ixkd0MZlp4xb5yc1Wfyf87A3jyP
uVo4m7DKrJJvRGoQQPRbKnAvvbCnJzp7GniDQ9zVRCHdW5mXDOeIFX6T1uygZVg0
N33Ey0lTEIpCZVa8xRsqlam13UHVjdJuiCDFIAl1N9bevyylQJAXofHbX1hl6AaQ
ZlNoFW9drHavRUVx8abgbSnUHH0fkLDWKoHRqma4jTaHt9CN21zS7UoQq+RpPZNo
yfe1fNKO4hxiGoh3wUCx2FfKBE7vhfhvvnBwaPAAkAxOljit5Bc+STQ8qSFFAVC6
BRSAaLSVdBelnC3mHMtYY+/dF7ifAjUZZ16pKaYqJbT4Y4fPgPA=
=n0kY
-----END PGP SIGNATURE-----
--=-=-=--

--===============0010752103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0010752103==--
