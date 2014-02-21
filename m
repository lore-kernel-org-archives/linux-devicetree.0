From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH RFC] usb: gadget: Add xilinx axi usb2 device support
Date: Fri, 21 Feb 2014 16:51:07 +0100
Message-ID: <530775EB.6030004@monstr.eu>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local> <20140220182257.GF23217@saruman.home> <20140221120454.GD8783@e106331-lin.cambridge.arm.com> <5307576F.5050506@monstr.eu> <20140221154244.GG31902@saruman.home>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="OQoae23AXrotEhf3NrbaLv7qPAsXCjTKx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140221154244.GG31902-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OQoae23AXrotEhf3NrbaLv7qPAsXCjTKx
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 02/21/2014 04:42 PM, Felipe Balbi wrote:
> Hi,
>=20
> On Fri, Feb 21, 2014 at 02:41:03PM +0100, Michal Simek wrote:
>>>>> +	/* Map the registers */
>>>>> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>> +	udc->base_address =3D devm_ioremap_nocache(&pdev->dev, res->start=
,
>>>>> +						 resource_size(res));
>>>>
>>>> use devm_ioremap_resource() instead.
>>>
>>> Also, res might be NULL. You should check that before dereferencing i=
t.
>>
>> yes it is necessary for both cases with devm_ioremap_nocache
>> or with devm_ioremap_resource.
>=20
> read the source Luke:
>=20
> | void __iomem *devm_ioremap_resource(struct device *dev, struct resour=
ce *res)
> | {
> | 	resource_size_t size;
> | 	const char *name;
> | 	void __iomem *dest_ptr;
> |=20
> | 	BUG_ON(!dev);
> |=20
> | 	if (!res || resource_type(res) !=3D IORESOURCE_MEM) {
>             ^^^^
> 	    already done for you
>=20
> | 		dev_err(dev, "invalid resource\n");
> | 		return ERR_PTR(-EINVAL);
> | 	}
> |=20
> | 	size =3D resource_size(res);
> | 	name =3D res->name ?: dev_name(dev);
> |=20
> | 	if (!devm_request_mem_region(dev, res->start, size, name)) {
> | 		dev_err(dev, "can't request region for resource %pR\n", res);
> | 		return ERR_PTR(-EBUSY);
> | 	}
> |=20
> | 	if (res->flags & IORESOURCE_CACHEABLE)
> | 		dest_ptr =3D devm_ioremap(dev, res->start, size);
> | 	else
> | 		dest_ptr =3D devm_ioremap_nocache(dev, res->start, size);

I have read it just not sure if IORESOURCE_CACHEABLE is setup by default
or not.
If yes, then you have to setup res->flags in your driver and have to
check it.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--OQoae23AXrotEhf3NrbaLv7qPAsXCjTKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlMHdewACgkQykllyylKDCHguwCfa4W5mcq1rUx/9Jb+tuQPx+Fc
EF4AoIBOoCOdqeZPYXNlb4630mjo+vY5
=kCfQ
-----END PGP SIGNATURE-----

--OQoae23AXrotEhf3NrbaLv7qPAsXCjTKx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
