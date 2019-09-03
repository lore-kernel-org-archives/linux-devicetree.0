From: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Subject: PCIe DMA addressing issues on Raspberry Pi 4
Date: Tue, 03 Sep 2019 17:43:52 +0200
Message-ID: <cf743e0a1571c1748588f088cfd9804e8b55c36b.camel@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6280466402032068936=="
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robin.murphy" <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mbrugger <mbrugger-IBi9RG/b67k@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============6280466402032068936==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VNc7oUE10RoRira+Huej"


--=-VNc7oUE10RoRira+Huej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all, sorry for the long read, I kept it as short as possible.

So, the wrapper around the PCIe block available on the Raspberry Pi 4 has a=
 bug
preventing it from accessing anything beyond the first 3G of ram [1]. I'm
trying to figure out the best way to integrate this upstream.

Note that the only thing behind the PCIe bus is an USB3 chip. The bus is no=
t
exposed to users directly.

I see two options:

- Isolate the PCIe block on it's own interconnect. IMO this could be accept=
able
  as it's arguable that the bug is not really in the PCIe block.  I set the
  interconnect's dma-range size to 2GB instead of 3GB as dma masks don't pl=
ay
  well with non power of two DMA constraints:

  buggy-scb {
	compatible =3D "simple-bus";
	dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0x800000000>;

	pcie {
		compatible =3D "brcm,bcm2711-pcie";
		dma-ranges =3D <0x02000000 0x0 0x00000000 0x0 0x00000000
			      0x1 0x00000000>;
		[...]

	};
  };

  scb {
	compatible =3D "simple-bus";
	dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0xfc0000000>;

	eth0 {
		[...]
	};

	[...]
  };

  With this setup the PCIe devices should behave correctly as long as they
  don't play with their own DMA masks.

- Configure PCIe's inbound view of memory taking into account the buggy
  interconnect:

  scb {
	compatible =3D "simple-bus";
	dma-ranges =3D <0x0 0x00000000 0x0 0x00000000 0xfc000000>;

	pcie {
		compatible =3D "brcm,bcm2711-pcie";
		dma-ranges =3D <0x02000000 0x0 0x00000000 0x0 0x00000000
			      0x0 0x80000000>;
		[...]

	};

	eth0 {
		[...]
	};

	[...]
  };

  The downside of this is that of_dma_configure() doesn't play well with PC=
I
  devices. of_dma_configure() expects a device's OF node, yet the PCI core
  passes the bridge's OF node, as the device has none. The result is
  of_dma_configure() ignores PCI's dma-ranges. Solving this is not trivial.
  IMO the simplest solution would be to create a distinct OF node on PCI
  bridges, child of the actual PCI root complex.  FYI this was already an i=
ssue
  some years ago [2].

  This solution also suffers from devices setting their own DMA masks.

If you're curious abot the downstream kernel, they use their custom buffer
bouncing code, which AFAIK is something we're trying to get rid of.

Any comments? Alternative solutions?

Thanks,
Nicolas

[1] https://www.spinics.net/lists/arm-kernel/msg740693.html
[2] https://patchwork.kernel.org/patch/9650345/#20294961


--=-VNc7oUE10RoRira+Huej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl1uijgACgkQlfZmHno8
x/4ncwf/bFv3AD0ndtH89sJxuLuYsOfE/0zdO83AOPyEGnYUEp8yPyov0zO43okd
oQ2rfzZl8jALpzSy936hXZIIcJmWuOaTApRMaf14Rumq/RKR1zIG5e69ZlTskd5s
/ar4nASgz8/9ShY6LASonoXaTSSkbsOEWhBJPQjrS4Rf/Q9ggnLuzapHI6pDGdrJ
9DupdCcl7v1+Mfa+erRSGYrNgPWMnt85PaVQT2I+ICwc0UDWDND2hgIbuHsxnBre
1JFn0x26TIpqUCqegsZxOJOjNCQS+bTvoYzoi/xAhyuMMt+DFR7Jhk+l1TRrB/qs
x7bWu1wcIdB+gfhyeOrJUjm2qd5nFw==
=f55V
-----END PGP SIGNATURE-----

--=-VNc7oUE10RoRira+Huej--


--===============6280466402032068936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6280466402032068936==--
