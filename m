From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [RFC PATCH] usb: dwc3: host: add support for OTG in DWC3 host driver
Date: Wed, 04 Jan 2017 15:32:40 +0200
Message-ID: <87o9znvtl3.fsf@linux.intel.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com> <1483536181-22356-5-git-send-email-mnarani@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483536181-22356-5-git-send-email-mnarani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, gregkh@linuxfoundation.org, mathias.nyman@intel.com, agraf@suse.de, bharatku@xilinx.com, punnaiah.choudary.kalluri@xilinx.com, dhdang@apm.com, marc.zyngier@arm.com, mnarani@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: anirudh@xilinx.com, anuragku@xilinx.com
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Manish Narani <manish.narani@xilinx.com> writes:
> This patch adds support for OTG host mode initialization in DWC3
> host driver. Before the host initialization sequence begins. The
> driver has to make sure the no OTG peripheral mode is enabled.
>
> Signed-off-by: Manish Narani <mnarani@xilinx.com>
> ---
>  drivers/usb/dwc3/host.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index 487f0ff..4caa3fe 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -16,6 +16,8 @@
>   */
>=20=20
>  #include <linux/platform_device.h>
> +#include <linux/usb.h>
> +#include <linux/usb/hcd.h>
>=20=20
>  #include "core.h"
>=20=20
> @@ -111,6 +113,18 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	phy_create_lookup(dwc->usb3_generic_phy, "usb3-phy",
>  			  dev_name(dwc->dev));
>=20=20
> +	if (dwc->dr_mode =3D=3D USB_DR_MODE_OTG) {
> +		struct usb_phy *phy;
> +		/* Switch otg to host mode */
> +		phy =3D usb_get_phy(USB_PHY_TYPE_USB3);
> +		if (!IS_ERR(phy)) {
> +			if (phy && phy->otg)
> +				otg_set_host(phy->otg,
> +						(struct usb_bus *)(long)1);
> +			usb_put_phy(phy);
> +		}
> +	}

NAK. Don't change default mode for everybody. Default mode should
actually be peripheral, but let's not touch whatever HW designer has
set; at least for now.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhs+XgACgkQzL64meEa
mQYfsBAAo4nfh3wTDy90ZlXr/Nvpy5XjPa7F2BRwUO4zzb97ZYhcejDIukZQjGty
e0WmfwiVIlLr9NZto5ihBWaehmGMogWXqUipenBxf21MDRAERIaOK1h1Q60xBnVn
baln1ZOZzNQaEQ9MQWnojHNvS0PnZyGTKLWWEf1BU8fRqrDmXUwKBGe5V79zwM/P
YbyERgQvtln00b1e+d+no0gNc1K5jUcg5tha4VLIk9eWdKzRl+gh+/ZC3TnFNTKG
GwnkPEOk5jpVNSPi7vWABB/t9epyLC5cnCslD377/skJ0Uoob+GLdi+f0SozNitd
zPZ5R54XBKBX0/kAAWnPtQYVGV+YUl3CILYELV+/HgVZEQUYtjp8wonPefj9Yw8p
zwvjVE1o8SRDCNda3wDUCq6ZCU2ylJZoUaoCfrjzmoYI8+EnSNnhmQ+Le5tfS2lb
4UBTZIqiduu8QBhAvheeQg9FDljYIWoxQqZHLLUzIhthl35U8VszsoGb17RhXIIB
J4saH8r7yeIQfLM5Bard/G7pIVT6KIxCU9q0I2iyweaFmImr+BTsrYgjsCw7Gcm1
KeNS6+//ecbYy5nmI61PO73It4LzQsHuH2F4VtFG/D+Thn1lJB//ihd19ZMdiEY1
d95NsI9wdIWsxhYXLts0OwhaDFKPP6tPk7K3Ljv9TLJ2QYWZeow=
=nXjj
-----END PGP SIGNATURE-----
--=-=-=--
