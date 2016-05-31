From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
Date: Tue, 31 May 2016 16:35:03 +0900
Message-ID: <574D3EA7.9080907@samsung.com>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
 <CGME20160527152945epcas1p4de3d2d43f94a20e3f93676b6c4f78244@epcas1p4.samsung.com>
 <20160527152934.GB12024@rob-hp-laptop> <574D32D7.2090902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <574D32D7.2090902@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 15:44, Chanwoo Choi wrote:
> On 2016=EB=85=84 05=EC=9B=94 28=EC=9D=BC 00:29, Rob Herring wrote:
>> On Thu, May 26, 2016 at 05:17:45PM +0530, Venkat Reddy Talla wrote:
>>> Add the support for Device tree bindings of extcon-gpio driver.
>>> The extcon-gpio device tree node must include the both 'extcon-id' =
and
>>> 'gpios' property.
>>
>> I think extcon bindings are a mess in general...
>>
>>> For example:
>>> 	usb_cable: extcon-gpio-0 {
>>> 		compatible =3D "extcon-gpio";
>>> 		extcon-id =3D <EXTCON_USB>;
>>> 		gpios =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>>> 	}
>>> 	ta_cable: extcon-gpio-1 {
>>> 		compatible =3D "extcon-gpio";
>>> 		extcon-id =3D <EXTCON_CHG_USB_DCP>;
>>> 		gpios =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>>> 		debounce-ms =3D <50>;	/* 50 millisecond */
>>> 		wakeup-source;
>>> 	}
>>
>> This is all 1 logical connector, the USB connector. Why are you=20
>> describing cables? Those are not part of the h/w and are dynamic.=20
>> Describe this as a connector which is one thing (i.e. node). Use a=20
>> compatible string that reflects the type of connector=20
>> (usb-microab-connector), not the driver you want to use. Then define=
=20
>> GPIO lines needed to provide state information like VBus, ID, charge=
r=20
>> modes and control lines like soft connect (D+ pullup enable), VBus=20
>> enable, etc.
>=20
> You're right. The extcon-gpio driver will not use the "extcon-gpio" r=
aw compatible.
> As you commented[1], the each connector will have the unique name to =
use the extcon-gpio.c driver.
> [1] https://lkml.org/lkml/2015/10/21/906
>=20
>=20
> For example,
> The extcon-gpio.c driver may have the different name including the h/=
w information
> according to the kind of external connector.
>=20
> static const struct of_device_id gpio_extcon_of_match[] =3D {
> 	{
> 		.compatible =3D "extcon-chg-sdp",	/* SDP charger connector */
> 		.data =3D EXTCON_CHG_SDP_DATA,
> 	}, {
> 		.compatible =3D "extcon-chg-dcp",	/* DCP charger connector */
> 		.data =3D EXTCON_CHG_DCP_DATA,
> 	}, {
> 		.compatible =3D "extcon-jack-microphone", /* Microphone jack connec=
tor */
> 		.data =3D EXTCON_JACK_MICROPHONE_DATA,
> 	}, {
> 		.compatible =3D "extcon-disp-hdmi", /* HDMI connector*/
> 		.data =3D EXTCON_DISP_HDMI_DATA,
> 	},
> 	......
> };

I reply it again.

The extcon-gpio.c is very similar with existing gpio_keys.c driver[1]
[1] drivers/input/keyboard/gpio_keys.c

The gpio_keys.c driver use the following style to support the device-tr=
ee.
It use the "gpio-keys" compatible and this dt node include the specific
'key code' such as 'extcon-id =3D <EXTCON_CHG_USB_DCP>;'

	gpio_keys {
		compatible =3D "gpio-keys";

		power_key {
			gpios =3D <&gpx2 7 GPIO_ACTIVE_LOW>;
			linux,code =3D <KEY_POWER>;
			label =3D "power key";
			debounce-interval =3D <10>;
			wakeup-source;
		};
	};

If the extcon-gpio.c driver should have the separate compatible accordi=
ng to
the kind of external connector, the list of compatible name of extcon-g=
pio.c driver
will be increased when new external connector is attached.

The extcon-gpio.c driver can separate the kind of external connector
by using the 'extcon-id' property.=20

Thanks,
Chanwoo Choi
