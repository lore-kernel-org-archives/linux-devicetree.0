From: "Sherman Yin" <syin@broadcom.com>
Subject: Re: [PATCH 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Tue, 5 Nov 2013 18:02:01 -0800
Message-ID: <5279A319.5060701@broadcom.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com>
 <051069C10411E24D9749790C498526FA1BE0B7D7@SJEXCHMB12.corp.ad.broadcom.com>
 <CACRpkdYSLxp2M4HghcUdjEYGh-UQ+DaiCGp6yee+Qds6DR9poA@mail.gmail.com>
 <201311050026.56321.heiko@sntech.de> <527835FE.2030102@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <527835FE.2030102@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, =?ISO-8859-1?Q?Heiko_St=FCb?= =?ISO-8859-1?Q?ner?= <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-11-04 04:04 PM, Stephen Warren wrote:
> On 11/04/2013 04:26 PM, Heiko St=FCbner wrote:
>
>> I remember we had a discussion about how things like bias-disable ex=
plicitly
>> shouldn't have a value, when they are represented in the list-format=
:
>>
>> 		pcfg_pull_none: pcfg_pull_none {
>> 			bias-disable;
>> 		};
>>
>> so a bias-disable =3D <1> was explicitly "forbidden" [for a lack of =
a better
>> word]. And it was similar for other options, the parameter not meant=
 to be
>> indicating if they are active but really only setting the "strength"=
 or so.
>
> Pure Boolean values should be represented as a valueless property. If
> the property is present, the value is true, otherwise false.
>
> However, pinctrl bindings often don't represent Boolean values, but
> rather tri-states, with the following values:
>
> * Don't touch this configuration option at all (missing)
> * Enable the option (<1>)
> * Disable the option (<0>)
>
> The reason for using tri-states being that you might want to write:
>
> xxx1 {
>      pins =3D <PINA>, <PINB>, <PINC>;
>      function =3D <...>;
>      // this node doesn't affect pullup
> }
> xxx2 {
>      pins =3D <PINA>, <PINB>;
>      // this node doesn't affect function
>      pull-up =3D <1>; // change, and enable
> }
> xxx3 {
>      pins =3D <PINAC>;
>      // this node doesn't affect function
>      pull-up =3D <0>; // change, and disable
> }

If I understand correctly, in Stephen's example, if a certain driver=20
wants to configure PINA PINB and PINC, the pin configuration nodes=20
"xxx1", "xxx2", and "xxx3" will all have to be selected for the=20
particular pin state.  This works fine.  However, I'm just thinking tha=
t=20
it would have been easier if we could specify just one node:

xxx {
	pins =3D <PINA>, <PINB>, <PINC>;
	function =3D <...>;
	pull-up =3D <1 1 0>;
}

This "feature" seems a bit more concise to me and is what I did for my=20
original pinctrl driver.  The only downside is that with this method,=20
one cannot specify "don't touch this option for this pin" if the same=20
property must provide values for other pins.

When Linus asked me to try using generic pinconf instead, I ran into=20
problems with this feature due to how the generic pinconf properties ar=
e=20
defined differently than my properties - perhaps this feature just=20
doesn't work for generic pinconf-based drivers with the (Unless we are=20
ok with using 1/0 for boolean properties, but it has already been=20
pointed out that these should be valueless.).

While I'd love to be able define my pin config nodes this way, if I hav=
e=20
to use generic pinconf for the driver to be upstreamed, then I'm fine=20
with it.

Going back to some questions regarding generic pinconf properties -=20
could I get some help with these?

 >"input disable"
 >This setting disconnects the input (DIN) to the internal logic from=20
 >the pin pad. However, the output (DOUT) can still drive the pad.  It
 >seems to match PIN_CONFIG_OUTPUT, but the current generic option is
 >either "output-low" or "output-high" - are these referring to a stati=
c
 >output of 0 and 1?

What's the best property to use in this case?

 >"mode"
 >This controls several aspect of the pin (slew rate, pull up strength,
 >etc) to meet I2C specs for Standard/Fast mode vs High Speed mode.  I
 >think the best way is to map this to slew rate, which would require
 >some explanation because the meaning of slew rate differs depending o=
n
 >what pin function is selected:
 >- When I2C (*_SCL or *_SDA) function is selected for the pin: 0:
 >  Standard (100kbps)
 >  & Fast mode (400kbps), 1: High Speed mode (3.4Mbps)
 >- When IC_DM or IC_DP function is selected, 0: normal slew rate, 1:
 >  fast slew rate
 >- Else: 0: fast slew rate, 1: normal slew rate

Do we agree that the "slew rate" is the best property to use for "mode"=
?

Thanks,
Sherman

