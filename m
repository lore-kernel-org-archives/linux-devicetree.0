From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/3] drm/vc4: Don't try to initialize FBDEV if we're only
 bound to V3D.
Date: Wed, 19 Apr 2017 10:55:31 -0700
Message-ID: <8760i046zw.fsf@eliezer.anholt.net>
References: <20170418191157.18517-1-eric@anholt.net>
 <20170418191157.18517-2-eric@anholt.net>
 <CAKMK7uFSsA3c+wMfq_O9kSvu0cWLUA-bRqTHyryqi+1ZVeir_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1681970871=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKMK7uFSsA3c+wMfq_O9kSvu0cWLUA-bRqTHyryqi+1ZVeir_w@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

--===============1681970871==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel@ffwll.ch> writes:

> On Tue, Apr 18, 2017 at 9:11 PM, Eric Anholt <eric@anholt.net> wrote:
>> The FBDEV initialization would throw an error in dmesg, when we just
>> want to silently not initialize fbdev on a V3D-only VC4 instance.
>>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>
> Hm, this shouldn't be an error really, you might want to hotplug more
> connectors later on. What exactly complains?

drm_fb_helper_init() throws an error if the passed in connector count is
0, so drm_fb_cma_helper() printks an error.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlj3pJMACgkQtdYpNtH8
nujfMA/+JBynPdfY/qNyvUQ6z3JU/2H9meAiKvhua14mirgn3jzq6DjnYYMQe5XM
8ueAV1X8fX6jy4udBFGw19nxGeBcrKwg6eT0HICZzIwADVmfO6m+GgnAiXcwkc+k
Pn4uEdzSyTozxix7MGNz2GEQWByepy28KxVib/SCPcd6FGteSH5vEsWQh/DuQkSN
Fs3fW3R0LS9Cd25Hci5630jQfNujlbSNzO9u4UxYtGL/dEoZ/7AIsu/I8sX00OGU
UAYImL0SrbjoiFKNQru52dPqWf/m5pAmRai6ZZaLjaVcTC011+SLilyqP4AtdSWm
fmoUVeSyrlb8AXDMDpK5tqyrkVDhC/2F7ZrSUFs6xxZWxA/usLkM5AKMv9A9rNOH
YmF3PNkBZuP9jYNZF4zi3s8YWzZFS8gcNoynnLNcHKQ5RSOIheoeCHYBqHq4IqR9
gxKfnldC2m0ovCS39nM7R5kZ5wtq2u+VLPxGiKleE/yZ/LFNGkk2nsSDAiOnbzVC
qWGrCS6jDQRvn9o0RBSgo9pwmIJ8d+5KzrwKWohnn+2MKZJ4cPAY9wfXrvjX9Bp8
fTuchspswniPm7LcmvggUpRErHvKRXMO0aD17Au9ZE4n6I2thlIbhA4FQfESxLk8
2H9cijNZXwLFoM0FFoFusRchx4eSo+tTLfJtXHaV+9jIfzkQEpw=
=696r
-----END PGP SIGNATURE-----
--=-=-=--

--===============1681970871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1681970871==--
