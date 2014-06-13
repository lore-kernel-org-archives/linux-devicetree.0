From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: CPU revision IDs
Date: Fri, 13 Jun 2014 08:29:41 -0400
Message-ID: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

How are CPU revision IDs encoded into the device tree? It is not
reasonable to ask people to manually identify their revision and then
use the right device tree. For example a heat sink may obscure the
markings. The CPU ID is needed for device driver quirks.

I was thinking of doing something like adding code at early boot that
fixes up the root compatible string. The revision is a
property of the CPU.

Code changes this:
 compatible =3D "cubietech,cubietruck", "allwinner,sun7i-a20"
to:
 compatible =3D "cubietech,cubietruck",  "allwinner,sun7i-a20a",
"allwinner,sun7i-a20"

Alternatively this could be done in uboot.

Browsing around the kernel code there seems to be multiple solutions
to this problem.  For example this Marvell code modifies the device
driver compatible string.

http://lxr.free-electrons.com/source/arch/arm/mach-mvebu/board-v7.c#L71

On Fri, Jun 13, 2014 at 8:09 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> On Fri, Jun 13, 2014 at 6:15 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> On Fri, Jun 13, 2014 at 11:54:06AM +0200, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 06/13/2014 10:40 AM, Maxime Ripard wrote:
>>> > On Fri, Jun 13, 2014 at 09:32:20AM +0200, Hans de Goede wrote:
>>> >> Hi,
>>> >>
>>> >> On 06/13/2014 12:48 AM, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>> >>> On Thu, Jun 12, 2014 at 6:35 PM, Emilio L=C3=B3pez <emilio@elop=
ez.com.ar> wrote:
>>> >>>> El 12/06/14 19:11, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org escribi=C3=B3:
>>> >>>>
>>> >>>>> What has replaced sw_get_ic_ver() on 3.15?
>>> >>>>>
>>> >>>>> Codec code varies on every chip revision A,B,C and A10/20.
>>> >>>>
>>> >>>>
>>> >>>> A10/A20 can be determined by the compatible string. Chip revis=
ion is going
>>> >>>> to be trickier though, there is no direct replacement of sw_ge=
t_ic_ver()
>>> >>>> that I'm aware of. sw_get_ic_ver() seems to poke a timer regis=
ter in the
>>> >>>> sun4i case, and SID (for which we do have a driver[1]) on the =
sun5i case.
>>> >>>>
>>> >>>> [1] drivers/misc/eeprom/sunxi_sid.c
>>> >>>
>>> >>> We may have to reimplement it. Codec driver has stuff like this=
 in it.
>>> >>
>>> >> I think adding some sort of SoC version detection makes sense, s=
o go for it.
>>> >
>>> > It might, and we probably will come to it eventually, but I don't=
 get
>>> > what it would bring here.
>>> >
>>> > Have different compatible strings for the various revisions of th=
e IP
>>> > is much simpler and adds no code at all.
>>>
>>> That assumes that for a single board only a single revision of the =
SoC has
>>> ever been used. I would not be so sure that that is the case, I'm p=
retty
>>> sure that there were various rruns of the original mk802 A10 versio=
n,
>>> likely with the first runs having A10 Revision A and later runs
>>> revision B. I really don't want to have to do different dts files j=
ust
>>> to deal with this, that is not helpful from a maintenance pov, and =
it
>>> will also only serve to confuse our end users as they will have no =
idea
>>> which revision of the SoC they have, so solving the differences bet=
ween
>>> the A10 revision A vs B/C with a compatible string seems counter pr=
oductive.
>>
>> There's usually two patterns to deal with this:
>>   - Either have two different DT, depending on the revision of the
>>     board
>>
>>   - If the board rev hasn't changed, have the machine code come and
>>     update the DT with the appropriate compatible (see
>>     http://lxr.free-electrons.com/source/arch/arm/mach-mvebu/board-v=
7.c#L71)
>
> This code fixes up the I2C compatible string based on SOC ID. That
> doesn't seem right to me. Instead I would have put some code in early
> boot that fixes up the root compatible string. The revision is a
> property of the CPU.
>
> Change this:
> compatible =3D "cubietech,cubietruck", "allwinner,sun7i-a20"
> to:
> compatible =3D "cubietech,cubietruck",  "allwinner,sun7i-a20a",
> "allwinner,sun7i-a20"
>
> Uboot can fix up device trees. Power PC uses it to add memory size an=
d
> CPU clock speed.  Maybe uboot should fix the compatible string?
>
>
>>
>> The latter is much better, for the reasons you mentionned, but in an=
y
>> case, the driver itself shouldn't have to worry about that kind of
>> things, and only deal with compatibles.
>>
>> Max
>>
>> --
>> Maxime Ripard, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>
>
>
> --
> Jon Smirl
> jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--=20
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
