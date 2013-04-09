From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFCv1 08/11] PCI: Introduce new MSI chip infrastructure
Date: Tue, 9 Apr 2013 10:22:33 +0200
Message-ID: <20130409082232.GC27255@avionic-0098.mockup.avionic-design.de>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364316746-8702-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAErSpo42AFdKH2RKTxOaeJgCPrYD5KYkOs3UEBez8x8Bjmun5w@mail.gmail.com>
 <20130409081119.GA30736@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8759599810699628424=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130409081119.GA30736-5wv7dgnIgG8@public.gmane.org>
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
To: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============8759599810699628424==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 09, 2013 at 09:11:19AM +0100, Andrew Murray wrote:
[...]
> Also I believe pci_alloc_child_bus function would need to be changed to add
> "b->msi = msi" to inherit msi_chip for child buses in the above patch?

The patch already does:

	child->msi = parent->msi;

in pci_alloc_child_bus(), the same way that ops is inherited. I have
admittedly only tested this code on Tegra, but I don't see why that
wouldn't be enough. Or maybe I haven't understood your question?

Thierry

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRY8/IAAoJEN0jrNd/PrOhbekQAKkjrnRsOfVv4qKeB1sc+W1S
ptqQkqHoA1NoNWFyOIffRpVKoI3CqCbxiIW5nssN1N3pOkAmhYgWdJWDfVefY5ir
UzZXk7KKBrbDXfFSUOeoFLAC2ZwU96uL5VB260KDRw79x4ptw9g2lTGC2ksqjGmb
KjycUQFD4KbG24AC9TOsDby7BBmP3tqjqQJMlc1zBThJSdhqEV+3heb2VRXYrBHK
BD7+HDXKaZ/ysmanFprJPiTN8SSVQn+F2Q4bYZT0KpyRelJHyhbeDLHM/BuevEwA
cLOrKqdsog6kuesxNdztrqfB/R+gv8RtgLkkHDtFNAUnZtcjM8ZJneWpUFtYGXwO
Ta6FveIFCa9DHH6KfBNprV3zqwJwhLQZQuEogdNw0kcl/pmCO10chStKZ82Lq9eR
FSs2kRY4mHsPv8SXnsIAPZxyWGY9lda6shXBD17pnPIQ57IeCWHxgetA/CYaPlX+
szYGOS28iHfwdQ7mvUu+znhMBRDisbKb3y15dR8YwUluZwnU7+9Nj5aLBD8q4cLt
eDJCv2uQr0GSYRjwIk2hpFY32IZzfd41QaUSMk3G5zhI6OOGheRwkD1d+q1E1dv6
vTa7gQ0r3BCPrMk0hzH56rzlzdQUJT9LvqjVG3epUbNMopjwIVMrXCOxpsmTJ1D2
hUzr3i0oJebiI8QiCmh+
=SRPZ
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--

--===============8759599810699628424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8759599810699628424==--
