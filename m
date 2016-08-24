From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RESEND] [PATCH v2 2/4] dt-bindings: Add jdi lt070me05000 panel
 bindings
Date: Wed, 24 Aug 2016 13:56:39 +0200
Message-ID: <20160824115639.GC3169@ulmo.ba.sec>
References: <1469978126-925-1-git-send-email-simhavcs@gmail.com>
 <1469978126-925-2-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1654917929=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1469978126-925-2-git-send-email-simhavcs@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Archit Taneja <archit.taneja@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============1654917929==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline


--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 31, 2016 at 08:45:21PM +0530, Vinay Simha BN wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
[...]
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  XRES, Reset, Low active
> +- enable-gpios: phandle of gpio for enable line
> +  LED_EN, LED backlight enable, High active

This is a little confusing. Shouldn't we rather completely omit any
mention of the polarity of these and let the board design handle this?

If the reset is low active, then I'd expect that to be reflected in the
GPIO specifier of the reset-gpios property, like so:

	panel@0 {
		...
		reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
		...
	};

With that a driver can simply deal with a high active reset, which it
currently doesn't. The problem with the current description is that it
is unclear who's to deal with the polarity. In order for this to work
properly with the current driver you'll have to specify the GPIO as
GPIO_ACTIVE_HIGH, which is not what the binding says it should be.

Thierry

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvYt3AAoJEN0jrNd/PrOhR+oQAIZGxWGem3RPv4X3UCOk3A7O
AOuychUF9nsuh7isT0DOBUYMI9W5sFPGX3yQnX621KdZBsGpOoy219qdIcwCv5wc
LLyR2+MCCqgBso4rgSSfds8p5gKuLT/IOR8htjmLdAC6eZZBxfpSEmDifszGPWp7
tcUopG8092zBHOTFddu1QUxlrh3i9DGofF0JyN0I1fEcY5RaHDyKnmOHC+zKTiRh
md2KLeG/szMY6Lfw5v+6U+hB00NjNlUr5hZH2glMzEE357SNCoaXGT8FiRLXCLtE
HHe6fR3nHQvgia83NvlPwTW77GtgpkZJicT1/LKxUwnT3JI2MqNvLdjbIpeQdSjq
+IgtFNMDiRfXbAONCs+mQtRmil2LcakYJhXimjin2kMcO7t7kSaDWzkHQIgbH71O
JcKCHo1ogfIA1fZmnUXZFRUYc7sjv/TtyWbny1B6Bx800U2qelvnSgFHd6c7o0XS
+rrzTBbQdDsdEleDcSt6PtQhG/loZi0YyEC3ZNt+bRyac/4Cj4R8ZlfTvrwjB/4l
S+39FJr9Ou4AML6PR5Y1aXBirjmM4O+zgmGJbhHmy+MQQymGLwxDWbzepGdfKMfp
DQR12UnJ0aB0LfvqmN7iPx8/uVclzHo6n0gL1PHjyeftsu4K2E2MWVH25/9AtF3B
rUof0jSgDZh/YPoFNX78
=Y2ul
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--

--===============1654917929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1654917929==--
