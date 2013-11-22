From: Mark Brown <broonie@kernel.org>
Subject: Re: [rtc-linux] Re: [PATCHv2] rtc: Add support for Intersil ISL12057
 I2C RTC chip
Date: Fri, 22 Nov 2013 12:47:10 +0000
Message-ID: <20131122124710.GK14725@sirena.org.uk>
References: <87k3g5l9gw.fsf@natisbad.org>
 <87txf576uk.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lZZ4ablUVnt2XgAh"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87txf576uk.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Kent Yoder <key@linux.vnet.ibm.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org


--lZZ4ablUVnt2XgAh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2013 at 11:00:51PM +0100, Arnaud Ebalard wrote:

> Sorry for the delay, but I was somehow removed from the recipients in
> your reply. As I am not subscribed to rtc-linux, can you keep me in Cc:
> next time?

This is because you're setting Reply-To the list so my mail program
replaces your address with the list address (or the list is set to do
that which is totally broken).

> Well, I am not familiar with regmap but if you can point me some simple
> rtc driver in existing ones which uses regmap, I will take a look and
> come with a regmap-based v3.

include/linux/regmap.h - there's a lot of drivers using regmap in the
kernel, I think most of the RTCs using it are doing so as part of MFDs
so there's thin wrappers around the I/O functions.

--lZZ4ablUVnt2XgAh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSj1JKAAoJELSic+t+oim9eiQP/2tiKX8TKxpvkh545tCaluWW
eDYbHfkSS53rGrmy3u9gworxVZyN9LWIMkQv6oulYNpUpkAraOoDSt8zXVhUaEdn
2so+ECCMaNLpK9cyA/zdJg4HSAiqc+6ihVe/f3FsLXZWHQyDtD4QDqPLwtiftlbi
QzH3/BoHOzKXAKBi9jY05XlWNMoy7BrGwmChGekutrEobzqges4SdzxM7SmScLRS
42smz4R1Mker8ONC2j82YgW1M3pafpE6XjPROQ8nFRecAjfWO1P+VO8iVDqD44wp
8mTQzmVmm/btgPaxF6s7XyGCGb65o4q166+kR6RDiPoQp0ZKaZK/JCdMb8CdWBdV
FezAoA9ODcB1okNfLEyFZe2qixA4Toz4WHyTHf90wTlqzdws3JriVaC2bYalg5iG
bBb6I84OHjBbGcpXrGaLBnqmvwsHV7yGj8zbdcTYIlcLZoSGeiDM6QLg1ZF3y23K
O7Yy1HxIiwImxqZ+DvJH2S4zHH0JkQz6++1fakFheu70OQQWeAvEnF8ll3Or5yNW
IjigvNhcrbGXN02V+kez6bkn/ywscW4w4CNzvchULLHjYwy2FHtWdRLWS0UPZy8T
evJjGzi8wozmZWRsZVGUYW7LvQb1tjigrOR5eteRjxc8JEOBiFZxiEQecu0JqoGs
oApKpI6/KKTyAsIhjoQR
=jFDD
-----END PGP SIGNATURE-----

--lZZ4ablUVnt2XgAh--
