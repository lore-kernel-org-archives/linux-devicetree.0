From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Tue, 26 Jun 2018 13:12:57 +0100
Message-ID: <20180626121257.GE1779@sirena.org.uk>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com>
 <CACRpkdZY0+q=VKrNhk8w-NSn0zbjCqdgdyApBTs+tVRBWm8ReA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4310310766145412980=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZY0+q=VKrNhk8w-NSn0zbjCqdgdyApBTs+tVRBWm8ReA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michal Simek <michal.simek@xilinx.com>, dev <dev@lists.96boards.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Andy Shevchenko <andy@infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============4310310766145412980==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pY3vCvL1qV+PayAL"
Content-Disposition: inline


--pY3vCvL1qV+PayAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 26, 2018 at 10:02:20AM +0200, Linus Walleij wrote:
> On Mon, Jun 18, 2018 at 2:21 PM Arnd Bergmann <arnd@arndb.de> wrote:

> > - You export symbols in the mezzanine_* namespace, which I think
> >    is a bit too generic and should perhaps contain something related
> >    to  96boards in its name to make it less ambiguous. I suspect we
> >    would add a number of further connectors for hats, capes, lures etc,
> >    which could all be described as mezzanines.

> Michal also brings up the (discoverable!) FMC connectors Xilinx are
> using. So the idea would be to create something generic to help
> probe and populate them all whether partly discoverable or not.

There's also the plug in modules in the Wolfson Cragganmore, there's
enumeration support for that in mainline.

--pY3vCvL1qV+PayAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsyLckACgkQJNaLcl1U
h9DWlQf/RzpHvr0dbL7nShj15PjGrr3sWRoQKSV9yHJdslVmhHPFOiLUdNdKxJx+
CduvL25RvWsZf0SG3215N21YjT8smuHnIx9xfExA1dWgI8xmuvz8raHMlCQuOj8L
InzqAnwGMt1FZDgiYK/5TRJ2NRJUobozU51ajcPNaxqryvA3elc8T/V7Zv4D7Bs/
CosBSFz4QgJ8RGXt3Ue9NrZBfWckHK0ZjXn9S0Zc2HhDYu6yZtkch2PMp3WauTQu
dcozC4rEDuc0S7Xu68BSf+8/GIs7lOggPtUNyls7hI0g2PEneIyDxFafmEKB8wgk
sv5lhXzTDnK7S5u/kG0Wg7Y8qCyGyw==
=FFUK
-----END PGP SIGNATURE-----

--pY3vCvL1qV+PayAL--


--===============4310310766145412980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4310310766145412980==--
