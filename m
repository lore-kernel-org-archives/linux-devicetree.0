From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] slimbus: Linux driver framework for SLIMbus.
Date: Wed, 30 May 2012 19:13:40 +0100
Message-ID: <20120530181340.GT9947@opensource.wolfsonmicro.com>
References: <1338340310-4473-1-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nSQp8DZZn7gZbDHt"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1338340310-4473-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: davidb@codeaurora.org, bryanh@codeaurora.org, kheitke@codeaurora.org, marc@plastictigers.com, gclemson@audience.com, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rob@landley.net, grant.likely@secretlab.ca, rob.herring@calxeda.com, ohad@wizery.com, gregkh@linuxfoundation.org, linus.walleij@linaro.org, rusty@rustcorp.com.au, joerg.roedel@amd.com, trenn@suse.de, ak@linux.intel.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--nSQp8DZZn7gZbDHt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 29, 2012 at 07:11:33PM -0600, Sagar Dharia wrote:
> SLIMbus (Serial Low Power Interchip Media Bus) is a specification
> developed by MIPI (Mobile Industry Processor Interface) alliance.

This patch is about 150k which is rather large to review.  It would be
enormously helpful for review if it could be broken down into a patch
series.  For example, things like the device registration could be
broken out into a separate patch as could the core bus operations and
things like the clocking/bandwidth management.

I've not actually looked through the patch yet, partly because doing it
all in one sitting will take some time.

--nSQp8DZZn7gZbDHt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPxmNNAAoJEBus8iNuMP3dWncQAJz+MUy1mv9h5xcNZiY/kJR7
YQuFHPMND62UShnWdoygqvEQkH4dOqJ28hZvh9n8qwWazJGf6o8FLTBPM71htCZ8
L9eGgGJASvF5us0dleOtJLUNj3//tbIxAFXozOyAPJmXrYsp1h3V50CWMqarFRL0
CMRLKJT/pW69NtusPvQPYD6UDOIuaUTlihP+zz6ccXzm2g7tC0rRLnpIp4mMlG2z
GzOI35Kb0zyTGE16F69Mgyl29K/GvHP3MBn5PFJPWsNLe1QM9i+WRJouxRwLW0ZV
aMD42VRyuCpCF7lAiBanh048t0KulxrhQ1a4vwmbMONTkm+Xu6ZpjZUw16SNI2vF
U9tVVEpbRsE6LAZo2FMwHlg0l+q2EsH1VKX37/m2zma3RMDwPwt9LC5/kJFi9F/I
x5Y1ZEhekBul2RE92e3kLzHfqUn5L1/NVY6Vu8iSe2mcCS+LeN4SOqpkDGmF3/AH
3fCaInROWD2ZMrBxN7mcTJ3Li/+4hkScjPSHDsyrqFX26wB2ZsiwMpTGhlm0Hb/+
v9VIgkJ/pKUAvBiC/YeHl0cERVV7zu02dlLfStJXx2AQFvAShBCkpC8QvMnN1s97
mk40jYMXeDXCmOwusWC8jAE0u6sJ9RYRklAp+BwLzOV7GmSG2xMgvfI4GGwT7nWx
CTUA7Gr0bLtmXvXLaZAs
=TAq0
-----END PGP SIGNATURE-----

--nSQp8DZZn7gZbDHt--
