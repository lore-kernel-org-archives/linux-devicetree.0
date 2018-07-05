From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] dts: fix status gpioleds on nanopi-neo-plus2
Date: Thu, 5 Jul 2018 16:50:31 +0200
Message-ID: <20180705145031.2qf2kblvebttt6dv@flea>
References: <20180703132636.21587-1-jakllsch@kollasch.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8748923188509228996=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180703132636.21587-1-jakllsch@kollasch.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Jonathan A. Kollasch" <jakllsch@kollasch.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============8748923188509228996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="im7tnp2yrzd45qt2"
Content-Disposition: inline


--im7tnp2yrzd45qt2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 03, 2018 at 08:26:36AM -0500, Jonathan A. Kollasch wrote:
> Signed-off-by: Jonathan A. Kollasch <jakllsch@kollasch.net>

So, the prefix of your commit title should be "arm64: dts: allwinner:
<title>", and having a commit log explaining what you're doing, why
(and in this case the source) is going to be needed.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--im7tnp2yrzd45qt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAls+MDYACgkQ0rTAlCFN
r3Rfog/+MlKv5xYFoFWaOguW9J4UksS1LK6LppAeXxWEyn8EaRamp5KoWjsC9KDI
G2xO/4buy+JpA0YgI8n4B+yg+iDROV4HzFQEumeImfl4r94DYhx+xW49YeaS09hO
EDuZOCgjGKq14MLs9EBXCPX6gWR1uaRoDnWIy6jcS9YLMRMo+9hkDvudEJM3T6s4
RxoxkWHYy4VkppEb+E24/G0GvUEWwWS277g3xuh+71LS4eFLqW0uulxuKGODChe3
fvN6U8K92/OXb2yOrtmUjyNHv1lfp53vI131ulh/CQxgzahPtb4aD3jyd9BBsPHC
QOiPIo7XMbzHeHn6kbKRdkLCH1grWPWU2I1Yw+prWArKoDtZ8W8yx0S09V/DXYEM
tevBGbFUh9RNpRw3DMtD8UzU5g1EPVheApKIHhgn/F5rlwFVerdNg+isEuKclnI6
pqs4UbIU8jcdZO73TcVLdOXv3bB0LfMqZgXru00fC0i20LGip7aPFFTNGMTBOEmw
9NVyOhO1VfBWNRtNbpPdGVSAgwfRYgFkBsnFnQiFaIBiuacjpHqw3vuSHMBUBd74
T9TUkcpKtkVEoxOO+5GGgXvWLTOkAxdxkNAQ42XvnD4t4xRdMU7zTTPfo+CMFG0v
ypbsmK5A1JJlarXDLo1lMuNojoCfWYXEg7YIZm9nmKMiD4d/OFI=
=RhFw
-----END PGP SIGNATURE-----

--im7tnp2yrzd45qt2--


--===============8748923188509228996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8748923188509228996==--
