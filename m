From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 02/10] pinctrl: mvebu: dove pinctrl driver
Date: Tue, 18 Jun 2013 19:33:59 +0100
Message-ID: <20130618183359.GR1403@sirena.org.uk>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1347550912-18021-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1347550912-18021-3-git-send-email-sebastian.hesselbarth@gmail.com>
 <20130618113606.GA26763@n2100.arm.linux.org.uk>
 <CACRpkdZTVN2O-Rv4u-Ccb9EzV0At3zc7GYQyTq=HkseOi=GTeg@mail.gmail.com>
 <20130618151116.GZ2718@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4885860729906618282=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130618151116.GZ2718-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============4885860729906618282==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sEhs5GQW+P4Mb8ab"
Content-Disposition: inline


--sEhs5GQW+P4Mb8ab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2013 at 04:11:16PM +0100, Russell King - ARM Linux wrote:
> On Tue, Jun 18, 2013 at 05:02:49PM +0200, Linus Walleij wrote:
> > Nowadays I would do the above with regmap_update_bits().

> > Mutual exclusion for read-modify-write of individual bits in a
> > register is one of those cases where doing a regmap over
> > a memory-mapped register range makes a lot of sense.
> > (drivers/mfd/syscon.c being a nice example)

> So, for that solution we need to have some kind of global regmap per
> register or somesuch.  Then you run into regmap needing a struct
> device - well, with a shared register, which struct device do you
> use, or do you have to invent one?

> That sounds more heavy-weight than is really necessary.

Yes, regmap is far too heavyweight for a lot of these things - it
shouldn't really go in performance critical at the CPU level paths, it's
designed around things where I/O costs are considerable and worth
avoiding.

I do think that this is a very good idea - with the I2C/SPI drivers I
was reviewing prior to regmap there were always just far too many simple
bugs with read/modify/write cycles so factoring out the code really
helped with review.

--sEhs5GQW+P4Mb8ab
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIbBAEBAgAGBQJRwKgUAAoJELSic+t+oim931YP9jgT/xuYt1YPLvhNf0/K6YN5
t/d+KbC9qgJ1bsujku0xCFXAJozmt3b1WdvVYgz4CAgHLBmLMk3zeGeRTkjT1F+v
HJAwDGyHu6uX27GDSkGSemJoo2w3OUbJurcs8684dFLtOqYXYkdvPg4csyGilG29
8CnybUedH+wM3Lpd08r1NyKU4imuwzeCoLAV9LO7jAy9BikmyHDWtaW6QHYtQjz9
xD50jgxVKXWT+6zEUCFTrZVExmfFcJFoh7VPhI54ZjJId5Ljb4xS41uVUZB+fMz2
BrRDp156qr1CjC2moNgd0eFW5HO6iB8RPxg8spFpFAz06mupBvgj/mGK8bsTd9P/
3xXBhszaXSe08H7bd32KS7fEkEoRGnPI2eKzThF24atjN6vTUInyfnucYresPwA6
JVE2bNIfnAVF0DXcSksQm6FyNrcIn9po69ZjonR6vAH8NXrE/oc8767Q5voASzxw
mAbYf658nPJ/d9fA+lgoI/ALFFgbT6qrDrWh4ooVHhw0rSquwiWKJbCda085Ifvc
EMIKfRYcJKFDBPyEwzYoZ9c+LlDw5YXVzTrXz5o/5yTUX+xktwks01JdmhkyIaSW
G1FmomSA54Nvw+4wa1SsLIXRyfRFNTEVoyuyxA4zQDbjdbmYn6aMUuT4BdSLy6EU
yhvZavCs2IgnZS+xdXg=
=LaNA
-----END PGP SIGNATURE-----

--sEhs5GQW+P4Mb8ab--

--===============4885860729906618282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4885860729906618282==--
