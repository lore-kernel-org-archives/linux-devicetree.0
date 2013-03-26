From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv6 10/17] arm: mvebu: add PCIe Device Tree informations
 for Armada 370
Date: Tue, 26 Mar 2013 22:12:34 +0100
Message-ID: <20130326211234.GA1295@avionic-0098.mockup.avionic-design.de>
References: <1364314719-1049-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130326163421.GA30255@obsidianresearch.com>
 <20130326201654.GA7109@avionic-0098.mockup.avionic-design.de>
 <201303262050.12847.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4689596054319607768=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201303262050.12847.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============4689596054319607768==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2013 at 08:50:12PM +0000, Arnd Bergmann wrote:
> On Tuesday 26 March 2013, Thierry Reding wrote:
> >                 pci@1,0 {
> >                         device_type =3D "pci";
> >                         assigned-addresses =3D <0x82000800 0 0x80000000=
 0 0x1000>;
> >                         reg =3D <0x000800 0 0 0 0>;
> >                         status =3D "disabled";
> >=20
> >                         #address-cells =3D <3>;
> >                         #size-cells =3D <2>;
> >=20
> >                         nvidia,num-lanes =3D <2>;
> >                 };
>=20
> Shouldn't there be an empty ranges property in there as well?

Technically yes, I think. Though it doesn't make a bit of a difference
on Linux.

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRUg9CAAoJEN0jrNd/PrOhcpcP/07knZ3ngXHD+sTb++WAbC82
pWNjjuk9l0bRGSA27JzQQ8ezDmRWqUXH/Xi1FYLEe+yuYTsxf5ETkYdaMJWy8eG7
iJIv0gNqPfxAynHzIZDUEgd0g548xO/+IXNrZjgFtu7Qnchup/9GOdf34MY98V7y
LlTg2hRaMenCg1rmUz8BQogAfWxgPWkzEArl7MiXTnBHgXmVHDpYQtS/2mj3qln/
Yc1GrmmSmUHCi7WCVs73NC1mPOJMkF5gqaFNuXtxIYvHpAYDRIrKyHKtChAgfwOa
GWvx5Tt13Hb7lxVCKcX/VHmcYRJBJWeRD9mVZVp26BnlaM8nm6DhTUmBT7GFAaPl
Bq53OWfGhNff8pgpXrnFS/99nW27vdVP34BYTVrmDBk4tDJVKnaSBfN9AkFc3hCY
AS0hZOxzVbLUgxtX80UcR1ZxjS0Jbfltm7AXp0urrF8d6xJMmAfIuDvgGq9Q/QQG
yWXRJ0GLpy0FkJzrqFF/alrQVj8BRhy3Unk/r2d75A5LBbIaxGEetvFCQ4kp5gyt
zA8sBQJYwtXY1UuRFxkP1FksLGm/mm59+/vuVNdjXOdORU//NG5qts+lr6CXu/m+
8UT2GQ6eEkdkEvO6i0H6o/rpqRegEJweyKhrYjupomuv4+24RKXDehjgdLb7zT3e
0Zp/EOw0/0w98DO0AdU/
=Jwhw
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--

--===============4689596054319607768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4689596054319607768==--
