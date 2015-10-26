From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] extcon: gpio: Add the support for Device tree bindings
Date: Mon, 26 Oct 2015 16:55:21 +0900
Message-ID: <562DDC69.7000604@samsung.com>
References: <1445402226-3912-1-git-send-email-cw00.choi@samsung.com>
 <CAL_JsqJczcqbNuT50aKK6RZMidJE0X=XQy8o5pe9V6qtKWkoNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAL_JsqJczcqbNuT50aKK6RZMidJE0X=XQy8o5pe9V6qtKWkoNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

=46irst of all, thanks for your review.

On 2015=EB=85=84 10=EC=9B=94 22=EC=9D=BC 07:35, Rob Herring wrote:
> On Tue, Oct 20, 2015 at 11:37 PM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org=
> wrote:
>> This patch adds the support for Device tree bindings of extcon-gpio =
driver.
>> The extcon-gpio device tree node must include the both 'extcon-id' a=
nd
>> 'extcon-gpio' property.
>=20
> I think this is too tied to the Linux driver. Instead, think about
> what the connector contains. I think you should define a usb connecto=
r
> node and compatible (e.g. usb-connector or usb-ab-connector). This

The Extcon framework support the various external connector.
You mean that extcon-gpio.c should have the separate compatible
for each external connector?

=46or example,
static const struct of_device_id gpio_extcon_of_match[] =3D {
	{
		.compatible =3D "extcon-usb",	/* USB connector */
		.data =3D EXTCON_USB_DATA,
	}, {
		.compatible =3D "extcon-chg-sdp",	/* SDP charger connector */
		.data =3D EXTCON_CHG_SDP_DATA,
	}, {
		.compatible =3D "extcon-chg-dcp",	/* DCP charger connector */
		.data =3D EXTCON_CHG_DCP_DATA,
	}, {
		.compatible =3D "extcon-jack-microphone", /* Microphone jack connecto=
r */
		.data =3D EXTCON_JACK_MICROPHONE_DATA,
	}, {
		.compatible =3D "extcon-disp-hdmi", /* HDMI connector*/
		.data =3D EXTCON_DISP_HDMI_DATA,
	},
	......

};

static struct platform_driver extcon_gpio_driver =3D {
	.probe	=3D gpio_extcon_probe,
	.remove	=3D gpio_extcon_remove,
	.driver	=3D {
		.name =3D "extcon-gpio",
		.of_match_table =3D gpio_extcon_of_match,
	},
};

> probably needs to distinguish the connector type as well especially
> with TypeC coming.

You're right. Currently Extcon framework don't support the setting of c=
onnector type
(e.g., USB Type A, Type B, Mini-A, Type-C ...)
I'm planing to add the extcon core API to support the connector type.

>=20
>>
>> For exmaple:
>>         usb_cable: extcon-gpio-0 {
>>                 compatible =3D "extcon-gpio";
>>                 extcon-id =3D <EXTCON_USB>;
>>                 extcon-gpio =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>=20
> This tied to a Vbus detect circuit?
>=20
> So "vbus-detect-gpios" in the connector node.

If extcon-gpio.c driver support the multiple comaptible for each extern=
al connector,
this driver will support the separate property name for gpio to get it =
from devicetree.

>=20
> For host side (or OTG host mode), you may also need a vbus-supply
> regulator property. OTG will also need an id-gpios for ID pin.

There is already drivers/extcon/extcon-usb-gpio.c driver for USB with G=
PIO.
[1] https://lkml.org/lkml/2015/2/2/187

>=20
>>         }
>>
>>         ta_cable: extcon-gpio-1 {
>=20
> This is all the same connector as above?
>=20
>>                 compatible =3D "extcon-gpio";
>>                 extcon-id =3D <EXTCON_CHG_USB_DCP>;
>>                 extcon-gpio =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>=20
> This is just detecting D+ and D- are both pulled high?

The extcon-gpio.c might be used to detect the external connector by usi=
ng only GPIO
which has not correlation to both D+  and D-. This GPIO pin is just use=
d to detect
the state whether external connector is attached or detached.

>=20
> So "dcp-detect-gpios" in the connector node.

ditto.

>=20
>>                 debounce-ms =3D <50>;     /* 50 millisecond */
>>                 wakeup-source;
>=20
> wakeup-source implies an interrupt as I read Sudeep's series. Either
> gpios need to be allowed or these need to be defined as interrupts.

You are right. I'm going to consider it and modify this driver with mor=
e proper method.

>=20
>>         }
>>
>>         &dwc3_usb {
>>                 extcon =3D <&usb_cable>;
>>         };
>>
>>         &charger {
>>                 extcon =3D <&ta_cable>;
>=20
> Not sure what to do with this. Both can point to a single connector
> node I think.

There are both extcon provider driver and client driver.

The extcon provider driver provide client driver to get whether cable s=
tate is attached
or detached. And then client driver is waiting the notification from ex=
tcon provider driver.
Before waiting the notification from extcon providier driver, the clien=
t driver should get
the instance of specific extcon provider driver to register the notifie=
r chain.

When getting the instance of specific extcon provider in device tree,
the client driver use the extcon_get_edev_by_phandle() function which
parses the phandle name of 'extcon'.

The latest Linux kernel includes the example[1][2] in arch/arm/boot/dts=
/omap5-cm-t54.dts

[1] http://www.spinics.net/lists/linux-omap/msg105074.html
- ARM: dts: sbc-t54: add support for sbc-t54 with cm-t54
[2] ARM: dts: cm-t54: setup omap_dwc3
- http://www.spinics.net/lists/linux-omap/msg111174.html

=46or example=20
&i2c1 {
	......
	palmas: palmas@48 {
		extcon_usb3: palmas_usb {
			compatible =3D "ti,plamas-usb-vid";
			ti,enable-vbus-detection;
			ti,enable-id-detection;
			ti,wakeup;
		};
		......
	};
	......
};

&usb3 {
	extcon =3D <&extcon_usb3>;
	vbus-supply =3D <...>;
};

Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
