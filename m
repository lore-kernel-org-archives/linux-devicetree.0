From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 01/10] dt-bindings: rtc: Move trivial RTC over to trivial
 devices
Date: Mon, 27 May 2019 14:18:32 +0200
Message-ID: <20190527121832.lui2n6vhlemlqy2z@flea>
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <20190527120626.GM3274@piout.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6556917812857835536=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190527120626.GM3274@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============6556917812857835536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lkvgcmvusuvyrlvg"
Content-Disposition: inline


--lkvgcmvusuvyrlvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Mon, May 27, 2019 at 02:06:26PM +0200, Alexandre Belloni wrote:
> On 27/05/2019 14:00:33+0200, Maxime Ripard wrote:
> > The RTC generic bindings has a bunch of devices that have a pretty simple
> > binding, with just compatible, reg and optional interrupts properties.
> >
>
> This is not true, they all also support the star-year property, this is
> why they are not in the trivial-devices file anymore.

Ok, I misunderstood the binding then.

Should we create a separate file for the trivial RTC, on the model of
the trivial-devices but supporting all the RTC properties?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lkvgcmvusuvyrlvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOvVmAAKCRDj7w1vZxhR
xR4EAP4zT5mvMhjADSiQtWNQoHhx4O3WIXNxDlmF2Y/IklLfggEA2KCa9zYz9Tkj
BndNt8yFYR4V5e2m/WBFWOstF9vzFwM=
=E1rs
-----END PGP SIGNATURE-----

--lkvgcmvusuvyrlvg--


--===============6556917812857835536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6556917812857835536==--
