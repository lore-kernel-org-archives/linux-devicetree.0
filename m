From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: Remove useless phy-names from
 EHCI and OHCI
Date: Wed, 17 Apr 2019 09:58:29 +0200
Message-ID: <20190417075829.u3oww5jtuhy3lxll@flea>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
 <587c094b69f88c2b534e1de5b441cf823ecf4d8e.1555403233.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64AP6MurTo7c0y+MvjMKm-TT6Jxxgiz=UMLCk26mr7VFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5003271031061066867=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v64AP6MurTo7c0y+MvjMKm-TT6Jxxgiz=UMLCk26mr7VFg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb <linux-usb@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============5003271031061066867==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eba47hpznmvzb4f6"
Content-Disposition: inline


--eba47hpznmvzb4f6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 16, 2019 at 04:43:48PM +0800, Chen-Yu Tsai wrote:
> On Tue, Apr 16, 2019 at 4:28 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Neither the OHCI or EHCI bindings are using the phy-names property, so we
> > can just drop it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>
> for all the DT patches in this series.

Applied 4, 5 and 6, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--eba47hpznmvzb4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLbcpQAKCRDj7w1vZxhR
xSknAP46wW+xjJk4ujXBKrw2YeCaBRQPeNeoGmTT313kvTnjJQD+N+HQ+4lZ+rML
KHcEOLC/HfFn1kq0OwG8WtmELDlmzQI=
=E/As
-----END PGP SIGNATURE-----

--eba47hpznmvzb4f6--


--===============5003271031061066867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5003271031061066867==--
