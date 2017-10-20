MIME-Version: 1.0
In-Reply-To: <331B5EB4-9C97-4B2C-9B54-BF648F309A50@konsulko.com>
References: <20170821151651.25096-1-robh@kernel.org>
	<20170821151651.25096-6-robh@kernel.org>
	<CANk1AXTLT9gB_f0GZLODpppjkxqDAp1x1RZmQ8O1i+UHckimxw@mail.gmail.com>
	<CABGGisxU2OPZz-rrWYZYgCQ0iGM9w5vL9Ob9BTHALFN8JyxeJQ@mail.gmail.com>
	<59E69786.2030406@gmail.com>
	<CANk1AXStoiNtJfU0iNug1wKASurqH6OrNoaN=UtSh6xxSB088Q@mail.gmail.com>
	<CAL_JsqKR3Jg+tgZr4xGPtcWnZW7ng741YjuyUFaS2SXKXbxGtg@mail.gmail.com>
	<1508341985.25643.12.camel@hp800z>
	<CAL_JsqKJ74y3qHVqbRph5C8=0Ggb+n=JT3TZybu2+mENyZ1VZA@mail.gmail.com>
	<4393AFA4-620F-4C21-995D-A9806DAE1990@konsulko.com>
	<20171019200615.GA10743@tyrael.ni.corp.natinst.com>
	<59E91D4D.8000200@gmail.com>
	<331B5EB4-9C97-4B2C-9B54-BF648F309A50@konsulko.com>
Date: Fri, 20 Oct 2017 09:59:44 -0500
Message-ID: <CAL_JsqL3nv2ukc6j-LEvdxrLPQ+Y=BVKnFBTT5bUser7r4jAVA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] of/fdt: only store the device node basename in full_name
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Moritz Fischer <mdf@kernel.org>, Alan Tull <atull@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, David Laight <David.Laight@aculab.com>, linux-fpga@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 20, 2017 at 3:06 AM, Pantelis Antoniou <pantelis.antoniou@konsu=
lko.com> wrote:
> Hi Frank,
>
>> On Oct 20, 2017, at 00:46 , Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 10/19/17 13:06, Moritz Fischer wrote:
>>
>> < snip >
>>
>>> We also have plenty of code that is just not aware of overlays, and
>>> assumes certain parts of the tree to stay static.
>>
>> I would state that somewhat differently.  :-)  There is very little
>> code that is aware of overlays, and most code assumes the device tree
>> does not change after early boot.
>>
>> This is one of the areas where the creation of overlays needs to be
>> done with care.
>>
>
> Correct. But this is not breaking the kernel.
>
> In general we have the following case where we load overlays (at least
> well formed overlays that are not doing stupid things).
>
> 1. Activation of a new device. Usually this works since is something that=
=E2=80=99s
> normally done at boot.

Depends where in the tree it is.

> 2. Deactivation of a device. This might break because the removal paths
> of platform device especially are not well tested (or never executed for =
that
> matter).

It's more than just the removal path of a driver. What if you try to remove=
 a node that's a dependency of others. Generally, hot unplug of GPIOs, cloc=
ks, interrupt controllers, etc. don't work.

Plus we already have a way to disable devices. Unbind the driver.

> 3. Modification of properties in an already activated device. If the devi=
ce driver
> has not installed a device tree modification hook (as in almost 99% of th=
e devices)
> it will do absolutely nothing, since the device tree is parsed only at pr=
obe time.
> I can argue that for these cases we could have a catch-all hook that disp=
lays a
> message that nothing happened.

We don't know if a driver has kept pointers to property values or not. That=
's why we don't ever delete properties. If we are modifying or removing a p=
roperty, then we just add new ones. A rogue program repeatedly modifying a =
property and allocating memory might be a cause for concern.

> 4. Modification of some part of the tree that=E2=80=99s not part of a dev=
ice driver, perhaps
> the aliases or chosen node. This may potentially be harmful or harmless d=
epending on
> what has been modified. For instance modifying an already existing alias =
might cause
> internal inconsistency about device naming, while adding a new aliases sh=
ould be harmless.
> This is a matter of policy per board, whether to allow or not.
>
> Are there other cases that are potentially more harmful?
>
>>
>>> I ran into that issue when I tried to add thermal zones via an overlay,
>>> I've been investigating how to fix the thermal framework to work with
>>> overlays since then and have some partially working code.
>>> Currently the thermal framework parses the thermal-zones node at boot,
>>> and assumes this stays static. This breaks with overlays.
>>>
>>> I agree we eventually need to fix the parts that break when we use
>>> overlays.
>>
>
> Regards
>
> =E2=80=94 Pantelis
>
