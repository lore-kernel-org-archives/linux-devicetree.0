From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: [RFC 2/2] usb: gadget: composite: parse dt overrides
Date: Mon, 25 Jun 2012 23:30:36 +0200
Message-ID: <op.wgg91aya3l0zgt@mpn-glaptop>
References: <1340655832-30447-1-git-send-email-aletes.xgr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340655832-30447-1-git-send-email-aletes.xgr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, Alexandre Pereira da Silva <aletes.xgr@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, 25 Jun 2012 22:23:52 +0200, Alexandre Pereira da Silva <aletes.=
xgr@gmail.com> wrote:
> Grab the devicetree node properties to override VendorId, ProductId,
> bcdDevice, Manucacturer, Product and SerialNumber
>
> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>

Acked-by: Michal Nazarewicz <mina86@mina86.com>

> @@ -1470,6 +1472,35 @@ static int composite_bind(struct usb_gadget *g=
adget)
> 	cdev->desc =3D *composite->dev;
>+	/* grab overrides from devicetree */
> +	if (np) {
> +		u32 reg;
> +
> +		if (!idVendor &&
> +			of_property_read_u32(np, "vendor_id", &reg) =3D=3D 0)
> +			idVendor =3D reg;
> +
> +		if (!idProduct &&
> +			of_property_read_u32(np, "product_id", &reg) =3D=3D 0)
> +			idProduct =3D reg;
> +
> +		if (!bcdDevice &&
> +			of_property_read_u32(np, "bcd_device", &reg) =3D=3D 0)
> +			bcdDevice =3D reg;
> +
> +		if (!iManufacturer)
> +			of_property_read_string(np, "manufacturer",
> +				&iManufacturer);
> +
> +		if (!iProduct)
> +			of_property_read_string(np, "product",
> +				&iProduct);
> +
> +		if (!iSerialNumber)
> +			of_property_read_string(np, "serial_number",
> +				&iSerialNumber);
> +	}
> +
>  	/* standardized runtime overrides for device ID data */
>  	if (idVendor)
>  		cdev->desc.idVendor =3D cpu_to_le16(idVendor);


--=20
Best regards,                                         _     _
=2Eo. | Liege of Serenely Enlightened Majesty of      o' \,=3D./ `o
=2E.o | Computer Science,  Micha=C5=82 =E2=80=9Cmina86=E2=80=9D Nazarew=
icz    (o o)
ooo +----<email/xmpp: mpn@google.com>--------------ooO--(_)--Ooo--
