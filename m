From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Wed, 25 Feb 2015 10:32:04 -0600
Message-ID: <20150225163204.GA11136@saruman.tx.rr.com>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org>
 <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
 <20150220144119.GB1707@saruman.tx.rr.com>
 <54E75665.6050205@linaro.org>
 <20150220160610.GB6430@saruman.tx.rr.com>
 <54E89E29.4010807@linaro.org>
 <20150221162102.GA1784@saruman.tx.rr.com>
 <54E948AC.2010609@linaro.org>
 <20150223153612.GF32701@saruman.tx.rr.com>
 <54EDCE04.3040404@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54EDCE04.3040404@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zhangfei <zhangfei.gao@linaro.org>
Cc: balbi@ti.com, Kishon Vijay Abraham I <kishon@ti.com>, mark.rutland@arm.com, Peter Chen <peter.chen@freescale.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "dan . zhao" <dan.zhao@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2015 at 09:28:36PM +0800, zhangfei wrote:
> >>>>>>>>+static void hi6220_detect_work(struct work_struct *work)
> >>>>>>>>+{
> >>>>>>>>+	struct hi6220_priv *priv =3D
> >>>>>>>>+		container_of(work, struct hi6220_priv, work.work);
> >>>>>>>>+	int gpio_id, gpio_vbus;
> >>>>>>>>+	enum usb_otg_state state;
> >>>>>>>>+
> >>>>>>>>+	if (!gpio_is_valid(priv->gpio_id) || !gpio_is_valid(priv->gpio_=
vbus))
> >>>>>>>>+		return;
> >>>>>>>>+
> >>>>>>>>+	gpio_id =3D gpio_get_value_cansleep(priv->gpio_id);
> >>>>>>>>+	gpio_vbus =3D gpio_get_value_cansleep(priv->gpio_vbus);
> >>>>>>>
> >>>>>>>looks like this should be using extcon
> >>>>>>Not used extcon before.
> >>>>>>However, we need gpio_vbus interrupt.
> >>>>>>Checked phy-tahvo.c and phy-omap-otg.c, not find extcon related with
> >>>>>>interrupt.
> >>>>>>Will investigate tomorrow.
> >>>>>
> >>>>>drivers/extcon/extcon-gpio.c
> >>>>I think there is no need to use extcon, gpio is clear enough.
> >>>>extcon-gpio.c even do not support dt.
> >>>
> >>>well, add DT. The whole idea of free software is that we improve on
> >>>things we already have. EXTCON is *the* API to handle such things.
> >>
> >>I think I am still not understanding extcon-gpio, not sure why need
> >>use this API here.
> >
> >because extcon is the API to use for external connectors. The same way
> >you use regulator framework to control that single GPIO tied to an
> >enable signal of a fixed regulator, you use extcon when you need to read
> >that gpio signal tied to id pin of the USB connector.
> >
> >>Here two gpio requires, one gpio as interrupt, in the interrupt
> >>handler, we detect the gpio status judging the otg status.
> >>extcon-gpio.c use the interrupt, then can we also use the gpio
> >>interrupt.  Using extcon-gpio is used for saving gpio_request?
> >
> >extcon is used to hide gpio_request from dwc2. dwc2 only knows about
> >extcon, not gpios. extcon will request the gpio and use it as interrupt
> >source. When an IRQ fires, it will read the gpio state and decide if it
> >should broadcast a message to tell dwc2 to become host or peripheral.
>=20
> Thanks for the kind education, understand now.

hey, no problem ;-)

--=20
balbi

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU7fkEAAoJEIaOsuA1yqREsGIQAJiCg9Zk9cYjq5EFzlndfLFO
kCwWnjzq/GZogGQsvShiZ5AkQcu118d/uUp2M2spBsFyrMig6a/XpvkuYnHMsGxA
LopqRs7QW4fSWgAtdj7j0KNO+5MiFkLrVo9doKi75e7p/sL4BbaK6LX9qB+5jz2z
2I3zDNc3AHmpvT6aReGo3P1Fo9QhtuvWmdRxk0cUiWKU9F/pUaZi7qwJfPFpdv5b
P2YvlZ2adSeP+LotOs2PDBAgIVIpdswpkKK1OMTj1vA4sBwXKrhrBxZdnIn37f4w
XpHFQEuD20OyLWXfyzpQfv/TkUOvM3uxnjZdQwP8lgku3H87kHL7zak1fWdmx3IF
0b5yWnpRM11ggUHMayNDaWo/ZgGejEE2HabqUIVmNFyrv4oRRkjrV/UE1X0ErszF
k9YUcf+jj/ggoJCuMy6nMW7NDJopVIuc+yFAUbuqhbbl8C2QCuV1waZ2z/jP8u9A
XrIHrcxF0LKehi8J1fojCNY4MlsaysKlcUc45RDVAk6tId5YY+Ykl0cFKSu+rFWB
bQGvatLkeSzmsQkFAdWSFJhknueT9wXJakf7qWDbmlV+UPa9l+aHrgd1qAW0P6Kj
8sI9H8fMTWozKLUEGArOHye+Pl8OfpRy1ENMINyAr39gmZU/Cqc34zxzN8RA+gdt
jj3Gd4zqESA6e760lkUm
=oMAE
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
