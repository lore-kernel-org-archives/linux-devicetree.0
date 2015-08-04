From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 2/6] of/slimbus: OF helper for SLIMbus
Date: Tue, 4 Aug 2015 18:27:36 +0100
Message-ID: <20150804172736.GA20873@sirena.org.uk>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-3-git-send-email-sdharia@codeaurora.org>
 <CAL_JsqLDzLXR5aC__YhCUzGzVcVYcv_H7QS6zG0vezQPST_Y2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2EPcbN/asYWeYp7O"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLDzLXR5aC__YhCUzGzVcVYcv_H7QS6zG0vezQPST_Y2Q@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Sagar Dharia <sdharia@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bp@suse.de, poeschel@lemonage.de, Thierry Reding <treding@nvidia.com>, gong.chen@linux.intel.com, andreas.noever@gmail.com, Alan Cox <alan@linux.intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, Joe Perches <joe@perches.com>, David Miller <davem@davemloft.net>, James Hogan <james.hogan@imgtec.com>, michael.opdenacker@free-electrons.com, Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, khei
List-Id: devicetree@vger.kernel.org


--2EPcbN/asYWeYp7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 11:13:55AM -0500, Rob Herring wrote:
> On Mon, Aug 3, 2015 at 1:59 AM, Sagar Dharia <sdharia@codeaurora.org> wrote:

> > +Optional:
> > +- compatible   - Slave devices can use compatible field to have a name.
> > +               If this field is missing, name of the device will be
> > +               determined using slave's enumeration address.
> > +               (e.g. in the example below, slave's name will be:
> > +               0x217:0x60:0x1:0x0)

> Are devices discoverable and uniquely identifiable? This would be
> something like a VID/PID which can be read in a generic way. It looks
> like the address contains this info, but can you discover the
> addresses of devices on the bus? If not compatible should not be
> optional.

Yes, the bus is enumerable.  However in essentially all implementations
devices won't enumerate without some additional non-standard work being
done to power them on since applications tend to be extremely power
sensitive relative to the basic operating cost of the bus.  Which is
entertaining.

This probably means that the binding needs to say that the compatible is
optional but that for all practical purposes Linux requires it until
such time as someone decides it's worth supporting systems that can
usefully enumerate.

--2EPcbN/asYWeYp7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVwPYHAAoJECTWi3JdVIfQbxAH/0XK2Aied/DOwjOV3TKqJjx4
BkxQe9C1idF3Ly946NzLo8fSph/rnKYATlYYXfaVdus5nArpAUNPxzm4UMbWooEH
ZTMmM6Q6EN6vU39AZpogudRuqQ1EkYKT7yM40btsc/0VQVCbcJQeyjbzpfWxFWoD
3osfZmZbzT5+lLG10EBtIuv6US5q+j0vKWQNh96dpSK4TMK7DN0pzRnyl3gutBHy
rzYJQEPDT2d9C5qANH2dGLKnG0an2zLJpmJVqMkaadF3bQapBvsnlO2bW3L2i25U
ObFEQXaNxe1zMFRupBS+8HQMme9G8hMw+sIUdxWu40yCcnEDHaQGPv9qXUMM6vc=
=cwv0
-----END PGP SIGNATURE-----

--2EPcbN/asYWeYp7O--
