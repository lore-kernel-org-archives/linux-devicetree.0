From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Tue, 30 Aug 2016 23:00:31 +0200
Message-ID: <20160830210031.GJ18605@lukather>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
 <CAL_Jsq+1MeicZmr+7Q4K6FLnTfD4jBBAQR1KPHMSLfNNUe4ENw@mail.gmail.com>
 <CANq1E4Shy1+rQsshWxeFRhFvuAg1sB3ffnVT7hoMZSjZAR=yuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0800082167=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CANq1E4Shy1+rQsshWxeFRhFvuAg1sB3ffnVT7hoMZSjZAR=yuQ@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0800082167==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, Aug 30, 2016 at 09:30:44PM +0200, David Herrmann wrote:
> Hi Rob
> IOW the device handover code somehow needs to know who was responsible
> for the instantiation of the simple-framebuffer device, so it can tell
> them to remove it again. On x86 there is only one place where those
> can be instantiated. But on OF-based systems, it can be dynamically
> instantiated in many places right now.

I don't think that's true. There's the assumption that the bootloader
will have set up the framebuffer and Linux just takes over. Even on
ARM, you'll need to at least reserve the memory, grab the clocks and
so on, and it needs to happen way before you can load overlays (for
the buffer even way before the simple-framebuffer driver is probed).

I don't see how we could use overlays with simple-framebuffer, unless
we apply those overlays before linux starts, but then Linux basically
doesn't care if it was an overlay or not, it's treated as a single DT.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxfPvAAoJEBx+YmzsjxAgG4EQAKMmSfkzF/kpBCgjbN+KgdNP
bs/t6B+TU9MI/Ho4/Q0CAowwyIID9FGTMGnNnxvYm9pbYF6il+CQ4PxyXV9kj64Z
hqMDj0VhaiCrXHCGEKLdGOszZH330pnNrT6QfbFneTZEcAJ8pUQTJO19IvqWFdV8
QoshtajPDOlUEh6I2QOhNm335y/rgnSQuAI2zO8cY7pYaI1wp5AwTpx78dWm7gWl
bFs/y2nbEU5TbEuJ1tZCvFk/cD1cxtXLEGJtqfuzdKXwN7xWXqzfheOnvJrrw1sz
FbwjgyPw8yKcLeK7tw4zLT3JSynFqCCXaw4oiKF8AaXPa7YgtBTj0gQ3yP9cofG3
ZstYI3bCIqqwgefy58/K5GjBgzX4CF0AiCvT2/Y6INZNKB1MCNm5ledS0pQvZBdh
ZnYqGTj0ncD/+McqI0jnYstUXszjyg1Razajxa19uRSHZZBeoaM2b8/hwRGpcZNn
fz0Q2vUEpw6RYzoMmFNL48YcbO3wXqU44AKG1WfA7qairCDXi1HR+Uzp9edrQ98Z
GysqGumi+yKrcPzFVIRXGKc4Cx2MlLQe/lKNgNc8UMmHCzh2GvL47BTLWUZeQhMA
ZNDEHXIp5FFyKnNEBC9G6gvWuo7BB889yoxR5wWpGlv+vx/xa9TyTyqIzkuB2qj8
PhW8HugcL0iqpQa6DJsv
=Kwjz
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--

--===============0800082167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0800082167==--
