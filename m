From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] nvmem: add driver for JZ4780 efuse
Date: Sat, 20 Jan 2018 13:41:17 +0530
Message-ID: <CANc+2y4xTo7GyPw0bP=qJ6UqG4Z9u2xYbN2-jSB+z1XQs52w8w@mail.gmail.com>
References: <20171228212954.2922-1-malat@debian.org> <20171228212954.2922-2-malat@debian.org>
 <20180103200211.u56tqesyumsofoff@rob-hp-laptop> <CANc+2y5Y9fYh5V5OG_o+-92-uLYew7yNObLGTYPhGyx2eExywA@mail.gmail.com>
 <CAL_JsqJHHPJY0Yg+kmMbjZVsq=VVC0dPgtvXoN+sxL9gjBtMLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJHHPJY0Yg+kmMbjZVsq=VVC0dPgtvXoN+sxL9gjBtMLA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Marcin Nowakowski <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Zubair.Kakakhel-8NJIiSa5LzA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 January 2018 at 20:38, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Jan 6, 2018 at 6:43 AM, PrasannaKumar Muralidharan
> <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Rob,
>>
>> On 4 January 2018 at 01:32, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, Dec 28, 2017 at 10:29:52PM +0100, Mathieu Malaterre wrote:
>>>> From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> This patch brings support for the JZ4780 efuse. Currently it only expose
>>>> a read only access to the entire 8K bits efuse memory.
>>>>
>>>> Tested-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>>>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>  .../ABI/testing/sysfs-driver-jz4780-efuse          |  16 ++
>>>>  .../bindings/nvmem/ingenic,jz4780-efuse.txt        |  17 ++
>>>
>>> Please split bindings to separate patch.
>>>
>>>>  MAINTAINERS                                        |   5 +
>>>>  arch/mips/boot/dts/ingenic/jz4780.dtsi             |  40 ++-
>>>
>>> dts files should also be separate.
>>>
>>>>  drivers/nvmem/Kconfig                              |  10 +
>>>>  drivers/nvmem/Makefile                             |   2 +
>>>>  drivers/nvmem/jz4780-efuse.c                       | 305 +++++++++++++++++++++
>>>>  7 files changed, 383 insertions(+), 12 deletions(-)
>>>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>>>>  create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.txt
>>>>  create mode 100644 drivers/nvmem/jz4780-efuse.c
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-jz4780-efuse b/Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>>>> new file mode 100644
>>>> index 000000000000..bb6f5d6ceea0
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>>>> @@ -0,0 +1,16 @@
>>>> +What:                /sys/devices/*/<our-device>/nvmem
>>>> +Date:                December 2017
>>>> +Contact:     PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> +Description: read-only access to the efuse on the Ingenic JZ4780 SoC
>>>> +             The SoC has a one time programmable 8K efuse that is
>>>> +             split into segments. The driver supports read only.
>>>> +             The segments are
>>>> +             0x000   64 bit Random Number
>>>> +             0x008  128 bit Ingenic Chip ID
>>>> +             0x018  128 bit Customer ID
>>>> +             0x028 3520 bit Reserved
>>>> +             0x1E0    8 bit Protect Segment
>>>> +             0x1E1 2296 bit HDMI Key
>>>> +             0x300 2048 bit Security boot key
>>>
>>> Why do these need to be exposed to userspace?
>>>
>>> sysfs is 1 value per file and this is lots of different things.
>>>
>>> We already have ways to feed random data (entropy) to the system. And we
>>> have a way to expose SoC ID info to userspace (socdev).
>>
>> Currently ingenic chip id is not used anywhere. The vendor BSP exposed
>> only chip id and customer id. Should we do the same? Please provide
>> your suggestion.
>
> No. Don't create an ABI if you don't really need it.

Rob,
MAC address of the ethernet device is stored in customer id segment of
efuse. So only customer id is needed. Do you think exposing customer
id would suffice?

Srini,
Only user would be dm900 ethernet driver (need to make changes to it
once the efuse driver goes in). There is no need to expose it to user
space. I am planning to modify nvmem core to not expose efuse if the
efuse driver chooses so. Do you think it makes sense? The need to
maintain ABI for user space disappears if such a change is introduced.

Thanks,
PrasannaKumar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
