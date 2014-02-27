From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH v4 3/8] staging: imx-drm: Document updated imx-drm
 device tree bindings
Date: Thu, 27 Feb 2014 16:10:41 +0200
Message-ID: <530F4761.2020000@ti.com>
References: <1393338203-25051-1-git-send-email-p.zabel@pengutronix.de>
 <1393338203-25051-4-git-send-email-p.zabel@pengutronix.de>
 <530F1C4C.2010504@ti.com> <20140227115652.GI21483@n2100.arm.linux.org.uk>
 <530F3A93.501@ti.com> <20140227134348.GK21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7745964102822732760=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20140227134348.GK21483@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, kernel@pengutronix.de, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7745964102822732760==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="aS3SLMohvRxDT1RhB0BlTMj2LgVaaW62P"

--aS3SLMohvRxDT1RhB0BlTMj2LgVaaW62P
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 27/02/14 15:43, Russell King - ARM Linux wrote:

> That may be - but the problem with CDF solving this problem is that it'=
s
> wrong.  It's fixing what is in actual fact a *generic* problem in a muc=
h
> too specific way.  To put it another way, it's forcing everyone to fix
> the same problem in their own separate ways because no one is willing t=
o
> take a step back and look at the larger picture.
>=20
> We can see that because ASoC has exactly the same problem - it has to
> wait until all devices (DMA, CPU DAIs, codecs etc) are present before i=
t
> can initialise, just like DRM.  Can you re-use the CDF solution for ASo=
C?
> No.  Can it be re-used elsewhere in non-display subsystems?  No.
>=20
> Therefore, CDF is yet another implementation specific solution to a
> generic problem which can't be re-used.
>=20
> Yes, I realise that CDF may do other stuff, but because of the above, i=
t's
> a broken solution.

What? Because CDF didn't fix a particular subproblem for everyone, it's
broken solution? Or did I miss your point?

The main point of CDF is not solving the initialization issue. If that
was the point, it would've been Common Initialization Framework.

The main point of CDF is to allow us to have encoder and panel drivers
that can be used by all platforms, in complex display pipeline setups.
It just also has to have some solution for the initialization problem to
get things working.

In fact, Laurent's CDF version has a solution for init problem which, I
my memory serves me right, is very much similar to yours. It just wasn't
generic. I don't remember if Laurent had a specific master node defined,
but the LCD controller was very much like it. It would be trivial to
change it to use the component helpers.

My solution is different, because I don't like the idea of requiring all
the display components to be up and running to use any of the displays.
In fact, it's not a solution at all for me, as it would prevent displays
working on boards that do not have all the display components installed,
or if the user didn't compile all the drivers.

 Tomi



--aS3SLMohvRxDT1RhB0BlTMj2LgVaaW62P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTD0dhAAoJEPo9qoy8lh71WLYP/3RuVUeY8oFdtEc4YfUBNw9I
3Z2WlrZVgjrUxQibZhJlW8r21v87A3nYHy1kyUQe/4nBaY+g9TrWWZGOY8IkbxA6
KfkFO9qoKjYAXukDExOHUjbpkWvty35vD2+IXyGIPJSzFiP13DRz0dv2JV8z8lwk
kM63lkdP///cvehXDspfvVEh5/4O99gKiwGeMkCU90BvpsZBVz4gWB/ZRgPpswS1
tvVGvEWg6gHvxpuhgSXDs4VIS7xMY55AnXFhYlPxnP1dCYD4KvR7i7iUnsfnSaI+
BdQs8hiPiReCrWonNiY9psMmZf+ZtV+x9kRWNHj8B1nc8p+LT/5iiXpnRXXOyCr+
sYXd8rGLZy5aLBuE4ceoGtzFBsV8CB7DALHHPvLoINyRFNGSO00spfN1Xzm5kG/I
9JnG0j7TiNW2T6yXP+pHJKtJNJ1YT/TaWRcAcmcX5rn3DJ6OBkVBbxgAcAW/JZYs
0knqTPUK2QWk/y4FShu1UKeno26+hWUFTsIwDoHJyFuuJx/nlgS0LAQjCW22K/K3
8b0XZOKyrCCKBHLw2a8NUlfBWWHq7KQTl0mJTFJtSvbdfOHiJqEg96JqkyyNKGrL
z7nF6gTf9qVYHmFkLa6uM0Nz8NhkFrOagz+BOc+ScPuyIZCLaNg5PpsXjiH9GA96
5hcjVjVhQh0KNvDWrbZP
=sWpd
-----END PGP SIGNATURE-----

--aS3SLMohvRxDT1RhB0BlTMj2LgVaaW62P--

--===============7745964102822732760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============7745964102822732760==--
