Return-Path: <SRS0=fzOG=KK=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v6] usb: gadget: udc: renesas_usb3: Add register of usb role switch
In-Reply-To: <1527747093-1674-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1527747093-1674-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Thu, 26 Jul 2018 13:58:22 +0300
Message-ID: <87r2jq1cxd.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:

> This patch adds role switch support for R-Car SoCs into the USB 3.0
> peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
> dual-role device controller which has the USB 3.0 xHCI host and
> Renesas USB 3.0 peripheral.
>
> Unfortunately, the mode change register (DRD_CON) contains
> the USB 3.0 peripheral controller side only. So, this renesas_usb3
> driver manages the DRD_CON now. However, in peripheral mode, the host
> should stop. Also the host hardware needs to reinitialize its own
> registers when the mode changes from peripheral to host mode.
> Otherwise, the host cannot work correctly (e.g. detect a device
> as high-speed).
>
> To achieve this reinitialization by a driver, this driver also
> registers a role switch driver to manage the DRD_CON and get
> a device pointer of usb 3.0 host from "companion" property of OF.
> Then, when the usb role is changed, renesas_usb3_role_switch_set()
> will attach/release the xhci-plat driver to reinitialize the host
> hardware.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

unfortunately doesn't apply:

checking file drivers/usb/gadget/udc/Kconfig
Hunk #1 FAILED at 193.
1 out of 1 hunk FAILED
checking file drivers/usb/gadget/udc/renesas_usb3.c
Hunk #7 succeeded at 2465 (offset -12 lines).
Hunk #8 succeeded at 2624 (offset -11 lines).
Hunk #9 succeeded at 2715 (offset -11 lines).

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAltZqU4ACgkQzL64meEa
mQYqAw//YXgZ/c2cqjf5ooyLOJe/dopMVxLDJRFR9nAsgvgngob2bqRobcpz1t9S
3vpn+cfH1iBWk2MFkpvlXkkIjaaNfG8f/pipml81RktQSqUUWeTQILY01uizHzTK
4VM3H5RNLqkdl1D29seFJosSKZP2sDEyjoaVYckEUEpjSLibPIUAzskxSeF2QyrR
pN0nJ8geZWyU8vHRu7njJJUmtqhUpxHvLSjhF/y2NO6fqow5sGaGpbehccCO3YRk
vbkTXH27Z3kvJUWXIsKhFzSC5k0Mu14Hr1YLwwzxs4omPPom2vxKPrx5zmQomY3z
PoQf5qND88UBtM30VXvUg10scDEeD0WibVqqAsnHV+eH8TsvA9eZwUnWhSEvjioD
kfwe1kONOPUvKPqJqfaWPP8sUzGfZalaEB8j8zWIm77NWKPT5C+TwyeZsfF8neeZ
SA5ZVJZNKIEOpbNApDqHL3c9mR0lA9T7QiwlUSB8pey4vlG2b8WoxVL8Qp9jd+bZ
M0OwadWQDdUUeRos/vDIGXtQBMqdgXji03blzm4tDJvDn55ANxU1e4WLj7U+9oRP
cGwJnOMghw/WmrT9XgqS2QDCFK+K18cGtJZ5JcCFks89LTU5upk4DZdaUE76I3oF
auvXzdQjf5S7SsVy46dBBksT3qGQ/WWbZKQuzM6ihl1j4vSLS+c=
=fQz4
-----END PGP SIGNATURE-----
--=-=-=--
