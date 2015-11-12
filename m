From: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v7 37/50] powerpc/powernv: Simplify pnv_eeh_reset()
Date: Thu, 12 Nov 2015 16:11:12 +1100
Message-ID: <877flniyz3.fsf@gamma.ozlabs.ibm.com>
References: <1446642770-4681-1-git-send-email-gwshan@linux.vnet.ibm.com> <1446642770-4681-38-git-send-email-gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1446642770-4681-38-git-send-email-gwshan@linux.vnet.ibm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, benh@kernel.crashing.org, mpe@ellerman.id.au, aik@ozlabs.ru, bhelgaas@google.com, grant.likely@linaro.org, robherring2@gmail.com, panto@antoniou-consulting.com, frowand.list@gmail.com, Gavin Shan <gwshan@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

> -			rc = opal_pci_reset(phb->opal_id,
> -					    OPAL_RESET_PHB_ERROR,
> -					    OPAL_ASSERT_RESET);
> -			if (rc != OPAL_SUCCESS) {
> -				pr_warn("%s: Failure %lld clearing "
> -					"error injection registers\n",
> -					__func__, rc);

This is very minor, but is there a good reason to change the error
message from the one above to the one below? I just hesitate to change
error messages that people might be grepping the source for without a
good reason.

> +		if (rc != OPAL_SUCCESS) {
> +			pr_warn("%s: Error %lld clearing error injection\n",
> +				__func__, rc);

Apart from that this looks good, pending me actually testing it :)

Regards,
Daniel


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWRB9xAAoJEPC3R3P2I92F6i8P/1nXJklQO2PGRqksurbhrbzf
hgXkRkqK4MgbbsIdw4HCRkbdWF+2pqKl1qWT6CIoyxNe+uZ+RLiq60Z8+2zok650
c5usDrSVMJZ1y8xwQrKe//W8C3sMIfWELvxpOpBKEu50thHXTKHpARzUA576PYYW
epxrt5fwrNckW+Emcyu83c+tEiz3C+goQGM84xBjxIUr7O0wbghinEZ53Otl8BAf
YfU21Z6a1V+qxNb/qaVn9AYp5QR5IBPC0dBqIngWZsPMH8sivb0mgQInaVtkwjET
n04tc2uUcyQsHRmvyKvkOp1lIRzJ7Ho5pZzotLyO+Z8LlUuok1WAVRCKjBsuEav3
Alfv/JKc5kewmo+1+I2P/ofAQQgBHykdrNIYEg3IWJrmHh4GjPDI3csxlILthR6F
WQJiYDZy4DmnPFi9wg5aH8WjWlCw1B9scobAAcf06gafJ6O9tUjt/iYjHUvCjKqn
UDhp4VtBJ2cfAuxXgBNcBzGmQCbRtzCfyRAjrZSKQqAKNE4OTlCuzwSUb9pxZ/+4
C7lFWxLHGm0Eu5rsSh7rFCROt7s7Bg1lZD6cRWNGhGfU9I5vsAtG/i4dAcnNaDZr
zFemBfb6Fghf7gNZm0GrUrXoYdWJFmAexNFiimwQGhQQN/BVgEFgOtHJhQ/Pj6NO
18XJnCap7rqlbJZcmG+v
=AiNj
-----END PGP SIGNATURE-----
--=-=-=--
