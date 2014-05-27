From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Mon, 26 May 2014 17:54:24 -0700
Message-ID: <5383E240.9040807@roeck-us.net>
References: <CAMuHMdWw39n8O0fFWECR6v6GaEJ3aB5S3ront4eDdXwxNO6Fgw@mail.gmail.com> <20140520055026.E3A98C412DA@trevor.secretlab.ca> <CAMuHMdXjWENrq0MW-DU2x7WnaCsWyipN4DO=y0ZTL+3G_fPYGg@mail.gmail.com> <20140526104824.63F13C42129@trevor.secretlab.ca> <CAMuHMdUGdjVKBR5rRzZ274rf7p8XfztNRWEojH1RrZV8c_V1uA@mail.gmail.com> <20140526112348.907B7C421A5@trevor.secretlab.ca> <A6195DFD-0447-4444-AC09-501C43F09924@konsulko.com> <20140526213303.C1C73C40E11@trevor.secretlab.ca> <20140526223630.GA32691@earth.universe> <5383D174.8070304@roeck-us.net> <20140527003219.GD32691@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140527003219.GD32691-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete
List-Id: devicetree@vger.kernel.org

On 05/26/2014 05:32 PM, Sebastian Reichel wrote:
> On Mon, May 26, 2014 at 04:42:44PM -0700, Guenter Roeck wrote:
>> On 05/26/2014 03:36 PM, Sebastian Reichel wrote:
>>> On Mon, May 26, 2014 at 10:33:03PM +0100, Grant Likely wrote:
>>>> After thinking about it more, I think it is very likely that removing
>>>> all the overlays is the correct thing to do in the kexec use-case. When
>>>> kexec-ing, it makes sense that we'd want the exact same behaviour from
>>>> the kexec'ed kernel. That means we want the device drivers to do the
>>>> same thing including loading whatever overlays they depend on.
>>>>
>>>> If the flattened tree was left applied, then the behaviour becomes
>>>> different.
>>>>
>>>> I say always remove the overlays unless explicitly told not to, but I'm
>>>> struggling to come up with use cases where keeping them applied is
>>>> desirable.
>>>
>>> I would assume, that I want them applied in most cases. DT describes
>>> the hardware. If I kexec into a new kernel I change software, not
>>> hardware.
>>>
>>> Maybe I'm missing the main purpose of the feature. I currently see
>>> two useful usecases for DT overlays:
>>>
>>> 1. The dtb the kernel is booted with cannot be changed for some
>>>     reason, but the board has additional hardware attached (e.g.
>>>     the user added a sensor on the i2c bus)
>>> 2. The hardware is changed on the fly (e.g. the user flashed the
>>>     FPGA part of a zynq processor), sensors on i2c bus, ...
>>>
>>> In both cases the kernel should be booted with the additional
>>> overlay information IMHO. Though for the second case it should
>>> be possible to remove the "programmed" hardware information
>>> somehow.
>>>
>>
>> 3. Some hot-plug device or card is inserted or removed.
>
> Can you give a more specific example? I guess most hot-plug
> devices are connected to busses, which are not described via
> DT, but support auto-identification (USB, PCI, ...)
>
The card interface provides i2c and pcie busses, plus a number of
gpio pins. Both I2C devices and PCIe devices depend on the inserted
card type. There may be PCIe switches on some cards, or just PCIe
devices on others. Auto-identification of PCIe devices does not help,
as the device configuration depends on the card type inserted.
A typical example is that the card may include a multi-function
FPGA device with LED, GPIO, and I2C bus master functionality,
and the specific configuration depends on the card type (even though
the FPGA is the same). Other cards may include a PCIe switch with
a number of ASICs connected to it. PCIe switch configuration
depends on the card type, not on the PCIe switch type.

>> I would argue that the kernel should _not_ be booted with the
>> overlay in place.
>
> well the device is still attached to the system when you kexec
> into the new kernel, isn't it?
>
So ? the code executed is ultimately the same, if the kernel is booted
from rommon or from kexec. In one case we'll have to insert the overlay,
in the other case not.

>> Otherwise the code handling overlays would have to have special
>> handling for the restart case, which is much more complex than
>> just to re-insert the overlay when it is determined that the
>> device or card is still there.
>
> I assume, that the kernel cannot auto-detect the attached hardware.

Correct.

> Otherwise we don't need the DT entries, but can simply scan the bus.
> So the restart case (or restart + kexec case if kexec behaves like a
> restart) means, that userspace needs to provide the information
> about device existence.
>
Exactly the same informatin we get if the kernel is booted from ROMMON
or BIOS. No difference here.

> Removing the overlay is like dropping information supplied from the
> user. Not something, which should be done carelessly.
>

In our case it is done when the card is removed.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
