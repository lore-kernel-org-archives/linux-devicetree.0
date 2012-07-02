From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [syslinux] [RFC 0/2] syslinux: Add device tree support
Date: Mon, 2 Jul 2012 08:49:07 +0200
Message-ID: <20120702064907.GB8683@avionic-0098.mockup.avionic-design.de>
References: <1338478896-11417-1-git-send-email-thierry.reding@avionic-design.de>
 <4FEE2E42.2000707@zytor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4659327832278957307=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FEE2E42.2000707-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
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
To: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, For discussion of Syslinux and tftp-hpa <syslinux-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============4659327832278957307==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 03:37:54PM -0700, H. Peter Anvin wrote:
> On 05/31/2012 08:41 AM, Thierry Reding wrote:
> > This patch series adds support for passing a Flattened Device Tree (FDT)
> > blob to the Linux kernel. Currently, only the linux.c32 module can do so
> > and some additional checking should be done to only pass the blob if the
> > kernel supports boot protocol 2.09 or later.
> >=20
> > Thierry
>=20
> Hi there,
>=20
> I just merged a modified/more generic version of your patch.  I would
> appreciate it if you could test it and report back.

Tested latest master (59b77fc) and booted the system successfully. Can
this still make it into the 5.00 release? Any chance of getting this
directly supported by the ldlinux.sys?

Thierry

--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP8URjAAoJEN0jrNd/PrOh/54QAJQVB+TVHJGHDj2r6xL4sWbe
TxkeXkFA3/dBY6jn8N+3A4ArnsM9nB+ITRBT0wbPcDYmqgQhXTnPMM8PXlgXd7Kk
j2AzH5v02u6EJpUEtLSNX5BsZ2nPvEWMWFbiiA6+6gg8aWM6hdEvauBUjLP4UaWi
oisFSUeJlSLnEVbFv/OIIbAmvaSyZ3LJ2TbKszA9vcKT1cMVOZW1d1jfLtxHJhfE
kbGPmAjao/aVZpOi9R+bCInXRqReVvabsGSALII03OvOYqiVihu7F4KS80vv9aot
fDrefIDc0YtiqyRxvcC0m7KdOkYNp4IUowQRfjXKq8HuQrbde4i4Of/sQ539UjGl
atTW/ywFslpNCpKlxHbUqcB5xg7XOQuZf/Qs1z7cnFCKpyPDNChneuLshnk0li6S
kg4QVN7IkgJCnyiOKHNxuE6DOUDKRRDuNKemPS5N9q9krgsuYetmiZSjmquGYSwb
suyVYxFKY93/H+1akNNru44m/geRkey039qzr2uoSINaz+Agxnrzn0QtjsOma+0h
k6epqXyBmu1Onz4khk+/H8OEs2aQ4DoydwdzEsZbzPh5uCQMzPeIXMdNaPCCr8uz
aKM0/5uIbiwPRS8h4Dm/7bsSHYjp2010k0+Tqy9T2Mt1UuMEFWIJ/PLCPF4HIjNX
rhbiFb9eZheldbEMUFaq
=QSMe
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--

--===============4659327832278957307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4659327832278957307==--
