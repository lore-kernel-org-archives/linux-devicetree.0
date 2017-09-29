From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: dwc3: workaround: disable device-initiated U1/U2
Date: Fri, 29 Sep 2017 10:48:59 +0300
Message-ID: <87o9puj66s.fsf@linux.intel.com>
References: <20170929044505.3410-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170929044505.3410-1-ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

(first things first: use get-maintainer.pl. You should have Cc:ed linux-usb)

> Issue: When the USB controller is configured as a USB device
> mode, the device initiates low power when an ACK is pending for a
> data packet (DP). When operating in SuperSpeed mode and when the
> internal condition for low power (u1/u2) is satisfied, the device
> initiates u1/u2 even though it has just received a DPH of the DP
> header (DPH). This causes the link to enter and exit low power before
> the device sends an ACK for the DP. This behavior can cause a
> transaction timeout on the host for the DP. Impact: Depending on the
> host transaction timeout value, the host may timeout on the
> transaction and the host retries the transfer. If the same issue
> happens again, this could result in the host resetting the device and
> re-enumerating.
>
> Workaround: Disable USB_DCTL (InitU1Ena, InitU2Ena) bits. As a
> result,the device does not initiate lowpower requests; however,
> it can still accept low-power requests from the host/hub and enter
> low power.

which dwc3 versions does this erratum affect? I'm not taking any
workaround that doesn't refer to a Synopsys STARS ticket, sorry.

Also, are you sure this can't be runtime detected?

> Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  drivers/usb/dwc3/core.c                        | 2 ++
>  drivers/usb/dwc3/core.h                        | 2 ++
>  drivers/usb/dwc3/ep0.c                         | 4 ++--
>  drivers/usb/dwc3/gadget.c                      | 7 +++++++
>  5 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index 7d4f90c16cd4..9afa8e95831e 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -47,6 +47,8 @@ Optional properties:
>  			from P0 to P1/P2/P3 without delay.
>   - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate =
check
>  			during HS transmit.
> + - snps,disable_devinit_u1u2: when set, disable device-initiated U1/U2
> +			LPM request in USB device mode.
>   - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
>  			utmi_l1_suspend_n, false when asserts utmi_sleep_n
>   - snps,hird-threshold: HIRD threshold
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index f13096b0900e..63d599872a43 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1143,6 +1143,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>=20
>  	dwc->tx_de_emphasis_quirk =3D device_property_read_bool(dev,
>  				"snps,tx_de_emphasis_quirk");
> +	dwc->disable_devinit_u1u2_quirk =3D device_property_read_bool(dev,
> +				"snps,disable_devinit_u1u2");
>  	device_property_read_u8(dev, "snps,tx_de_emphasis",
>  				&tx_de_emphasis);
>  	device_property_read_string(dev, "snps,hsphy_interface",
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 7c2f84dc218a..2be63c1a6ab6 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -896,6 +896,7 @@ struct dwc3_scratchpad_array {
>   * 	1	- -3.5dB de-emphasis
>   * 	2	- No de-emphasis
>   * 	3	- Reserved
> + * @disable_devinit_u1u2_quirk: disable device-initiated U1/U2 request.
>   * @imod_interval: set the interrupt moderation interval in 250ns
>   *                 increments or 0 to disable.
>   */
> @@ -1057,6 +1058,7 @@ struct dwc3 {
>=20
>  	unsigned		tx_de_emphasis_quirk:1;
>  	unsigned		tx_de_emphasis:2;
> +	unsigned		disable_devinit_u1u2_quirk:1;
>=20
>  	u16			imod_interval;
>  };
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 827e376bfa97..bbbf46f031e2 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -391,7 +391,7 @@ static int dwc3_ep0_handle_u1(struct dwc3 *dwc, enum =
usb_device_state state,
>  		return -EINVAL;
>=20
>  	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
> -	if (set)
> +	if (set && !dwc->disable_devinit_u1u2_quirk)
>  		reg |=3D DWC3_DCTL_INITU1ENA;
>  	else
>  		reg &=3D ~DWC3_DCTL_INITU1ENA;
> @@ -413,7 +413,7 @@ static int dwc3_ep0_handle_u2(struct dwc3 *dwc, enum =
usb_device_state state,
>  		return -EINVAL;
>=20
>  	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
> -	if (set)
> +	if (set && !dwc->disable_devinit_u1u2_quirk)

This is likely going to block USB30CV from passing, no? Have you
verified that USB30CV Chapter9 LPM tests still pass? What about Lecroy's
Certification Suite, does that still pass?

Which dwc3 version do *you* use?

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index f064f1549333..61141c6350dc 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3199,6 +3199,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>  {
>  	int ret;
>  	int irq;
> +	u32	reg;
>=20
>  	irq =3D dwc3_gadget_get_irq(dwc);
>  	if (irq < 0) {
> @@ -3275,6 +3276,12 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>  		goto err4;
>  	}
>=20
> +	if (dwc->disable_devinit_u1u2_quirk) {
> +		reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
> +		reg &=3D ~(DWC3_DCTL_INITU1ENA | DWC3_DCTL_INITU2ENA);

Why are these bits set here? Also, you may be breaking another
workaround for an erratum that affects versions < 1.83a of the core.

Again, without a synopsys STARS ticket, I'm not accepting this patch.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnN+usACgkQzL64meEa
mQaWNRAAyYsMr/2OfDcfdSKvr1YkIZWcfwbknH1ypVmXxk+Nyel2XRQ8iSYZr6RI
zVt1nR0ilcjZO0U7sNaQqeCr7Xz0EmZXKyc/ALIYclyRwKge0ibnlwEX4hH5+HNE
DdpVLrhfjtEUHNLdbajEaSOyErlqdtZ/RynUuT6r2Q+HjiNLQFLqb86N7CU1ch8Q
Rb4+YvnRYLqA/T77qcsBGkXYtcZ5PGud09FLUvqjYI9hq1bojQsgww0WQ54ygJCQ
xJun4ovE6gJNF+VMshU1X65pQ5RsOMGZsz1/XDzPZ5mGlm7RSWNAxnnA4Tyd+QCe
8kYQrH5lO+hXPHVJ8pekij+sW3GA4y+/fqmDEIGFcldCKMlsqpOv8l0RRgjN4kDt
uspTnO6+do0W21uvFczL6OZubf2ScjbRrzu1Hne/1D4XMP/Tob2Ibc7m+BxjMSgL
o1mWvi26o5trg6kDf2X/dMmGKLkWS20bBkYuCPX15fMO//sT4RTI/jywCpIOMAjG
zWprYa9lNROEjNzwlRItQciSsa6eRAPEkm4Hj9Ygf9EunHTgOHpu8k9rk6bo5BsL
zsvk/pBnsGKbNKuZsX0v4O0eNrQ5du65XOAmumdrXYPHZmCPBqaeXgji+a+J9bo8
Hq+NW94YyZz8ywPy/y+GMQYU0L5Qs0kBrH1IxesH9LJdKPVlhp0=
=ITEH
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
