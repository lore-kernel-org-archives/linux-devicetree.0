From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] of: Export of_irq_count for using in modules
Date: Fri, 31 May 2013 10:14:38 +0200
Message-ID: <51A85BEE.4000009@monstr.eu>
References: <6aa29b1d109a46278a7f37b598defe07d6edfe60.1369921774.git.michal.simek@xilinx.com>
 <20130530201714.GE19834@game.jcrosoft.org>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4347699902370009688=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130530201714.GE19834-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4347699902370009688==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2WUSGCNSSCTXIHIQWTIFL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2WUSGCNSSCTXIHIQWTIFL
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Jean-Christophe,

On 05/30/2013 10:17 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 15:49 Thu 30 May     , Michal Simek wrote:
>> Export of_irq_count for modules.
>=20
> can you explain why do you need to call of_irq_count

I need to count number of irq written in the DTS node.
It is not fixed size that's why I need to proper way how to
find it out.

I am using this loop.
	count =3D of_irq_count(pdev->dev.of_node);
	/* Alloc IRQ based on DTS to be sure that no other driver will use it */=

	while (count--) {
		tmp->irq =3D irq_of_parse_and_map(pdev->dev.of_node, count);
		dev_info(&pdev->dev, "%d: Alloc irq: %d\n", count, tmp->irq);
		ret =3D request_irq(tmp->irq, zynq_remoteproc_interrupt, 0,
					dev_name(&pdev->dev), &pdev->dev);
		if (ret) {
			...
		}
	}

But of course if you think that this is incorrect to export it
I can use what it is in of_irq_count body
368 int of_irq_count(struct device_node *dev)
369 {
370         int nr =3D 0;
371
372         while (of_irq_to_resource(dev, nr, NULL))
373                 nr++;
374
375         return nr;
376 }

Because of_irq_to_resource is exported for modules.
Or is there any better way how to loop over all interrupts in DT node?

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2WUSGCNSSCTXIHIQWTIFL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlGoW+4ACgkQykllyylKDCE+WQCfRaCIjTDTNtlGJRaqw9CQvHeW
RBEAnj7CELDQ+XLUZV+sqkEa04Ky6ndc
=kFse
-----END PGP SIGNATURE-----

------enig2WUSGCNSSCTXIHIQWTIFL--

--===============4347699902370009688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4347699902370009688==--
