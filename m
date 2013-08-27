From: boris brezillon <b.brezillon@overkiz.com>
Subject: Re: [RFC PATCH 2/3] pinctrl: at91: add support for generic pinconf
Date: Tue, 27 Aug 2013 08:04:39 +0200
Message-ID: <521C4177.4030104@overkiz.com>
References: <1377379926-11163-1-git-send-email-b.brezillon@overkiz.com> <1377380259-11290-1-git-send-email-b.brezillon@overkiz.com> <20130826175333.GF18627@ns203013.ovh.net> <521BA235.1090104@overkiz.com> <521C22EA.1050908@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <521C22EA.1050908@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Masanari Iida <standby24x7@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Heiko Stuebner <heiko@sntech.de>, James Hogan <james.hogan@imgtec.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 27/08/2013 05:54, Stephen Warren wrote:
> On 08/26/2013 12:45 PM, boris brezillon wrote:
>> Hello Jean-Christophe,
>>
>> Le 26/08/2013 19:53, Jean-Christophe PLAGNIOL-VILLARD a =E9crit :
>>> On 23:37 Sat 24 Aug     , Boris BREZILLON wrote:
>>>> Add support for generic pin configuration to pinctrl-at91 driver.
> ...
>>>> a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> ...
>>>> configures various pad settings
>>>>    such as pull-up, multi drive, etc.
>>>>      Required properties for iomux controller:
>>>> -- compatible: "atmel,at91rm9200-pinctrl"
>>>> +- compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pin=
ctrl".
>>>> +  Add "generic-pinconf" to the compatible string list to use the
>>>> generic pin
> ...
>>>> +pinctrl@fffff400 {
>>>> +    #address-cells =3D <1>;
>>>> +    #size-cells =3D <1>;
>>>> +    ranges;
>>>> +    compatible =3D "atmel,at91rm9200-pinctrl", "generic-pinconf",
>>>> "simple-bus";
>>> nack your break the backword compatibility
>>>
>>> if we use a old kernel with this new dt nothing will work
>>> as the old kernel will never known the the "generic-pinconf" means
>>> anything
>> Your're right, I didn't think of this case (old kernel with new dt).
> Well, just to be clear: If a new DT uses a new compatible value of an=
y
> kind, be it adding "generic-pinconf" or switching to "foo-yyy" rather
> than "foo-yyy", it won't be compatible... That somewhat implies that =
you
> can't ever replace an old binding with something new.

That's absolutely right, however the behaviour won't be the same in bot=
h=20
cases.

1) If your (new) dt defines its pinctrl using the "foo-pinconf"=20
compatible string and
     your (old) kernel does not support it, the pinctrl will never prob=
e=20
the pinctrl definitions.
     Moreover, if you want to define both old ("foo-pinctrl") and new=20
("foo-pinconf") pinctrl
     definitions in your dt in order to support several kernel versions=
,=20
nothing prevents you
     from doing it.

2) In the other hand, if you use an additional "generic-pinconf"=20
compatible string to signify
     wether or not the pinctrl definition use the generic pinconf dt=20
binding, the (old) kernel
     will probe the pinctrl definitions, ignore the "generic-pinconf"=20
string, and fail when parsing
     the pinctrl configuration nodes (which are invalid pinctrl functio=
n=20
nodes in the current dt binding).
     We have the same problem when using the 'atmel,generic-pinconf'=20
property inside a pinctrl node:
     old kernels won't take this property into account.

