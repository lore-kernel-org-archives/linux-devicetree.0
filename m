From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v4 6/6] pinctrl: add pinctrl gpio binding support
Date: Sat, 26 May 2012 09:58:06 -0700
Message-ID: <CAA+hA=QT83wqe8MOi4B4xY4zTGbQPVhKxwuU_A+cPg-U3JicGw@mail.gmail.com>
References: <1337952980-14621-1-git-send-email-b29396@freescale.com>
	<1337952980-14621-6-git-send-email-b29396@freescale.com>
	<20120526002950.062683E14F7@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120526002950.062683E14F7@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2012 at 5:29 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Fri, 25 May 2012 21:36:20 +0800, Dong Aisheng <b29396@freescale.co=
m> wrote:
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> This patch implements a standard common binding for pinctrl gpio ran=
ges.
>> Each SoC can add gpio ranges through device tree by adding a gpio-ma=
ps property
>> under their pinctrl devices node with the format:
>> <&gpio $gpio-specifier $pin_offset $count>
>> while the gpio phandle and gpio-specifier are the standard approach
>> to represent a gpio in device tree.
>> Then we can cooperate it with the gpio xlate function to get the gpi=
o number
>> from device tree to set up the gpio ranges map.
>>
>> Then the pinctrl driver can call pinctrl_dt_add_gpio_ranges(pctldev,=
 node)
>> to parse and register the gpio ranges from device tree.
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>> ---
>> Personally i'm not very satisfied with current solution due to a few=
 reasons:
>> 1) i can not user standard gpio api to get gpio number
>> 2) i need to reinvent a new api of_parse_phandles_with_args_ext whic=
h i'm not
>> sure if it can be accepted by DT maintainer.
>
> Right, as mentioned in my other email, doing it this way completely
> breaks the way the phandle-with-args pattern works. =A0That pattern
> depends on the phandle node to have a #-cells property telling it how
> many cells to process for the binding. =A0Adding additional data cell=
s
> means the kernel is no longer able to parse multiple entries in the
> gpios property.
Hmm, it can still parse multiple entries in the gpios property except
that it adds two args although it's not related to gpio, but it is usef=
ul
for users for special case like pinctrl gpio ranges map.

>
>> If i did not invent that API, i need to rewrite a lot of duplicated =
code
>> with slight differences with the exist functions like of_get_named_g=
pio_flags
>> and of_parse_phandle_with_args for the special pinctrl gpio maps for=
mat.
>>
>> So i just sent it out first to see people's comment and if any bette=
r solution.
>>
>> One alternative solution is that that the gpio-maps into two parts:
>> pinctrl-gpios =3D <&gpio_phandle gpio-specifier ..>
>> pinctrl-gpio-maps =3D <pin_id count ..>
>> Then we can reuse the standard gpio api altough it's not better than=
 the
>> original one.
>>
>> Comments are welcome!
>>
>> ChangeLog v3->v4:
>> * using standard gpio parsing approach to get the gpio number from d=
evice
>> =A0 tree. The gpio-maps becomes a little slightly different as befor=
e:
>> =A0 <&gpio $gpio_specifier $pin_offset $npin>.
>> =A0 The $gpio_specifier length is controller dependent which is spec=
ified by
>> =A0 '#gpio-cells' in in gpio controller node.
>>
>> ChangeLog v2->v3:
>> * standardise the gpio ranges node name to 'gpio-maps'. Each SoC sho=
uld use this
>> node name to define gpio ranges.
>> * defer probe if can not get gpiochip from node in case gpio driver =
is still
>> not loaded.
>> * some other minor fixes suggested by Stephen Warren.
>>
>> ChangeLog v1->v2:
>> * introduce standard binding for gpio range.
>> ---
>> =A0.../bindings/pinctrl/pinctrl-bindings.txt =A0 =A0 =A0 =A0 =A0| =A0=
 22 +++++
>> =A0drivers/pinctrl/devicetree.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 95 ++++++++++++++++++++
>> =A0include/linux/pinctrl/pinctrl.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 11 +++
>> =A03 files changed, 128 insertions(+), 0 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindi=
ngs.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.tx=
t
>> index c95ea82..e999be5 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> @@ -126,3 +126,25 @@ device; they may be grandchildren, for example.=
 Whether this is legal, and
>> =A0whether there is any interaction between the child and intermedia=
te parent
>> =A0nodes, is again defined entirely by the binding for the individua=
l pin
>> =A0controller device.
>> +
>> +=3D=3D=3D pinctrl gpio ranges =3D=3D=3D
>> +Some pins in pinctrl device can also be multiplexed as gpio. With a=
 gpio range
>> +map, user can know which pin in the range can be used as gpio.
>> +
>> +Required properties:
>> +gpio-maps: integers array, each entry in the array represents a gpi=
o range
>> +with the format: <&gpio $gpio-specifier $pin_offset $count>
>> +- gpio: phandle pointing at gpio device node
>> +- gpio-specifier: array of #gpio-cells specifying specific gpio, th=
e length is
>> + =A0controller specific. Usually it may be two cells for simple gpi=
o.
>> +- pin_offset: integer, the pin offset or pin id
>> +- npins: integer, the gpio ranges starting from pin_offset
>> +
>> +For example:
>> +pincontroller {
>> + =A0 =A0 /* gpio-specifier is two cells */
>> + =A0 =A0 gpio-maps =3D <&gpio1 0 0 0 32
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&gpio2 0 0 0 30
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&gpio3 1 0 100 1
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0....>;
>
> Hmmm.... I need more information about this gpio-maps property. =A0Ho=
w
> is it arranged? =A0What kind of data is in it. =A0Can you give some
> specific examples of how hardware would be described with a gpio-maps
> property?
>
=46or exampe:
MX6Q_PAD_SD2_DAT2__GPIO_1_13 means MX6Q_PAD_SD2_DAT2 can be used as GPI=
O_1_13,
=46or reference gpio1,13, we usually do: xx-gpios =3D <gpio1 13 0> in d=
evice tree.
Here we want to create a pin map of gpio1,13 to MX6Q_PAD_SD2_DAT2 for
pinctrl gpio ranges map,
the format should be <GPIO_NUMBER PIN_ID NPINS>, then the pinctrl core
can automatically mux
the PIN_ID to gpio function by refer to this map.
=46or GPIO_NUMBER, we want to use the standard gpio dt represent way
since the gpio base may
be dynamically.
Assume MX6Q_PAD_SD2_DAT2 pin id is 1 and only one pin starting from it
can be used as gpio.
Then the gpio-maps for MX6Q_PAD_SD2_DAT2 can be:
gpio-maps =3D <gpio1 13 0 1 1>

We may have several pins can be used as gpio on mx6q.
Then the gpio-maps may becomes:
gpio-maps =3D <gpio1 13 0 1 1>,
                   <gpio1 14 0 5 1>,
                   <gpio2 0 0 20 1>,
                   ................

Since the format is a little different from the standard gpio
represent way, so i can not use the standard gpio
api to parse the gpio number. That's why i need to invent
of_parse_phandle_args_ext function for this special
format.

we still did not find any better way to do that.
Do you have any suggestion for this special case?

Regards
Dong Aisheng
