From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 17:52:02 +0200
Message-ID: <194BE134-7804-4E84-BD5D-AB9A5892ED6F@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <20141024070042.GL10262@pengutronix.de> <5FB7B7FD-7B5B-4250-BADE-85573FDBBE48@konsulko.com> <20141025144229.GR10262@pengutronix.de> <16E8EC52-0A91-4F28-8113-3CC5352215A5@konsulko.com> <20141027152306.GV10262@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141027152306.GV10262@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Steffen,

> On Oct 27, 2014, at 17:23 , Steffen Trumtrar <s.trumtrar@pengutronix.=
de> wrote:
>=20
> Hi!
>=20
> On Mon, Oct 27, 2014 at 01:54:20PM +0200, Pantelis Antoniou wrote:
>> Hi Stefen,
>>=20
>>> On Oct 25, 2014, at 17:42 , Steffen Trumtrar <s.trumtrar@pengutroni=
x.de> wrote:
>>>=20
>>> Hi Pantelis!
>>>=20
>>> On Fri, Oct 24, 2014 at 12:20:53PM +0300, Pantelis Antoniou wrote:
>>>> Hi Stefan, Allan,
>>>>=20
>>>> Sorry, haven=E2=80=99t had a chance to review all this yet; will d=
o so in the weekend.
>>>> Just wanted to pop in and comment on a few things.
>>>>=20
>>>>> On Oct 24, 2014, at 10:00 AM, Steffen Trumtrar <s.trumtrar@pengut=
ronix.de> wrote:
>>>>>=20
>>>>> Hi!
>>>>>=20
>>>>> On Thu, Oct 23, 2014 at 06:51:06PM -0500, atull@opensource.altera=
=2Ecom wrote:
>>>>>> From: Alan Tull <atull@opensource.altera.com>
>>>>>=20
>>>>> (...)
>>>>>=20
>>>>>> diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2f=
pga-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga=
-bridge.txt
>>>>>> new file mode 100644
>>>>>> index 0000000..bc24a2e
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bri=
dge.txt
>>>>>> @@ -0,0 +1,53 @@
>>>>>> +Altera FPGA/HPS Bridge Driver
>>>>>> +
>>>>>> +This driver manages a bridge between a FPGA and a host processo=
r system (HPS).
>>>>>> +User space can enable or disable the bridge by writing a "1" or=
 a "0",
>>>>>> +respectively, to its enable file under bridge's entry in
>>>>>> +/sys/class/fpga-bridge.  Typically, one disables the bridges be=
fore
>>>>>> +reprogramming the FPGA.  Once the FPGA is reprogrammed, the bri=
dges are
>>>>>> +reenabled.
>>>>>> +
>>>>>=20
>>>>> NAK.
>>>>>=20
>>>>> This is all linux specific and doesn't belong here.
>>>>>=20
>>>>=20
>>>> We know. The DT spec hasn=E2=80=99t been updated for a while, and =
this is going to be
>>>> part of what we want to do with the restarting of the ePAPR spec p=
rocess.
>>>>=20
>>>=20
>>> As we don't have a new spec yet, I go with the current state of the=
 art.
>>> And I don't see how "file under ... /sys/class/fpga-bridge" fits th=
e
>>> current spec.
>>>=20
>>>> So absolutes like =E2=80=9CDT is a hardware description only" migh=
t be too strong statements, that
>>>> do not work in practice anymore.
>>>>=20
>>>> There=E2=80=99s no such thing as pure hardware devices lately - th=
ere is always a configuration
>>>> component; some of it OS specific, some of it not.
>>>>=20
>>>=20
>>> If it really is necessary, I'm not against it, don't get me wrong.
>>> But in the grand scheme I wouldn't say that this fits my experience=
=2E
>>> There are some devices that need configuration and often when it is
>>> done in the DT, it is just a shortcut or not thought through.
>>> And can be also introspected dynamically. With some discussion on t=
he
>>> list these bindings often change.
>>>=20
>>=20
>> Already answered and given a possible way this might work; admittedl=
y this
>> specific example is not a good fit for what I was trying to say, but=
 whatever.
>> Let=E2=80=99s get the ball rolling.
>>=20
>=20
> I would be okay with chosen-node. Not for this driver; but in general=
=2E
>=20

Let=E2=80=99s figure out how to do it then=E2=80=A6

>>> Regarding OS specifics: already there, e.g. console setup in the ch=
osen node.
>>> And other things I saw are ethernet aliases just for u-boot. Not a =
problem
>>> of the spec, just a problem of u-boot and unneccessary "configurati=
on".
>>> Just to fix a bad bootloader. barebox can handle this without any
>>> such stuff. Maybe we should integrate the DT "overlays" barebox use=
s into
>>> the in-kernel DTs as well...but does it really help/interest someon=
e who
>>> decides to use u-boot where barebox stores its environment? I guess=
 not.
>>>=20
>>=20
>> Although I=E2=80=99m not against having DT overlays in the bootloade=
r, I only see them
>> as a method that helps a platform developer express things easier. I=
 am completely
>> against having the kernel tied to any particular bootloader.
>>=20
>> We=E2=80=99ve all been through the hell where a kernel only boots if=
 the bootloader has=20
>> setup the platform =E2=80=9Ccorrectly=E2=80=9D. This =E2=80=9Ccorrec=
tly=E2=80=9D has a very loose definition and
>> 99/100 times is extremely badly documented or not at all.
>>=20
>> IMHO the bootloader should (as part of the normal boot sequence) onl=
y setup the
>> absolutely bare minimum and then pass control to the kernel as soon =
as possible.
>>=20
>> The full featured bootloader environment should only be presented wh=
en the user
>> requests so.
>>=20
>=20
> Totally agree. The kernel shouldn't be tied to any bootloader if at a=
ll possible
> (the SoCFPGA is an especially bad example here again, as the pinmuxin=
g can only
> happen in the bootloader).

I=E2=80=99m not familiar with SoCFPGA. Why pinmuxing is only possible i=
n the bootloader?
Can=E2=80=99t the bootloader configure the minimum pinmux config and th=
en have Linux setup
the rest?

If we=E2=80=99re feeling particularly nasty, we might just require boot=
loaders to clean the
hardware state before passing control to Linux (besides memory controll=
er setup) and
see what=E2=80=99s broken.

> But should the DT include stuff than, that is only interesting for li=
nux?
>=20

Like it or not it=E2=80=99s Linux that=E2=80=99s in the forefront of ma=
ny hardware designs.

There are configuration settings in DT that are part of the way hardwar=
e is presented to
Linux and user-space, and have been for quite some time. We=E2=80=99ve =
been pretending they don=E2=80=99t
exist, but they are there=E2=80=A6

We have a chance to try to get it right, so why not do so?

>>>> We have to be engaged in the process and figure out how to update =
the spec for what is
>>>> now the state of the art in the industry.
>>>>=20
>>>=20
>>> Again, not against that if it is necessary. For example your overla=
y stuff might
>>> be a good update to the spec. Would be better if it is official ins=
tead of a "hack".
>>> I want that for SoCFPGA.
>>>=20
>>> But having looked at one or two vendor kernels+DTs, the state of th=
e art in the
>>> industry is: using DT wrong. (And doing HW wrong, which makes some =
updates to the
>>> ePAPR necessary ;-))
>>>=20
>>=20
>> Vendor H/W, vendor DT and a crack pipe. Or as I call it Monday.
>>=20
>=20
> ;-)
>=20
> Regards,
> Steffen
>=20

Regards

=E2=80=94 Pantelis

> --=20
> Pengutronix e.K.                           |                         =
    |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=
    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5=
555 |

