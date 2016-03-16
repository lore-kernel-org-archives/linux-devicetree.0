From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v3 6/8] arm64: dts: rockchip: Add power key to GeekBox
Date: Wed, 16 Mar 2016 14:52:33 +0100
Message-ID: <56E96521.40304@suse.de>
References: <1457294038-14243-1-git-send-email-afaerber@suse.de>
 <1457294038-14243-7-git-send-email-afaerber@suse.de>
 <6BD669A2-4971-4702-8742-77C9994AA4E9@gmail.com> <56E93C43.1060500@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E93C43.1060500-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Chauveau <chauveau.julien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-rockchip <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 16.03.2016 um 11:58 schrieb Andreas F=C3=A4rber:
> Am 11.03.2016 um 00:04 schrieb Julien Chauveau:
>>> @@ -70,6 +71,19 @@
>>> 		pinctrl-0 =3D <&ir_int>;
>>> 	};
>>>
>>> +	keys: gpio-keys {
[...]
>>> +		compatible =3D "gpio-keys";
>>> +		pinctrl-names =3D "default";
>>> +		pinctrl-0 =3D <&pwr_key>;
>>> +
>>> +		button@0 {
[...]
>>> +			gpios =3D <&gpio0 2 GPIO_ACTIVE_LOW>;
>>> +			label =3D "GPIO Power";
>>> +			linux,code =3D <KEY_POWER>;
>>
>> According to Documentation/input/event-codes.txt, there=E2=80=99s a =
special event type for the power button.
>> Should we use it here for that purpose?
>>
>> 			linux,input-type =3D <EV_PWR>
>=20
> The other RK3368 boards don't, so unless you can give a justification=
 to
> convert all boards yet again and test how this makes a difference, I'=
d
> rather not do experiments here but leave that to someone who knows wh=
at
> they're doing and then do it consistently...

=46or the record here's an evtest log:

geekbox:~ # evtest
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:      gpio_ir_recv
/dev/input/event1:      MCE IR Keyboard/Mouse (gpio-rc-recv)
/dev/input/event2:      gpio-keys
Select the device event number [0-2]: 2
Input driver version is 1.0.1
Input device ID: bus 0x19 vendor 0x1 product 0x1 version 0x100
Input device name: "gpio-keys"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 116 (KEY_POWER)
Properties:
Testing ... (interrupt to exit)
Event: time 1458136008.850429, type 1 (EV_KEY), code 116 (KEY_POWER),
value 1
Event: time 1458136008.850429, -------------- SYN_REPORT ------------

systemd then goes on to shut down the system cleanly.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
