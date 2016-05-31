From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
Date: Tue, 31 May 2016 23:34:48 +0900
Message-ID: <CAGTfZH1ZAD_R1q8COUE2hdrq24BS1muJ=7-_1VeHriBqH+aAZQ@mail.gmail.com>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
	<CGME20160527152945epcas1p4de3d2d43f94a20e3f93676b6c4f78244@epcas1p4.samsung.com>
	<20160527152934.GB12024@rob-hp-laptop>
	<574D32D7.2090902@samsung.com>
	<574D3EA7.9080907@samsung.com>
	<CAL_JsqLpWMX3X77xyVH=5+AtEaRiY9ShkEo0TdHOphqE654OXg@mail.gmail.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLpWMX3X77xyVH=5+AtEaRiY9ShkEo0TdHOphqE654OXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, May 31, 2016 at 10:35 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, May 31, 2016 at 2:35 AM, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>=
 wrote:
>> Hi Rob,
>>
>> On 2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 15:44, Chanwoo Choi wrote:
>>> On 2016=EB=85=84 05=EC=9B=94 28=EC=9D=BC 00:29, Rob Herring wrote:
>>>> On Thu, May 26, 2016 at 05:17:45PM +0530, Venkat Reddy Talla wrote=
:
>>>>> Add the support for Device tree bindings of extcon-gpio driver.
>>>>> The extcon-gpio device tree node must include the both 'extcon-id=
' and
>>>>> 'gpios' property.
>>>>
>>>> I think extcon bindings are a mess in general...
>>>>
>>>>> For example:
>>>>>     usb_cable: extcon-gpio-0 {
>>>>>             compatible =3D "extcon-gpio";
>>>>>             extcon-id =3D <EXTCON_USB>;
>>>>>             gpios =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>>>>>     }
>>>>>     ta_cable: extcon-gpio-1 {
>>>>>             compatible =3D "extcon-gpio";
>>>>>             extcon-id =3D <EXTCON_CHG_USB_DCP>;
>>>>>             gpios =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>>>>>             debounce-ms =3D <50>;     /* 50 millisecond */
>>>>>             wakeup-source;
>>>>>     }
>>>>
>>>> This is all 1 logical connector, the USB connector. Why are you
>>>> describing cables? Those are not part of the h/w and are dynamic.
>>>> Describe this as a connector which is one thing (i.e. node). Use a
>>>> compatible string that reflects the type of connector
>>>> (usb-microab-connector), not the driver you want to use. Then defi=
ne
>>>> GPIO lines needed to provide state information like VBus, ID, char=
ger
>>>> modes and control lines like soft connect (D+ pullup enable), VBus
>>>> enable, etc.
>>>
>>> You're right. The extcon-gpio driver will not use the "extcon-gpio"=
 raw compatible.
>>> As you commented[1], the each connector will have the unique name t=
o use the extcon-gpio.c driver.
>>> [1] https://lkml.org/lkml/2015/10/21/906
>>>
>>>
>>> For example,
>>> The extcon-gpio.c driver may have the different name including the =
h/w information
>>> according to the kind of external connector.
>>>
>>> static const struct of_device_id gpio_extcon_of_match[] =3D {
>>>       {
>>>               .compatible =3D "extcon-chg-sdp", /* SDP charger conn=
ector */
>>>               .data =3D EXTCON_CHG_SDP_DATA,
>>>       }, {
>>>               .compatible =3D "extcon-chg-dcp", /* DCP charger conn=
ector */
>>>               .data =3D EXTCON_CHG_DCP_DATA,
>>>       }, {
>>>               .compatible =3D "extcon-jack-microphone", /* Micropho=
ne jack connector */
>>>               .data =3D EXTCON_JACK_MICROPHONE_DATA,
>>>       }, {
>>>               .compatible =3D "extcon-disp-hdmi", /* HDMI connector=
*/
>>>               .data =3D EXTCON_DISP_HDMI_DATA,
>>>       },
>>>       ......
>>> };
>>
>> I reply it again.
>>
>> The extcon-gpio.c is very similar with existing gpio_keys.c driver[1=
]
>> [1] drivers/input/keyboard/gpio_keys.c
>
> There is a big difference in that each gpio-key is independent. The
> only state is pressed or not. A USB connector has multiple pieces of
> state information. You may be treating them independently, but I don'=
t
> think they should be.

I think that is it not different because the EXTCON can only notify the=
 whether
external connector is attached or detached such as gpio-key (pressed or=
 not).

EXTCON don't handle the any additional state except for attached or det=
ached.

>
>> The gpio_keys.c driver use the following style to support the device=
-tree.
>> It use the "gpio-keys" compatible and this dt node include the speci=
fic
>> 'key code' such as 'extcon-id =3D <EXTCON_CHG_USB_DCP>;'
>
> This is state information about what is currently attached. The
> analogy with gpio-keys would be multiple key codes on one gpio which
> would be broken...

I compared between 'gpis-keys'  and ' extcon-gpio' driver as following:

name      | gpio-keys                         | extcon-gpio
-----------------------------------------------------------------------=
----------------------
gpio        | gpios =3D <>                        | extcon-gpio =3D <>
-----------------------------------------------------------------------=
----------------------
type        | linux,code =3D <>                 | extcon-id =3D <>
-----------------------------------------------------------------------=
----------------------
key &      | KEY_POWER                  | EXTCON_USB
extcon id | KEY_VOLUME_UP         | EXTCON_CHG_USB_SDP
               | KEY_VOLUME_DOWN   | EXTCON_JACK_MICROPHONE
               | etc                                    | etc
-----------------------------------------------------------------------=
----------------------
state       | pressed or not                  | attached or detached
-----------------------------------------------------------------------=
----------------------

>
>>
>>         gpio_keys {
>>                 compatible =3D "gpio-keys";
>>
>>                 power_key {
>>                         gpios =3D <&gpx2 7 GPIO_ACTIVE_LOW>;
>>                         linux,code =3D <KEY_POWER>;
>>                         label =3D "power key";
>>                         debounce-interval =3D <10>;
>>                         wakeup-source;
>>                 };
>>         };
>>
>> If the extcon-gpio.c driver should have the separate compatible acco=
rding to
>> the kind of external connector, the list of compatible name of extco=
n-gpio.c driver
>> will be increased when new external connector is attached.
>
> So? Different h/w needs different compatible strings.
>
> But again, you are mixing describing the connector (only what is
> soldered on a board) and state information (what is attached). Do not
> put state information into DT (describe the gpio signals or chip that
> provides the state information).
>
>> The extcon-gpio.c driver can separate the kind of external connector
>> by using the 'extcon-id' property.
>
> This use of DT is just broken. Come up with another way.
>
> Rob

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
