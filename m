From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 1/3] usb: misc: generic_onboard_hub: add generic onboard
 USB HUB driver
Date: Tue, 8 Dec 2015 07:55:05 -0600
Message-ID: <87k2opm4ee.fsf@saruman.tx.rr.com>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
 <1449538670-7954-2-git-send-email-peter.chen@freescale.com>
 <87poyhmyrc.fsf@saruman.tx.rr.com> <20151208091854.GA16881@shlinux2>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2378278076755098551=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151208091854.GA16881@shlinux2>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@freescale.com>, p.zabel@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, festevam@gmail.com, pawel.moll@arm.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, patryk@kowalczyk.ws, robh+dt@kernel.org, stern@rowland.harvard.edu, kernel@pengutronix.de, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2378278076755098551==
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@freescale.com> writes:
>> seriously ? Is this really all ? What about that reset line below ?
>
> The clock is PHY input clock on the HUB, this clock may from SoC's
> PLL.

oh, you might have misunderstood my comment. I'm saying that there is
more than one thing you could cache in your private structure. That's
all.

>> > +static int usb_hub_generic_probe(struct platform_device *pdev)
>> > +{
>> > +	struct device *dev =3D &pdev->dev;
>> > +	struct usb_hub_generic_platform_data *pdata =3D dev->platform_data;
>> > +	struct usb_hub_generic_data *hub_data;
>> > +	int reset_pol =3D 0, duration_us =3D 50, ret =3D 0;
>> > +	struct gpio_desc *gpiod_reset =3D NULL;
>> > +
>> > +	hub_data =3D devm_kzalloc(dev, sizeof(*hub_data), GFP_KERNEL);
>> > +	if (!hub_data)
>> > +		return -ENOMEM;
>> > +
>> > +	if (dev->of_node) {
>> > +		struct device_node *node =3D dev->of_node;
>> > +
>> > +		hub_data->clk =3D devm_clk_get(dev, "external_clk");
>> > +		if (IS_ERR(hub_data->clk)) {
>> > +			dev_dbg(dev, "Can't get external clock: %ld\n",
>> > +					PTR_ERR(hub_data->clk));
>>=20
>> how about setting clock to NULL to here ? then you don't need IS_ERR()
>> checks anywhere else.
>>=20
>> > +		}
>>=20
>> braces shouldn't be used here, if you add NULL trick above,
>> however... then you can keep them.
>>=20
>
> Braces aren't needed, it may not too much useful to using NULL
> as a indicator for error pointer.

heh, it's not about using it as an error pointer. I'm merely trying to
make clk optional. NULL is a valid clk, meaning you won't get NULL
pointer dereferences when passing it along clk_*() calls (if you find
any, it's likely a bug in CCF), so NULL can be used to cope with
optional clocks:

         clk =3D clk_get(dev, "foo");
         if (IS_ERR(clk)) {
         	if (PTR_ERR(clk) =3D=3D -EPROBE_DEFER)
                	return -EPROBE_DEFER;
                else
                	clk =3D NULL;
         }

>> > +		/*
>> > +		 * Try to get the information for HUB reset, the
>> > +		 * default setting like below:
>> > +		 *
>> > +		 * - Reset state is low
>> > +		 * - The duration is 50us
>> > +		 */
>> > +		if (of_find_property(node, "hub-reset-active-high", NULL))
>> > +			reset_pol =3D 1;
>>=20
>> you see, this is definitely *not* generic. You should write a generic
>> reset-gpio.c reset controller and describe the polarity on the gpio
>> binding. This driver *always* uses reset_assert(); reset_deassert(); and
>> reset-gpio implements though by gpiod_set_value() correctly.
>>=20
>> Polarity _must_ be described elsewhere in DT.
>>=20
>> > +		of_property_read_u32(node, "hub-reset-duration-us",
>> > +			&duration_us);
>>=20
>> likewise, this should be described as a debounce time for the GPIO.
>>=20
>
> Yes, if we are a reset gpio driver.

even if you use a raw GPIO, polarity and duration must come through DT.

>> > +		usleep_range(duration_us, duration_us + 100);
>> > +		gpiod_set_value(gpiod_reset, reset_pol ? 0 : 1);
>>=20
>> wrong. You should _not_ have polarity checks here. You should have
>> already initialized the gpio as ACTIVE_HIGH or ACTIVE_LOW and gpiolib
>> will handle the polarity for you.
>
> Yes, you are right. I did not understand ACTIVE_LOW for gpio flag
> before.

with open source code, that's a rather poor excuse, Peter.

>> > +static int __init usb_hub_generic_init(void)
>> > +{
>> > +	return platform_driver_register(&usb_hub_generic_driver);
>> > +}
>> > +subsys_initcall(usb_hub_generic_init);
>> > +
>> > +static void __exit usb_hub_generic_exit(void)
>> > +{
>> > +	platform_driver_unregister(&usb_hub_generic_driver);
>> > +}
>> > +module_exit(usb_hub_generic_exit);
>>=20
>> module_platform_driver();
>
> I want this driver to be called before module init's.

why ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWZuE6AAoJEIaOsuA1yqREPUcP+wRaVBU0fqFhOBhtgm9StdpC
ufymP2hbCqXLm/2l9nAoTeyX0cFuv6EIOJ0S924G0WurKZyRkFpfSMpk3x8y+8gH
I9rjLWn1YaCWmJ6z6dsEiXSo7VrjJNfA4jBKUxiruTcw1y+vZ8yj9/eAFXXfYc1I
VL54qxWf7pZIzJL1Ehax5dwP+Y0HvKnq6+JTgGFqbQdKIUopyX7M3E8r6HVtqkV4
hFS/r9VQ+tHU5/Xii6Jfa1JZOCL8Aq/qyjPadC9syJo93IbcVMXdP7+rwEf+7Xjp
yXwtBLlWbf1ct7Ll1sIkW/wSHXpgwNrhIRoZbq51z4zgl995MklsA35ZPZhissld
Cj8GBK3F2TFoy0xJmZ1KJAotGXKN4Iqeoe5uVgup4+e2vsepb35QLeiGFKdRYrPQ
XxwdKX8L07twVrXjkN9u4Pj+nwaAPinamqa/a9DkYDoafjuCy6Y+eDe1VpdnMoZb
JbeF7W4A8PDGTxsaL/O2ZPtJzwsC37yrYM0ruEvFX0RXXy1yG48t+tnA45dMbSZH
eEJOrsLigwel7+I936pzbHFf83Jwqxk/cXi/CMyhjTmgnK5RgZftqKYDuF1GFXT6
mfnXOAzssKCrz6PVlNMcP9WT6OPhyglcGwqv3YuOuyAvaBwx9GWxL5tPzF2mGV1G
Svf3YH//Y5wqoFg+Ml+X
=UGl0
-----END PGP SIGNATURE-----
--=-=-=--


--===============2378278076755098551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2378278076755098551==--
