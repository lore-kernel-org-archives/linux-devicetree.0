From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: socfpga: fpga bridges bindings docs
Date: Mon, 27 Oct 2014 13:54:20 +0200
Message-ID: <16E8EC52-0A91-4F28-8113-3CC5352215A5@konsulko.com>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-3-git-send-email-atull@opensource.altera.com> <20141024070042.GL10262@pengutronix.de> <5FB7B7FD-7B5B-4250-BADE-85573FDBBE48@konsulko.com> <20141025144229.GR10262@pengutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141025144229.GR10262@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: atull@opensource.altera.com, jgunthorpe@obsidianresearch.com, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, michal.simek@xilinx.com, rdunlap@infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi Stefen,

> On Oct 25, 2014, at 17:42 , Steffen Trumtrar <s.trumtrar@pengutronix.=
de> wrote:
>=20
> Hi Pantelis!
>=20
> On Fri, Oct 24, 2014 at 12:20:53PM +0300, Pantelis Antoniou wrote:
>> Hi Stefan, Allan,
>>=20
>> Sorry, haven=E2=80=99t had a chance to review all this yet; will do =
so in the weekend.
>> Just wanted to pop in and comment on a few things.
>>=20
>>> On Oct 24, 2014, at 10:00 AM, Steffen Trumtrar <s.trumtrar@pengutro=
nix.de> wrote:
>>>=20
>>> Hi!
>>>=20
>>> On Thu, Oct 23, 2014 at 06:51:06PM -0500, atull@opensource.altera.c=
om wrote:
>>>> From: Alan Tull <atull@opensource.altera.com>
>>>=20
>>> (...)
>>>=20
>>>> diff --git a/Documentation/devicetree/bindings/fpga/altera-hps2fpg=
a-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-b=
ridge.txt
>>>> new file mode 100644
>>>> index 0000000..bc24a2e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridg=
e.txt
>>>> @@ -0,0 +1,53 @@
>>>> +Altera FPGA/HPS Bridge Driver
>>>> +
>>>> +This driver manages a bridge between a FPGA and a host processor =
system (HPS).
>>>> +User space can enable or disable the bridge by writing a "1" or a=
 "0",
>>>> +respectively, to its enable file under bridge's entry in
>>>> +/sys/class/fpga-bridge.  Typically, one disables the bridges befo=
re
>>>> +reprogramming the FPGA.  Once the FPGA is reprogrammed, the bridg=
es are
>>>> +reenabled.
>>>> +
>>>=20
>>> NAK.
>>>=20
>>> This is all linux specific and doesn't belong here.
>>>=20
>>=20
>> We know. The DT spec hasn=E2=80=99t been updated for a while, and th=
is is going to be
>> part of what we want to do with the restarting of the ePAPR spec pro=
cess.
>>=20
>=20
> As we don't have a new spec yet, I go with the current state of the a=
rt.
> And I don't see how "file under ... /sys/class/fpga-bridge" fits the
> current spec.
>=20
>> So absolutes like =E2=80=9CDT is a hardware description only" might =
be too strong statements, that
>> do not work in practice anymore.
>>=20
>> There=E2=80=99s no such thing as pure hardware devices lately - ther=
e is always a configuration
>> component; some of it OS specific, some of it not.
>>=20
>=20
> If it really is necessary, I'm not against it, don't get me wrong.
> But in the grand scheme I wouldn't say that this fits my experience.
> There are some devices that need configuration and often when it is
> done in the DT, it is just a shortcut or not thought through.
> And can be also introspected dynamically. With some discussion on the
> list these bindings often change.
>=20

Already answered and given a possible way this might work; admittedly t=
his
specific example is not a good fit for what I was trying to say, but wh=
atever.
Let=E2=80=99s get the ball rolling.

> Regarding OS specifics: already there, e.g. console setup in the chos=
en node.
> And other things I saw are ethernet aliases just for u-boot. Not a pr=
oblem
> of the spec, just a problem of u-boot and unneccessary "configuration=
".
> Just to fix a bad bootloader. barebox can handle this without any
> such stuff. Maybe we should integrate the DT "overlays" barebox uses =
into
> the in-kernel DTs as well...but does it really help/interest someone =
who
> decides to use u-boot where barebox stores its environment? I guess n=
ot.
>=20

Although I=E2=80=99m not against having DT overlays in the bootloader, =
I only see them
as a method that helps a platform developer express things easier. I am=
 completely
against having the kernel tied to any particular bootloader.

We=E2=80=99ve all been through the hell where a kernel only boots if th=
e bootloader has=20
setup the platform =E2=80=9Ccorrectly=E2=80=9D. This =E2=80=9Ccorrectly=
=E2=80=9D has a very loose definition and
99/100 times is extremely badly documented or not at all.

IMHO the bootloader should (as part of the normal boot sequence) only s=
etup the
absolutely bare minimum and then pass control to the kernel as soon as =
possible.

The full featured bootloader environment should only be presented when =
the user
requests so.

>> We have to be engaged in the process and figure out how to update th=
e spec for what is
>> now the state of the art in the industry.
>>=20
>=20
> Again, not against that if it is necessary. For example your overlay =
stuff might
> be a good update to the spec. Would be better if it is official inste=
ad of a "hack".
> I want that for SoCFPGA.
>=20
> But having looked at one or two vendor kernels+DTs, the state of the =
art in the
> industry is: using DT wrong. (And doing HW wrong, which makes some up=
dates to the
> ePAPR necessary ;-))
>=20

Vendor H/W, vendor DT and a crack pipe. Or as I call it Monday.

> Regards,
> Steffen

Regards

=E2=80=94 Pantelis

