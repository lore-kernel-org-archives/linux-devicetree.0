From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] pinctrl: cygnus: add initial pinctrl support
Date: Tue, 13 Jan 2015 09:25:57 +0100
Message-ID: <CACRpkdZUaB-tt2N0dbaV5RkVS5PuFi63TqgOg15Jb2ACH52Yug@mail.gmail.com>
References: <rjui@broadcom.com>
	<1417131990-17954-1-git-send-email-rjui@broadcom.com>
	<1417131990-17954-3-git-send-email-rjui@broadcom.com>
	<CACRpkdbZx1hcvd-q9AL3FPQRqU+wJjeSV8AdSno5PVr+fqhpRQ@mail.gmail.com>
	<54B0201E.3000307@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B0201E.3000307-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Chris Boot <bootc-1Slo4GeK4H1eoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 9, 2015 at 7:38 PM, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 1/9/2015 3:03 AM, Linus Walleij wrote:
>> On Fri, Nov 28, 2014 at 12:46 AM, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:

>> I don't know if the hardware has any similarity though, so invite
>> the authors of the previous drivers to review this code.
>>
> They are completely different. The only similarity between Cygnus and
> bcm281xx pinctrl is that they use the same concept of alternation
> functions (1, 2, 3, 4) for mux configuration.

Then you can probably look at that driver for inspiration on how to han=
dle
the situation you described earlier with collissions.

>>> +/*
>>> + * List of groups of pins
>>> + */
>>> +static const unsigned gpio0_pins[] =3D { 12 };
>>> +static const unsigned gpio1_pins[] =3D { 13 };
>>> +static const unsigned gpio2_pins[] =3D { 14 };
>>> +static const unsigned gpio3_pins[] =3D { 15 };
>>> +static const unsigned gpio4_pins[] =3D { 16 };
>>> +static const unsigned gpio5_pins[] =3D { 17 };
>>> +static const unsigned gpio6_pins[] =3D { 18 };
>>> +static const unsigned gpio7_pins[] =3D { 19 };
>>> +static const unsigned gpio8_pins[] =3D { 20 };
>>> +static const unsigned gpio9_pins[] =3D { 21 };
>>> +static const unsigned gpio10_pins[] =3D { 22 };
>>> +static const unsigned gpio11_pins[] =3D { 23 };
>>> +static const unsigned gpio12_pins[] =3D { 24 };
>>> +static const unsigned gpio13_pins[] =3D { 25 };
>>> +static const unsigned gpio14_pins[] =3D { 26 };
>>> +static const unsigned gpio15_pins[] =3D { 27 };
>>> +static const unsigned gpio16_pins[] =3D { 28 };
>>> +static const unsigned gpio17_pins[] =3D { 29 };
>>> +static const unsigned gpio18_pins[] =3D { 30 };
>>> +static const unsigned gpio19_pins[] =3D { 31 };
>>> +static const unsigned gpio20_pins[] =3D { 32 };
>>> +static const unsigned gpio21_pins[] =3D { 33 };
>>> +static const unsigned gpio22_pins[] =3D { 34 };
>>> +static const unsigned gpio23_pins[] =3D { 35 };
>>
>> Have you considered implementing .gpio_request_enable()
>> and .gpio_disable_free() to get around having to have one
>> group for each GPIO line?
>>
> Okay the Cygnus pin controller is really a mess. GPIO 0 ~ GPIO23 are
> really 23 distinct groups, each with one pin. Then the rest of GPIOs =
go
> under other groups. In general, when we set a group to alternate
> function 4, all pins become GPIO.

It will require some complicated code no matter how you
handle it I'm afraid. Rely on the pin control subsystem
to handle collisions though.

>>> +static const unsigned qspi_gpio_pins[] =3D { 108, 109 };
>>> +static const unsigned smart_card0_fcb_pins[] =3D { 45 };
>>> +static const unsigned smart_card1_fcb_pins[] =3D { 51 };
>>> +static const unsigned gpio0_3p3_pins[] =3D { 176 };
>>> +static const unsigned gpio1_3p3_pins[] =3D { 177 };
>>> +static const unsigned gpio2_3p3_pins[] =3D { 178 };
>>
>> Looks good...
>>
> Note these pins are definitions in the driver that help to describe t=
he
> pad layout. We can't really configure any individual pins in Cygnus.

Yeah it's a groupwise controller then, that's similar to
e.g. the coh901 driver.

We should be able to accomodate this...

>>> +static int cygnus_dt_node_to_map(struct pinctrl_dev *pctrl_dev,
>>> +               struct device_node *np, struct pinctrl_map **map,
>>> +               unsigned *num_maps)
>>> +{
>>
>> After S=C3=B6ren Brinkmanns patches youy should be able to use core
>> functions for this and avoid this code altogether.
>
> Will that help to take care our case, based on the way we will use
> "function" and "group"?

groupS but yes it will work with your controller, though I think
=2Eset_mux and the controller state will need some elaborate code
to handle what the framework requests.

>>> +       num_groups =3D of_property_count_strings(np, "brcm,groups")=
;
>>
>> As mentioned, just "groups".
>>
> I guess I will use "group"?

No groups, as with the standard attribute "gpios", this may be
a single group too, it's just a standard binding.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
