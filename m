From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4] extcon: gpio: Add the support for Device tree bindings
Date: Tue, 07 Jun 2016 10:52:52 +0900
Message-ID: <575628F4.7000109@samsung.com>
References: <1464263265-20187-1-git-send-email-vreddytalla@nvidia.com>
 <CGME20160527152945epcas1p4de3d2d43f94a20e3f93676b6c4f78244@epcas1p4.samsung.com>
 <20160527152934.GB12024@rob-hp-laptop> <574D32D7.2090902@samsung.com>
 <574D3EA7.9080907@samsung.com>
 <CAL_JsqLpWMX3X77xyVH=5+AtEaRiY9ShkEo0TdHOphqE654OXg@mail.gmail.com>
 <CAGTfZH1ZAD_R1q8COUE2hdrq24BS1muJ=7-_1VeHriBqH+aAZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAGTfZH1ZAD_R1q8COUE2hdrq24BS1muJ=7-_1VeHriBqH+aAZQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Venkat Reddy Talla <vreddytalla@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Ping.

Hi Rob,

I add some comment about gpio-keys and extcon-gpio.
I'm waiting for your reply.

On 2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 23:34, Chanwoo Choi wrote:
> Hi Rob,
>=20
> On Tue, May 31, 2016 at 10:35 PM, Rob Herring <robh@kernel.org> wrote=
:
>> On Tue, May 31, 2016 at 2:35 AM, Chanwoo Choi <cw00.choi@samsung.com=
> wrote:
>>> Hi Rob,
>>>
>>> On 2016=EB=85=84 05=EC=9B=94 31=EC=9D=BC 15:44, Chanwoo Choi wrote:
>>>> On 2016=EB=85=84 05=EC=9B=94 28=EC=9D=BC 00:29, Rob Herring wrote:
>>>>> On Thu, May 26, 2016 at 05:17:45PM +0530, Venkat Reddy Talla wrot=
e:
>>>>>> Add the support for Device tree bindings of extcon-gpio driver.
>>>>>> The extcon-gpio device tree node must include the both 'extcon-i=
d' and
>>>>>> 'gpios' property.
>>>>>
>>>>> I think extcon bindings are a mess in general...
>>>>>
>>>>>> For example:
>>>>>>     usb_cable: extcon-gpio-0 {
>>>>>>             compatible =3D "extcon-gpio";
>>>>>>             extcon-id =3D <EXTCON_USB>;
>>>>>>             gpios =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
>>>>>>     }
>>>>>>     ta_cable: extcon-gpio-1 {
>>>>>>             compatible =3D "extcon-gpio";
>>>>>>             extcon-id =3D <EXTCON_CHG_USB_DCP>;
>>>>>>             gpios =3D <&gpio3 2 GPIO_ACTIVE_LOW>;
>>>>>>             debounce-ms =3D <50>;     /* 50 millisecond */
>>>>>>             wakeup-source;
>>>>>>     }
>>>>>
>>>>> This is all 1 logical connector, the USB connector. Why are you
>>>>> describing cables? Those are not part of the h/w and are dynamic.
>>>>> Describe this as a connector which is one thing (i.e. node). Use =
a
>>>>> compatible string that reflects the type of connector
>>>>> (usb-microab-connector), not the driver you want to use. Then def=
ine
>>>>> GPIO lines needed to provide state information like VBus, ID, cha=
rger
>>>>> modes and control lines like soft connect (D+ pullup enable), VBu=
s
>>>>> enable, etc.
>>>>
>>>> You're right. The extcon-gpio driver will not use the "extcon-gpio=
" raw compatible.
>>>> As you commented[1], the each connector will have the unique name =
to use the extcon-gpio.c driver.
>>>> [1] https://lkml.org/lkml/2015/10/21/906
>>>>
>>>>
>>>> For example,
>>>> The extcon-gpio.c driver may have the different name including the=
 h/w information
>>>> according to the kind of external connector.
>>>>
>>>> static const struct of_device_id gpio_extcon_of_match[] =3D {
>>>>       {
>>>>               .compatible =3D "extcon-chg-sdp", /* SDP charger con=
nector */
>>>>               .data =3D EXTCON_CHG_SDP_DATA,
>>>>       }, {
>>>>               .compatible =3D "extcon-chg-dcp", /* DCP charger con=
nector */
>>>>               .data =3D EXTCON_CHG_DCP_DATA,
>>>>       }, {
>>>>               .compatible =3D "extcon-jack-microphone", /* Microph=
one jack connector */
>>>>               .data =3D EXTCON_JACK_MICROPHONE_DATA,
>>>>       }, {
>>>>               .compatible =3D "extcon-disp-hdmi", /* HDMI connecto=
r*/
>>>>               .data =3D EXTCON_DISP_HDMI_DATA,
>>>>       },
>>>>       ......
>>>> };
>>>
>>> I reply it again.
>>>
>>> The extcon-gpio.c is very similar with existing gpio_keys.c driver[=
1]
>>> [1] drivers/input/keyboard/gpio_keys.c
>>
>> There is a big difference in that each gpio-key is independent. The
>> only state is pressed or not. A USB connector has multiple pieces of
>> state information. You may be treating them independently, but I don=
't
>> think they should be.
>=20
> I think that is it not different because the EXTCON can only notify t=
he whether
> external connector is attached or detached such as gpio-key (pressed =
or not).
>=20
> EXTCON don't handle the any additional state except for attached or d=
etached.
>=20
>>
>>> The gpio_keys.c driver use the following style to support the devic=
e-tree.
>>> It use the "gpio-keys" compatible and this dt node include the spec=
ific
>>> 'key code' such as 'extcon-id =3D <EXTCON_CHG_USB_DCP>;'
>>
>> This is state information about what is currently attached. The
>> analogy with gpio-keys would be multiple key codes on one gpio which
>> would be broken...
>=20
> I compared between 'gpis-keys'  and ' extcon-gpio' driver as followin=
g:
>=20
> name       | gpio-keys                         | extcon-gpio
> ---------------------------------------------------------------------=
------------------------
> gpio       | gpios =3D <>                        | extcon-gpio =3D <>
> ---------------------------------------------------------------------=
------------------------
> type       | linux,code =3D <>                 | extcon-id =3D <>
> ---------------------------------------------------------------------=
------------------------
> key &      | KEY_POWER                  | EXTCON_USB
> extcon id  | KEY_VOLUME_UP         | EXTCON_CHG_USB_SDP
>            | KEY_VOLUME_DOWN   | EXTCON_JACK_MICROPHONE
>            | etc                                    | etc
> ---------------------------------------------------------------------=
------------------------
> state      | pressed or not                  | attached or detached
> ---------------------------------------------------------------------=
------------------------

>=20
>>
>>>
>>>         gpio_keys {
>>>                 compatible =3D "gpio-keys";
>>>
>>>                 power_key {
>>>                         gpios =3D <&gpx2 7 GPIO_ACTIVE_LOW>;
>>>                         linux,code =3D <KEY_POWER>;
>>>                         label =3D "power key";
>>>                         debounce-interval =3D <10>;
>>>                         wakeup-source;
>>>                 };
>>>         };
>>>
>>> If the extcon-gpio.c driver should have the separate compatible acc=
ording to
>>> the kind of external connector, the list of compatible name of extc=
on-gpio.c driver
>>> will be increased when new external connector is attached.
>>
>> So? Different h/w needs different compatible strings.
>>
>> But again, you are mixing describing the connector (only what is
>> soldered on a board) and state information (what is attached). Do no=
t
>> put state information into DT (describe the gpio signals or chip tha=
t
>> provides the state information).
>>
>>> The extcon-gpio.c driver can separate the kind of external connecto=
r
>>> by using the 'extcon-id' property.
>>
>> This use of DT is just broken. Come up with another way.
>>
>> Rob
>=20
> Thanks,
> Chanwoo Choi

Regards,
Chanwoo Choi
