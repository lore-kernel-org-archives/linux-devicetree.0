From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 3/7] drm/vc4: Add KMS support for Raspberry Pi.
Date: Tue, 18 Aug 2015 13:56:24 -0700
Message-ID: <87y4h8iadj.fsf@eliezer.anholt.net>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-4-git-send-email-eric@anholt.net>
 <20150813075141.GX17734@phenom.ffwll.local>
 <87d1yqq5po.fsf@eliezer.anholt.net>
 <20150813211755.GE17734@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0322300097=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150813211755.GE17734@phenom.ffwll.local>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0322300097==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> writes:

> On Thu, Aug 13, 2015 at 01:44:03PM -0700, Eric Anholt wrote:
>> Daniel Vetter <daniel@ffwll.ch> writes:
>>=20
>> > On Wed, Aug 12, 2015 at 05:56:16PM -0700, Eric Anholt wrote:
>> >> This is the start of a full VC4 driver.  Right now this just supports
>> >> configuring the display using a pre-existing video mode (because
>> >> changing the pixel clock isn't available yet, and doesn't work when it
>> >> is).  However, this is enough for fbcon and bringing up X using
>> >> xf86-video-modesetting.
>> >>=20
>> >> Signed-off-by: Eric Anholt <eric@anholt.net>
>> >> ---
>> >>  drivers/gpu/drm/Kconfig           |   2 +
>> >>  drivers/gpu/drm/Makefile          |   1 +
>> >>  drivers/gpu/drm/vc4/Kconfig       |  14 +
>> >>  drivers/gpu/drm/vc4/Makefile      |  18 ++
>> >>  drivers/gpu/drm/vc4/vc4_bo.c      |  54 ++++
>> >>  drivers/gpu/drm/vc4/vc4_crtc.c    | 583 ++++++++++++++++++++++++++++=
++++++
>> >>  drivers/gpu/drm/vc4/vc4_debugfs.c |  38 +++
>> >>  drivers/gpu/drm/vc4/vc4_drv.c     | 249 +++++++++++++++
>> >>  drivers/gpu/drm/vc4/vc4_drv.h     | 123 +++++++
>> >>  drivers/gpu/drm/vc4/vc4_hdmi.c    | 651 ++++++++++++++++++++++++++++=
++++++++++
>> >>  drivers/gpu/drm/vc4/vc4_hvs.c     | 172 ++++++++++
>> >>  drivers/gpu/drm/vc4/vc4_kms.c     |  84 +++++
>> >>  drivers/gpu/drm/vc4/vc4_plane.c   | 320 +++++++++++++++++++
>> >>  drivers/gpu/drm/vc4/vc4_regs.h    | 562 ++++++++++++++++++++++++++++=
++++
>> >>  14 files changed, 2871 insertions(+)
>> >>  create mode 100644 drivers/gpu/drm/vc4/Kconfig
>> >>  create mode 100644 drivers/gpu/drm/vc4/Makefile
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_bo.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_crtc.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_debugfs.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_drv.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_drv.h
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_hdmi.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_hvs.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_kms.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_plane.c
>> >>  create mode 100644 drivers/gpu/drm/vc4/vc4_regs.h
>> >
>> > Made a quick pass and found a few things to update to latest drm
>> > developments. Of course didn't look at the hardware details since no c=
lue,
>> > but looks really nice overall.
>>=20
>> If you have anything about the hardware that you were curious about, I'd
>> be interested in trying to explain them in the comments to the extent
>> that I can.  It's unfortunate that we haven't shipped docs for the
>> display side of things, but had to do a lot of reading of the verilog
>> just to get this far, anyway.
>
> The only thing I spotted is that you right now only register a primary and
> cursor plane. I guess the plan we once discussed about exposing piles of
> planes for -modesetting accel isn't there yet?
>
> But otherwise I really didn't go into the hardware details.

Yeah, I haven't done piles of planes because what we have right now
means I don't have to do the bandwidth limits tracking yet.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV05v4AAoJELXWKTbR/J7o8AAQALF9HWqZ450RKhCO8+vKL7Tq
lAT7444oSnwcNAo7hAeqyRGCeywi1GWHcrzxf1ohL4mRIPmW1g6zMDXVbqzFiUqk
68MD861WH3/6nEhpiiFhuDDgAzxEcIRIB5FHChDY9zs5jFBYA1Eot4vEHHAy2Iq2
fJ+EF5Ik0riQylgO+snINlxgL/knU+gb4D7y+nsEz65mLRPbcF2RW8PBw9NCPir/
CoBb8ZlsKmRHfM/SKB+PnO2fCRWi0O+LHuzIui2rCZfNgVFGxa+3TDPPt5oEvWVq
+aRaYGYjlHj/WPx+yo0MWbfLi/dyiwXIEmgQjaeUox1+MhE39dJZe/3yX0w7UZoj
R/IiAk1tDDpHNH6/ZM76VEMbqse7B4l0jdAVWYkHkKM8t2h5Gbic7HA7KurhxZBz
EOy4/JKZcnAV9ygLOFzYfCTr/OYdlYhHr8myPSK7XKQ+n0uVATN/FryJf+nNQDIh
tK8fxhzjhxnPmJ5Srv9JOAMo3aE+4tf9PCiIouTBP8d5wemIiB7TlUtVR76XfKAN
qOIu7uk9PE/ee8Jl3HGNugGSfYMU9KynJgWVmeldtbfm+Dv9B3H0lxl5Q/38p7/l
WyrhwzAvT8hB8yCtDV3ryHBzOVSfDOwoi+JH7Z1RqS4JJVTRES1D7PPUTazFk51S
csGi3P6OQMkwX2Cmq+1D
=poMj
-----END PGP SIGNATURE-----
--=-=-=--

--===============0322300097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0322300097==--
