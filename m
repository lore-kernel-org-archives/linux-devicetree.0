From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv4] rtc: Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 16 Dec 2013 23:23:31 +0000
Message-ID: <20131216232331.GK3185@sirena.org.uk>
References: <1dec5992db795b61e91e0abf910dee7fce322ccc.1387227955.git.arno@natisbad.org>
 <20131216213706.GA8527@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/1RY4l6R+cI/ZU5B"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131216213706.GA8527@roeck-us.net>
Sender: linux-doc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnaud Ebalard <arno@natisbad.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--/1RY4l6R+cI/ZU5B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2013 at 01:37:06PM -0800, Guenter Roeck wrote:

> Here is a snippet from the saved patch:

>  obj-$(CONFIG_RTC_DRV_IMXDI)    +=3D rtc-imxdi.o
>  obj-$(CONFIG_RTC_DRV_ISL1208)  +=3D rtc-isl1208.o
>  obj-$(CONFIG_RTC_DRV_ISL12022) +=3D rtc-isl12022.o
> +obj-$(CONFIG_RTC_DRV_ISL12057)  +=3D rtc-isl12057.o
>  obj-$(CONFIG_RTC_DRV_JZ4740)   +=3D rtc-jz4740.o
>  obj-$(CONFIG_RTC_DRV_LP8788)   +=3D rtc-lp8788.o
>  obj-$(CONFIG_RTC_DRV_LPC32XX)  +=3D rtc-lpc32xx.o

> Something is adding those '3D' after each '=' into the patch.

That's quoted printable MIME encoding of the =, presumably your MUA
doesn't do MIME (or the header went AWOL, though it's there in my copy).

--/1RY4l6R+cI/ZU5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr4twAAoJELSic+t+oim9gusQAJ1x++f15EA8AXsUnz9T/2Oe
A1krKEWO2+cqk4Nv+XNRW86Tl0RP/2fTtU518g/lGsRoebBudznBY09icbtCX941
YZGVJc6q3TPR1kLvTe+9Umf0NFddrsQjU3VWLlia3W92oi3diWjRk8FdCcbMd6MK
Oyka5qnFzvzFCjs9YNFoZD1pDjCxzepDhttKVYZqZ1hsu4e+dgZJUHaf6YaufTrr
Yif+VEaYp1HFIgKNvawekzOT4pl96l0aGt4ZZM771Xpc+eaXpCTF/pBBkVStwsKQ
EoQYscwXYS7JISIJ81PE0pVsJm0pqWW197az7v+BhyLVtJ3TBRAuKtHYIUFCtQ0H
y+9cMePiovgMjWNoGcDhwx97BKRLsSl2Ssz98NCpgPYlMFLxRVSSCgOwrfX0U7cY
OPhwl7bLqwz7OVDTp+J+zO0LSutjX/W2+Z8FofW2jC7Gt44OgqEoWHRxmVpalU4s
BTCyHZzzCF8KRQtYvH2WcgvMa+lscoWnuE6usv2/ne5WqfODJAPcrqxIrZXh6Iai
BZxwhwjXGge1kButC9QSqXJubcq9y027y2jbfdoXmBzbi5jGXKhs9szlPiN/Ek+O
2zHZCI9M7VrTHjpewGIgAaEIHaUSIgCIYlIbPvS+87eCIZDvx9gF6iQnnPCivM5b
YS7QvdeRvjDLP8J0AGhS
=zysD
-----END PGP SIGNATURE-----

--/1RY4l6R+cI/ZU5B--
