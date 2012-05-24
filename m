From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH RFC v3 3/3] pinctrl: add pinctrl gpio binding support
Date: Thu, 24 May 2012 09:42:29 +0800
Message-ID: <CAA+hA=Rb1Qix67QBthPjo_4d5ATWjA7pePembZRwJkPMtQNpjg@mail.gmail.com>
References: <1337779362-31259-1-git-send-email-b29396@freescale.com>
	<1337779362-31259-3-git-send-email-b29396@freescale.com>
	<4FBD4C13.8080209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4FBD4C13.8080209@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Dong Aisheng <b29396@freescale.com>, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 24, 2012 at 4:44 AM, Stephen Warren <swarren@wwwdotorg.org>=
 wrote:
> On 05/23/2012 07:22 AM, Dong Aisheng wrote:
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> This patch implements a standard common binding for pinctrl gpio ran=
ges.
>> Each SoC can add gpio ranges through device tree by adding a gpio-ma=
ps property
>> under their pinctrl devices node with the format:
>> <&gpio $gpio_offset $pin_offset $npin>.
>>
>> Then the pinctrl driver can call pinctrl_dt_add_gpio_ranges(pctldev,=
 node)
>> to parse and register the gpio ranges from device tree.
>>
>> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
>
> This is mostly good. Just a few comments:
>
>> +gpio-maps: 4 integers array, each entry in the array represents a g=
pio
>> +range with the format: <&gpio $gpio_offset $pin_offset $count>
>> +- gpio: phandle pointing at gpio device node
>> +- gpio_offset: integer, the local offset of $gpio
>> +- pin_offset: integer, the pin offset or pin id
>> +- npins: integer, the gpio ranges starting from pin_offset
>
> This uses a single cell to represent a GPIO ID within a GPIO controll=
er.
> The standard GPIO bindings use #gpio-cells, where that's a property i=
n
> the GPIO controller's node. I wonder if we shouldn't do the same here=
,
> and call into the GPIO driver to parse #gpio-cells and give back the
> Linux GPIO ID, just like of_get_named_gpio_flags() does. This would a=
lso
> make this code able to cope with the GPIO of_xlate function returning=
 a
> different GPIO chip, which Grant put in place for banked GPIO control=
lers.
>
I checked the code, the second cell only represents gpio flag in
of_gpio_simple_xlate which seems meaningless to pinctrl, so it looks
increase overhead to pinctrl gpio ranges map.
However, it seems i may have to agree that we need keep align with the
exist of gpio design to use the standard way to get gpio number via
of_xlate function rather than do it privately in pinctrl driver.

One disadvantage is that i can not reuse of_get_named_gpio_flags due
to different format
for gpio-maps, i may have to write a slightly different one as
of_get_named_gpio_flags
for gpio-maps.

>> diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetr=
ee.c
>
>> +int pinctrl_dt_add_gpio_ranges(struct pinctrl_dev *pctldev,
>
> The locking I was talking about before is between the following line:
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].gc =3D of_node_to_gpiochip(np_gp=
io);
>
> and this code:
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].name =3D dev_name(pctldev->dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].base =3D ranges[i].gc->base + gp=
io_offset;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].pin_base =3D pin_offset;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].npins =3D npins;
>
> If of_node_to_gpiochip() doesn't mark the GPIO chip as "in use", then
> the module that provides that device could be unloaded between the tw=
o
> blocks of code above.
>
Correct.

> Re: your locking comments in your other email: ranges[i].gc doesn't
> appear to be used anywhere else in pinctrl, so I think it's OK not to
> lock the GPIO chip for any more time than between the above two block=
s
> of code.
>
So i will add lock between them like:
ranges[i].gc =3D of_node_to_gpiochip(np_gpio);
if (!try_module_get(ranges[i].gc->owner))
    err...
ranges[i].name =3D dev_name(pctldev->dev);
ranges[i].base =3D ranges[i].gc->base + gpio_offset;
ranges[i].pin_base =3D pin_offset;
ranges[i].npins =3D npins;
module_put(ranges[i].gc->owner)
If anything wrong please let me know.

> Finally, just a minor nit:
>
>> + =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].gc =3D of_node_to_gpiochip(np_gp=
io);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!ranges[i].gc) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(pctldev->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "can not f=
ind gpio chip of node(%s)\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 np_gpio->n=
ame);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(np_gpio);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EPROBE_DEFER;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(np_gpio);
>
> could be slightly simpler:
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges[i].gc =3D of_node_to_gpiochip(np=
_gpio);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_node_put(np_gpio); <<<<<<<<<<<<<<<<<=
<<<<<<<<<<<<<<<<
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!ranges[i].gc) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(pctldev->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "can no=
t find gpio chip of node(%s)\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 np_gpio=
->name);
Because here still uese np_gpio,  Can i still use it after of_node_put?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EPROBE_DEFER;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }

Regards
Dong Aisheng
