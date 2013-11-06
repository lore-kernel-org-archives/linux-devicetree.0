From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: address translation for PCIe-to-localbus bridge
Date: Wed, 6 Nov 2013 13:23:18 +0100
Message-ID: <20131106122317.GA8806@ulmo.nvidia.com>
References: <527A1983.6020603@keymile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <527A1983.6020603-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2013 at 11:27:15AM +0100, Gerlando Falauto wrote:
> Hi everyone,
>=20
> I am currently trying to describe an external device within a device
> tree in a Kirkwood design.
> Such device is accessed through a local (parallel) bus. Since
> Kirkwood does not provide such an interface, we added a custom FPGA
> (PCIe device) which implements a PCIe-to-localbus bridge.
> So essentially BAR0 provides the configuration space for such a
> bridge, and BAR1 provides a remapped area where accesses to the
> localbus can be performed. BAR2 and BAR3 provide other functions.
>=20
> So with the appropriate reg encoding of the PCI device, the PCI
> driver for the FPGA will automatically get an of_node.
>=20
> My question is: is there any way I can describe this external device
> (I believe as a child node of the PCI device), so that a call to
> of_address_to_resource() (or equivalent) from its driver will
> automatically translate a localbus address (e.g. 0x0000abcd) to
> whatever address was assigned to BAR1 (in my case 0xe0000000 ->
> 0xe000abcd)?

Perhaps I don't understand properly, but what good is the local bus
address to any driver? I mean you'll have to have a PCI driver to bind
to the PCI device, right? And that PCI driver will only need to obtain
the register addresses from BAR1, then access that region.

Why would you need to have it translated via DT?

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSejS1AAoJEN0jrNd/PrOh5LsQAIRurfrtJtLnsBxKXXSqXEVe
0JsDA9mIyAR9f57EX5r9Sbg/hUuSymO8jfqqBiUCbUNefqxpwOaQyYOuvCEBela3
PHMuUJJNzEsViBt1yyJgZDX7yO7nrMyijYr65NLcT3O5LCcTCDflfVffQKLWZfe7
gzadnq5FAsNLbBJtJmovBiN7SN+MrEn9gxqQnvPnMA/gkiBwfbZt+P0il+yvDXlF
ARsB46tmM7Z86eH0C7mfs/3HFFbUv4ABqVF9nYPnyewHOoskhGqgT2ni/Nty6RX4
1mHcmoe32v49eXDNGTYsYqcJBbyFR57MUCDXbWtmdA+HfelnQPydj46Tu2yZjqOc
GHd+ZNJmQ+cV4IIgDT1BfOBwbGgbCFQgramhIRQjKZZS+7JHcWORwaKNu6K/PS8l
r6SeF71SLMGrVBqe9fVVmkSoJUoeM+iNZigkK5LsM0pcQSmijZlARuQIbzEBcWqp
dmF5hhGv/HXF45DGmVVDF5rRyK3OUz3oRZyBUw089KA3pbdiC85XN3uEB0YHhIbL
p56/QQaiwRDiXXO5Pw6GCkxHTwUCR2LEUGP6SgI3/AVNkIoIA0wv5jMgyjo6aYwL
x5o6r0O6zljLhC6IvisvgV0D3hY4Ta7ow8TIkLHv6xlLn7EGW4CYeUE5OCYTXDaS
YKOjZvzXGbC1fdMpbrF6
=XDag
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
