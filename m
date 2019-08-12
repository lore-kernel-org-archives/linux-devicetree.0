From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
Date: Mon, 12 Aug 2019 13:24:11 +0200
Message-ID: <20190812112411.ty3npkq6ztbushhm@flea>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
 <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
 <20190812091631.j2pr7i2zeput3hrc@flea>
 <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2267208261649099083=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2267208261649099083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="chbync4osl7cj5bo"
Content-Disposition: inline


--chbync4osl7cj5bo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2019 at 11:21:50AM +0200, Daniel Lezcano wrote:
> On 12/08/2019 11:16, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Aug 12, 2019 at 10:59:51AM +0200, Daniel Lezcano wrote:
> >> On 22/07/2019 10:12, Maxime Ripard wrote:
> >>> Newer Allwinner SoCs have different number of interrupts, let's add
> >>> different compatibles for all of them to deal with this properly.
> >>>
> >>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >>
> >> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >
> > Thanks!
> >
> > Can you merge this through your tree (along with the bindings)? I'll
> > merge the DT patches
>
> patches 1-4 then ?

Yep, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--chbync4osl7cj5bo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVFMWwAKCRDj7w1vZxhR
xRg7AP9AGyLnuIz1tKYeJZXcdHCdmVcPwADY+KkLmegiEm4mkwD/R7lwmli2RLhK
8NMsjP1LNwEklTeR3aMbTsfrI1uvTw4=
=0T8v
-----END PGP SIGNATURE-----

--chbync4osl7cj5bo--


--===============2267208261649099083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2267208261649099083==--
