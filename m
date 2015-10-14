From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] gpio/xilinx: enable for MIPS
Date: Wed, 14 Oct 2015 11:22:16 -0700
Message-ID: <CAAtXAHcfFcoh4=UFn9R4UJdUyPiJ9mMqpBg09jkfiOUynH58yw@mail.gmail.com>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1444827117-10939-3-git-send-email-Zubair.Kakakhel@imgtec.com>
	<20151014151813.GL15287@xsjsorenbubuntu>
	<561E7B65.3090704@metafoo.de>
	<20151014165450.GS15287@xsjsorenbubuntu>
	<561E8FDF.9070500@metafoo.de>
	<20151014173350.GV15287@xsjsorenbubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151014173350.GV15287@xsjsorenbubuntu>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 10:33 AM, S=C3=B6ren Brinkmann
<soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> On Wed, 2015-10-14 at 07:24PM +0200, Lars-Peter Clausen wrote:
>> On 10/14/2015 06:54 PM, S=C3=B6ren Brinkmann wrote:
>> > On Wed, 2015-10-14 at 05:57PM +0200, Lars-Peter Clausen wrote:
>> >> On 10/14/2015 05:18 PM, S=C3=B6ren Brinkmann wrote:
>> >>> On Wed, 2015-10-14 at 01:51PM +0100, Zubair Lutfullah Kakakhel w=
rote:
>> >>>> MIPSfpga uses the axi gpio controller. Enable the driver for MI=
PS.
>> >>>>
>> >>>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgte=
c.com>
>> >>>> ---
>> >>>>  drivers/gpio/Kconfig | 2 +-
>> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>>>
>> >>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> >>>> index 8949b3f..58e9afd 100644
>> >>>> --- a/drivers/gpio/Kconfig
>> >>>> +++ b/drivers/gpio/Kconfig
>> >>>> @@ -508,7 +508,7 @@ config GPIO_XGENE_SB
>> >>>>
>> >>>>  config GPIO_XILINX
>> >>>>          tristate "Xilinx GPIO support"
>> >>>> -        depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ =
|| X86)
>> >>>> +        depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ =
|| X86 || MIPS)
>> >>>
>> >>> Hmm, in general, this driver is hopefully generic enough that it=
 doesn't
>> >>> have any real architecture dependencies. And I suspect, we want =
to
>> >>> enable this driver for ARM64 for ZynqMP soon too. Should we prob=
ably
>> >>> drop these arch dependencies completely? It seems to become quit=
e a long list.
>> >>
>> >> I've been thinking about this a while ago. This is certainly not =
the only
>> >> driver affected by this problem. But the thing is people always c=
omplain if
>> >> new symbols become visable in Kconfig that don't apply to their p=
latform.
>> >>
>> >> Maybe we should introduce a HAS_REPROGRAMABLE_LOGIC (or similar) =
feature
>> >> Kconfig symbol and let platforms which have a FPGA select it and =
let drivers
>> >> for FPGA peripherals depend on it.
>> >
>> > Sounds like a good idea to me. But, does that work for all use-cas=
es.
>> > E.g. if you plug some PCIe card with an FPGA into an x86(_64) mach=
ine.
>> > That would allow you to use those drivers, but I'm not sure how th=
at
>> > could pull in the new config symbol.
>>
>> Hm, right. We could also make it a user-selectable config symbol. In=
 that
>> case you only need to disable one symbol when you don't have FPGA su=
pport
>> rather than one for each driver. Although I'm not quite sure where t=
o put
>> such a symbol.
>
> Eventually, the FPGA manager subsystem could probably provide some hi=
gh
> level config symbols. Though, it is probably also not given that ever=
y
> FPGA-enabled platform needs the FPGA manager.

I agree. I suspect most platforms will not actually runtime reload the
=46PGA using
=46PGA manager they probably use onboard flash or something similar.

>
>         S=C3=B6ren
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
