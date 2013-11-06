From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Wed, 06 Nov 2013 10:00:22 -0700
Message-ID: <527A75A6.5010904@wwwdotorg.org>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com> <051069C10411E24D9749790C498526FA1BE0B7D7@SJEXCHMB12.corp.ad.broadcom.com> <CACRpkdYSLxp2M4HghcUdjEYGh-UQ+DaiCGp6yee+Qds6DR9poA@mail.gmail.com> <201311050026.56321.heiko@sntech.de> <527835FE.2030102@wwwdotorg.org> <5279A319.5060701@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5279A319.5060701-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/05/2013 07:02 PM, Sherman Yin wrote:
> On 13-11-04 04:04 PM, Stephen Warren wrote:
>> On 11/04/2013 04:26 PM, Heiko St=FCbner wrote:
>>
>>> I remember we had a discussion about how things like bias-disable
>>> explicitly
>>> shouldn't have a value, when they are represented in the list-forma=
t:
>>>
>>>         pcfg_pull_none: pcfg_pull_none {
>>>             bias-disable;
>>>         };
>>>
>>> so a bias-disable =3D <1> was explicitly "forbidden" [for a lack of=
 a
>>> better
>>> word]. And it was similar for other options, the parameter not mean=
t
>>> to be
>>> indicating if they are active but really only setting the "strength=
"
>>> or so.
>>
>> Pure Boolean values should be represented as a valueless property. I=
f
>> the property is present, the value is true, otherwise false.
>>
>> However, pinctrl bindings often don't represent Boolean values, but
>> rather tri-states, with the following values:
>>
>> * Don't touch this configuration option at all (missing)
>> * Enable the option (<1>)
>> * Disable the option (<0>)
>>
>> The reason for using tri-states being that you might want to write:
>>
>> xxx1 {
>>      pins =3D <PINA>, <PINB>, <PINC>;
>>      function =3D <...>;
>>      // this node doesn't affect pullup
>> }
>> xxx2 {
>>      pins =3D <PINA>, <PINB>;
>>      // this node doesn't affect function
>>      pull-up =3D <1>; // change, and enable
>> }
>> xxx3 {
>>      pins =3D <PINAC>;
>>      // this node doesn't affect function
>>      pull-up =3D <0>; // change, and disable
>> }
>=20
> If I understand correctly, in Stephen's example, if a certain driver
> wants to configure PINA PINB and PINC, the pin configuration nodes
> "xxx1", "xxx2", and "xxx3" will all have to be selected for the
> particular pin state.

You probably don't want to reference the individual xxx1/2/3 nodes in
the client pinctrl properties, but instead wrap them in a higher-level
node that represents the whole pinctrl state. Then, the client pinctrl
properties can reference just that single parent node, instead of many
small nodes. In other words:

pinctrl@... {
	...
	sx: state_xxx {
		xxx1 { ... };
		xxx2 { ... };
		xxx3 { ... };
	};
	sy: state_yyy {
		yyy1 { ... };
		yyy2 { ... };
	};
}

some_client@... {
	...
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&sx>;
};

other_client@... {
	...
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&sy>;
};

rather than:

pinctrl@... {
	...
	sx1: xxx1 { ... };
	sx2: xxx2 { ... };
	sx3: xxx3 { ... };
	sy1: yyy1 { ... };
	sy2: yyy2 { ... };
}

some_client@... {
	...
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&sx1 &sx2 &sx3>;
};

other_client@... {
	...
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&sy1 &sy2>;
};

This is exactly how the Tegra pinctrl bindings work for example.


> This works fine.  However, I'm just thinking that
> it would have been easier if we could specify just one node:
>=20
> xxx {
>     pins =3D <PINA>, <PINB>, <PINC>;
>     function =3D <...>;
>     pull-up =3D <1 1 0>;
> }
>=20
> This "feature" seems a bit more concise to me and is what I did for m=
y
> original pinctrl driver.  The only downside is that with this method,
> one cannot specify "don't touch this option for this pin" if the same
> property must provide values for other pins.

The other downside is that if the lists get even slightly long, it get
really hard to match up the entries in the t properties.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
