From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v4 4/4] phy: add phy-hi6220-usb
Date: Sat, 21 Feb 2015 10:21:02 -0600
Message-ID: <20150221162102.GA1784@saruman.tx.rr.com>
References: <1423726646-30336-1-git-send-email-zhangfei.gao@linaro.org>
 <1423726646-30336-5-git-send-email-zhangfei.gao@linaro.org>
 <20150220144119.GB1707@saruman.tx.rr.com>
 <54E75665.6050205@linaro.org>
 <20150220160610.GB6430@saruman.tx.rr.com>
 <54E89E29.4010807@linaro.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54E89E29.4010807@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: zhangfei <zhangfei.gao@linaro.org>
Cc: balbi@ti.com, Kishon Vijay Abraham I <kishon@ti.com>, mark.rutland@arm.com, Peter Chen <peter.chen@freescale.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "dan . zhao" <dan.zhao@hisilicon.com>, Wangbinghui <wangbinghui@hisilicon.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 21, 2015 at 11:03:05PM +0800, zhangfei wrote:
> >>>>+static void hi6220_start_peripheral(struct hi6220_priv *priv, bool o=
n)
> >>>>+{
> >>>>+	struct usb_otg *otg =3D priv->phy.otg;
> >>>>+
> >>>>+	if (!otg->gadget)
> >>>>+		return;
> >>>>+
> >>>>+	if (on)
> >>>>+		usb_gadget_connect(otg->gadget);
> >>>>+	else
> >>>>+		usb_gadget_disconnect(otg->gadget);
> >>>
> >>>why is the PHY fiddling with pullups ?
> >>
> >>We use this to enable/disable otg gadget mode.
> >
> >I got that, but the pullups don't belong to the PHY, they belong to the
> >gadget.
> >
> >>The gpio_id & gpio_vbus are used to distinguish otg gadget mode or
> >>host mode.
> >>When micro usb or otg device attached to otg, gpio_vbus falling down.
> >>And gpio_id =3D 1 is micro usb, gpio_id =3D 0 is otg device.
> >
> >all of that I understood clearly :-)
> >
> >>So when micro usb attached, we enable gadget mode; while micro usb
> >>detached, we disable gadget mode, and dwc2 will automatically set to
> >>host mode.
> >
> >that's all fine, I'm concerned about letting the PHY fiddle with
> >something it doesn't own. If I am to change pullups rules in udc-core,
> >this is likely to break down miserably and I don't want to have to go
> >through that.
>=20
> Thanks for the clarifying.

no problem.

> How about using usb_gadget_vbus_connect/disconnect, which are used in many
> files under drivers/usb/phy.
> There is no vbus_session in dwc2/gadget.c, I thought it would be same as
> pullup.
>=20
> However, usb_gadget_vbus_connect still need para gadget, where should we =
put
> this file, drivers/usb/phy or drivers/phy

drivers/phy, if the framework misses anything you need, it's a great
opportunity to give back to the community by extending the framework.

Scratching one's own itch kinda thing...

> >>>>+static void hi6220_detect_work(struct work_struct *work)
> >>>>+{
> >>>>+	struct hi6220_priv *priv =3D
> >>>>+		container_of(work, struct hi6220_priv, work.work);
> >>>>+	int gpio_id, gpio_vbus;
> >>>>+	enum usb_otg_state state;
> >>>>+
> >>>>+	if (!gpio_is_valid(priv->gpio_id) || !gpio_is_valid(priv->gpio_vbus=
))
> >>>>+		return;
> >>>>+
> >>>>+	gpio_id =3D gpio_get_value_cansleep(priv->gpio_id);
> >>>>+	gpio_vbus =3D gpio_get_value_cansleep(priv->gpio_vbus);
> >>>
> >>>looks like this should be using extcon
> >>Not used extcon before.
> >>However, we need gpio_vbus interrupt.
> >>Checked phy-tahvo.c and phy-omap-otg.c, not find extcon related with
> >>interrupt.
> >>Will investigate tomorrow.
> >
> >drivers/extcon/extcon-gpio.c
> I think there is no need to use extcon, gpio is clear enough.
> extcon-gpio.c even do not support dt.

well, add DT. The whole idea of free software is that we improve on
things we already have. EXTCON is *the* API to handle such things.

Quite frankly, though, Roger Quadros (now in Cc) has been working to get
DT support on extcon-gpio, so perhaps wait for that and base your
patches on top of his.

Now your statement that GPIO is clear enough is completely bogus to me.

Why do we have fixed regulators with GPIO enable signals, right ? Might
as well just fiddle with the GPIO directly, right ? Wrong, the idea of
using these frameworks is to encapsulate implementation details and make
sure that if things change from one board to another, we can still use
our SW without major modifications.

> >>>>+	if (gpio_vbus =3D=3D 0) {
> >>>>+		if (gpio_id =3D=3D 1)
> >>>>+			state =3D OTG_STATE_B_PERIPHERAL;
> >>>>+		else
> >>>>+			state =3D OTG_STATE_A_HOST;
> >>>>+	} else {
> >>>>+		state =3D OTG_STATE_A_HOST;
> >>>>+	}
> >>>>+
> >>>>+	if (priv->state !=3D state) {
> >>>>+		hi6220_start_peripheral(priv, state =3D=3D OTG_STATE_B_PERIPHERAL);
> >>>>+		priv->state =3D state;
> >>>>+	}
> >>>>+}
> >>>>+
> >>>>+static irqreturn_t hiusb_gpio_intr(int irq, void *data)
> >>>>+{
> >>>>+	struct hi6220_priv *priv =3D (struct hi6220_priv *)data;
> >>>>+
> >>>>+	/* add debounce time */
> >>>>+	schedule_delayed_work(&priv->work, msecs_to_jiffies(100));
> >>>
> >>>this is really bad. We have threaded interrupt support, right ?
> >>
> >>Since we use two gpio to distinguish gadget mode or host mode.
> >>Debounce time can introduce more accuracy.
> >
> >gpio_set_debounce() ?
> Not all gpio.c support set_debounce, including gpio-pl061.c.

then the framework should implement it in SW. That was the whole idea of
adding set_debounce() to gpiolib. If the controller can't handle it,
gpiolib handles it in SW. Again, encapsulating details.

> >>I think threaded interrupt can not be used for adding debounce time.
> >>Here add debounce is just for safety.
> >
> >add the debounce to the gpio itself.
>=20
> Here the debounce added only for safety.
> gpio_id may mis-report when unplug usb, but it is correct for plug usb & =
otg
> device.
> So debounce can be omitted.
> If you think using delayed work for debounce is ugly, it is fine switch to
> threaded_irq.

debounce might be very well needed. We *do* want to filter out the
transient period. I'm just telling you there are better ways of doing
so; and your response to that is "let's just remove it" and I'm not
really comfortable with that attitude.

That's the attitude of a lazy person which, I hope, you are not ;)
balbi

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU6LBuAAoJEIaOsuA1yqREkW0P/jUBFx8fr38/6l3rwNIwtaic
z6pp/w41rRb8f0gHiptjIoF6x562m/6G2sYEM3YglNLFbLY/rI7MiQGetCH0psg6
dYiHVNne7HXF6FpPUxZh6upHusYYp6xFmQl332n/Hi6jxg5BxBOZMhFuObEgCXk6
9aSYw0J9YNHyGcJKa6Hu9OAGTratYJy5bKrD9cw4lFMA0p+gLBp06y5D5O5mQVKt
DrtxdO1fugzSCp0RsJpSfLLyf0x+vcEgDZYddCwItWGygNPHrbRsX2+HNLI3iicq
6nuqhuoFV+qddhaUYkR+jIFq4S4VipRF5R8kSC/nVl4ath/Ym5TXWkaAmvDCPmhF
AKge+zP0Awcpb9hazh0JjqWFbL4cUjIOkgjn2UMkuP/4sksDp4cglZAdmugA6Oyh
NDAO5xiageYBEHbfDveXe0WmyA3q8G3Eg3DUBkdKplqeLx6bTazv59mddVdY2SLJ
nYymowQW2XHPJLqJ0jq1lh8/oiV/D271RhhEEW93sCXtwm19teJSG4OyDkHHgDyC
LiP4/4UCbFZQ+UG3L476aIl8d13BOzMwgqbWqS0PmJL7oUVQh1iPwred3rVPk5cY
yOIqTk3EmtIxnr0EUh9uGv5D1wFgDvFwFD4cP6f0gWAktj9kF3wRf654xwafmFD/
K+wmMBctsvcSwezKuS6T
=JeH0
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
