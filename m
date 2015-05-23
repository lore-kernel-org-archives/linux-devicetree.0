From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Linaro-acpi] [PATCH v2 6/7] Watchdog: introduce ARM SBSA
 watchdog driver
Date: Sat, 23 May 2015 15:25:50 +0800
Message-ID: <CADyBb7sJUY0oUb-6oqSBNnj=xjcn7JYztQ=BRspCf0t1s7+fUw@mail.gmail.com>
References: <=fu.wei@linaro.org>
	<20150522150145.GA2930@roeck-us.net>
	<555F48BD.4010605@linaro.org>
	<10437443.BChumWu5Uk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10437443.BChumWu5Uk@wuerfel>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd

Thanks :-)

On 22 May 2015 at 23:24, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 22 May 2015 23:18:21 Hanjun Guo wrote:
>> On 2015=E5=B9=B405=E6=9C=8822=E6=97=A5 23:01, Guenter Roeck wrote:
>> > On Fri, May 22, 2015 at 04:55:04PM +0200, Arnd Bergmann wrote:
>> >> On Friday 22 May 2015 22:50:30 Hanjun Guo wrote:
>> >>>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfi=
g
>> >>>> index e5e7c55..25a0df1 100644
>> >>>> --- a/drivers/watchdog/Kconfig
>> >>>> +++ b/drivers/watchdog/Kconfig
>> >>>> @@ -152,6 +152,18 @@ config ARM_SP805_WATCHDOG
>> >>>>          ARM Primecell SP805 Watchdog timer. This will reboot y=
our system when
>> >>>>          the timeout is reached.
>> >>>>
>> >>>> +config ARM_SBSA_WATCHDOG
>> >>>> +     tristate "ARM SBSA Generic Watchdog"
>> >>>> +     depends on ARM || ARM64 || COMPILE_TEST
>> >>>
>> >>> SBSA is for ARMv8-A based (64-bit) servers, no need to depends o=
n ARM,
>> >>> and why we depends on COMPILE_TEST?
>> >>>
>> >>
>> >> I think it's a reasonable assumption that someone will sooner or =
later
>> >> put that hardware into an ARM32 machine, or run a 32-bit kernel o=
n
>> >> a chip that has it.
>> >>
>> >> While SBSA requires this watchdog device, nothing prevents SoC
>> >> manufacturers from using the same design in something that is not
>> >> a server.
>>
>>  From this point of view, I agree that SBSA watchdog design may used
>> in other ARM SoCs in the future, but how about add it back when this
>> kind of hardware showing up?
>
> If it builds on ARM32, I'd rather leave the option in, it doesn't hur=
t.

yes, I am agree with you.
Reason:
(1)Although the SBSA spec is all about ARMv8, but in "5 APPENDIX A:
GENERIC WATCHDOG", nothing says SBSA watchdog is only for ARM64.
(2)SBSA watchdog should work with arch_timer which  has be used on
ARMv7 and ARMv8.
(3)there are ARM32 servers in the market(although there is not SBSA
watchdog in them)
(4) all the regs of SBSA watchdog are 32Bit, this IP core can be use
in ARM32(I don't know the implementation detail of this IP core, but
from the spec , I don't see "It can't be used on ARM32")
(5)we don't need to change any code, any line.(yes, it doesn't hurt)

So maybe we can keep this

The only problem we face is : there is not a ARM32 hardware or a
simulator of ARM32 has SBSA watchdog on it. and we don't know if ARM
will put this IP core in any Soc in the future :-(
Maybe because this IP core is new.

>
>> > Tricky, though. Since teh driver uses arm specific clock functions=
,
>> > I don't think this can compile on a non-arm machine.
>>
>> Since it depends on ARM64/ARM, we can temporary release from that no=
w
>
> We have to drop the '|| COMPILE_TEST' though as a result, or fix the
> driver to look up the clock in DT and call 'clk_get_rate'.
>
> That will break the ACPI case, but ACPI could use platform_data to
> pass the clock rate into the driver, to make it independent of
> low-level APIs.

for this problem , we not only need to get "rate" but also need to get
timestamp.
So for now , we need to use some ARM specific code in arm_arch_timer.c,
unless those interface is integrated into clk framework(or we have
make a patch for if)

any suggestion or thought?

Great thanks for your review :-)


>
>         Arnd
> _______________________________________________
> Linaro-acpi mailing list
> Linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> https://lists.linaro.org/mailman/listinfo/linaro-acpi



--=20
Best regards,

=46u Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdo=
g" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
