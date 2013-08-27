From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH 2/3] pinctrl: at91: add support for generic pinconf
Date: Mon, 26 Aug 2013 21:54:18 -0600
Message-ID: <521C22EA.1050908@wwwdotorg.org>
References: <1377379926-11163-1-git-send-email-b.brezillon@overkiz.com> <1377380259-11290-1-git-send-email-b.brezillon@overkiz.com> <20130826175333.GF18627@ns203013.ovh.net> <521BA235.1090104@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <521BA235.1090104@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: boris brezillon <b.brezillon@overkiz.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Masanari Iida <standby24x7@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Richard Genoud <richard.genoud@gmail.com>, Heiko Stuebner <heiko@sntech.de>, James Hogan <james.hogan@imgtec.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/26/2013 12:45 PM, boris brezillon wrote:
> Hello Jean-Christophe,
>=20
> Le 26/08/2013 19:53, Jean-Christophe PLAGNIOL-VILLARD a =E9crit :
>> On 23:37 Sat 24 Aug     , Boris BREZILLON wrote:
>>> Add support for generic pin configuration to pinctrl-at91 driver.
=2E..
>>> a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
=2E..
>>> configures various pad settings
>>>   such as pull-up, multi drive, etc.
>>>     Required properties for iomux controller:
>>> -- compatible: "atmel,at91rm9200-pinctrl"
>>> +- compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinc=
trl".
>>> +  Add "generic-pinconf" to the compatible string list to use the
>>> generic pin
=2E..
>>> +pinctrl@fffff400 {
>>> +    #address-cells =3D <1>;
>>> +    #size-cells =3D <1>;
>>> +    ranges;
>>> +    compatible =3D "atmel,at91rm9200-pinctrl", "generic-pinconf",
>>> "simple-bus";
>> nack your break the backword compatibility
>>
>> if we use a old kernel with this new dt nothing will work
>> as the old kernel will never known the the "generic-pinconf" means
>> anything
>=20
> Your're right, I didn't think of this case (old kernel with new dt).

Well, just to be clear: If a new DT uses a new compatible value of any
kind, be it adding "generic-pinconf" or switching to "foo-yyy" rather
than "foo-yyy", it won't be compatible... That somewhat implies that yo=
u
can't ever replace an old binding with something new.
