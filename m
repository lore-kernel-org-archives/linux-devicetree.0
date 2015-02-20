From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Fri, 20 Feb 2015 10:06:10 -0600
Message-ID: <20150220160610.GB6430@saruman.tx.rr.com>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org>
 <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
 <20150220144119.GB1707@saruman.tx.rr.com>
 <54E75665.6050205@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E75665.6050205@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zhangfei <zhangfei.gao@linaro.org>
Cc: balbi@ti.com, Kishon Vijay Abraham I <kishon@ti.com>, mark.rutland@arm.com, Peter Chen <peter.chen@freescale.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "dan . zhao" <dan.zhao@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 20, 2015 at 11:44:37PM +0800, zhangfei wrote:
> Hi, Balbi
>=20
> On 02/20/2015 10:41 PM, Felipe Balbi wrote:
>=20
> >>+static void hi6220_start_peripheral(struct hi6220_priv *priv, bool on)
> >>+{
> >>+	struct usb_otg *otg =3D priv->phy.otg;
> >>+
> >>+	if (!otg->gadget)
> >>+		return;
> >>+
> >>+	if (on)
> >>+		usb_gadget_connect(otg->gadget);
> >>+	else
> >>+		usb_gadget_disconnect(otg->gadget);
> >
> >why is the PHY fiddling with pullups ?
>=20
> We use this to enable/disable otg gadget mode.

I got that, but the pullups don't belong to the PHY, they belong to the
gadget.

> The gpio_id & gpio_vbus are used to distinguish otg gadget mode or
> host mode.
> When micro usb or otg device attached to otg, gpio_vbus falling down.
> And gpio_id =3D 1 is micro usb, gpio_id =3D 0 is otg device.

all of that I understood clearly :-)

> So when micro usb attached, we enable gadget mode; while micro usb
> detached, we disable gadget mode, and dwc2 will automatically set to
> host mode.

that's all fine, I'm concerned about letting the PHY fiddle with
something it doesn't own. If I am to change pullups rules in udc-core,
this is likely to break down miserably and I don't want to have to go
through that.

> >>+static void hi6220_detect_work(struct work_struct *work)
> >>+{
> >>+	struct hi6220_priv *priv =3D
> >>+		container_of(work, struct hi6220_priv, work.work);
> >>+	int gpio_id, gpio_vbus;
> >>+	enum usb_otg_state state;
> >>+
> >>+	if (!gpio_is_valid(priv->gpio_id) || !gpio_is_valid(priv->gpio_vbus))
> >>+		return;
> >>+
> >>+	gpio_id =3D gpio_get_value_cansleep(priv->gpio_id);
> >>+	gpio_vbus =3D gpio_get_value_cansleep(priv->gpio_vbus);
> >
> >looks like this should be using extcon
> Not used extcon before.
> However, we need gpio_vbus interrupt.
> Checked phy-tahvo.c and phy-omap-otg.c, not find extcon related with
> interrupt.
> Will investigate tomorrow.

drivers/extcon/extcon-gpio.c

> >>+	if (gpio_vbus =3D=3D 0) {
> >>+		if (gpio_id =3D=3D 1)
> >>+			state =3D OTG_STATE_B_PERIPHERAL;
> >>+		else
> >>+			state =3D OTG_STATE_A_HOST;
> >>+	} else {
> >>+		state =3D OTG_STATE_A_HOST;
> >>+	}
> >>+
> >>+	if (priv->state !=3D state) {
> >>+		hi6220_start_peripheral(priv, state =3D=3D OTG_STATE_B_PERIPHERAL);
> >>+		priv->state =3D state;
> >>+	}
> >>+}
> >>+
> >>+static irqreturn_t hiusb_gpio_intr(int irq, void *data)
> >>+{
> >>+	struct hi6220_priv *priv =3D (struct hi6220_priv *)data;
> >>+
> >>+	/* add debounce time */
> >>+	schedule_delayed_work(&priv->work, msecs_to_jiffies(100));
> >
> >this is really bad. We have threaded interrupt support, right ?
>=20
> Since we use two gpio to distinguish gadget mode or host mode.
> Debounce time can introduce more accuracy.

gpio_set_debounce() ?

> I think threaded interrupt can not be used for adding debounce time.
> Here add debounce is just for safety.

add the debounce to the gpio itself.

--=20
balbi

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU51tyAAoJEIaOsuA1yqRE4yIP/RimNedyzVc1YDZ9Fl+q3c5N
R2tzvOQA0ZZ6W1UZFwscBjwXNWGFt7SbdsX7VDj1In8beHKSbXjAX8jmBzH8dKF7
js5MwQlfeHiiRQRwkEsKsw3l6hS6bj8BDYdUMWMUCtXORg/OWYa8OAeucX8UnPU2
Jqp7V0fbMvZsBCnqVTTSBMFwxsB5atQ7l8RbA6tgJhkZ4BLWwe5Z44xNjENzXzTI
hieP0hzq2jHsWTG30xRtTowUF6yS3CETT6bOcKG5OnEOaMCvd5+W0FhXF20/NN+W
4lXv1oHs/tMYhBzZ9cF1LIQhGxtFk5FrMaOsTej6a1huz7ClnJdGb7oGcHTfm7Mv
GTk4iKjDiBfawMo9htPTEkZyrZJ6eaStNkJA5p0x27j9zZCw/iUvdCuD5yJzzbq3
yWVYITm4Z6Zv126OJfGbYcPKcEx19nWv3biihU0w0Xj5hIIYjU5Td/1DhQFfXwMt
A6rPLGjXNDyCNXcpvhS637mDwpVOuwAS5Ql2gWBmVJoY/Boc3anA+nZUKBaA0ljq
P8umeF4h7uga56Ic2SGjJKgjqZKze1H3ZP5k4Fv65wDInlYsHmIuUbODNAv8FS7A
HKM19GOp1xUBtMB0HCmktgEaBRJuScmbrCV4nYlBLEOpaxZTKFsQOcNSdPII8bBd
Vyw93ChfGk4C+wZRBnpy
=1lUT
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
