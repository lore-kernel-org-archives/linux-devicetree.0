From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 1/5] Documentation: add sbsa-gwdt driver documentation
Date: Wed, 28 Oct 2015 12:10:14 +0800
Message-ID: <CADyBb7sAcT4bXrkNo2GKx1Tw5wOuf8JeMgCoiAw=owHqvYx6ug@mail.gmail.com>
References: <1445961999-9506-1-git-send-email-fu.wei@linaro.org>
	<1445961999-9506-2-git-send-email-fu.wei@linaro.org>
	<20151027162257.GJ3091@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151027162257.GJ3091@leverpostej>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Fu <tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Vipul Gandhi <vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leo Duran <leo.duran-5C7GfCeVMHo@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rafael Wysocki <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark

Thanks for your rapid feedback, I appreciate your help very much.


On 28 October 2015 at 00:22, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Wed, Oct 28, 2015 at 12:06:35AM +0800, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> The sbsa-gwdt.txt documentation in devicetree/bindings/watchdog is for
>> introducing SBSA(Server Base System Architecture) Generic Watchdog
>> device node info into FDT.
>>
>> Also add sbsa-gwdt introduction in watchdog-parameters.txt
>>
>> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/watchdog/sbsa-gwdt.txt     | 46 ++++++++++++++++++++++
>>  Documentation/watchdog/watchdog-parameters.txt     |  6 +++
>>  2 files changed, 52 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
>> new file mode 100644
>> index 0000000..ad8e99a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/sbsa-gwdt.txt
>> @@ -0,0 +1,46 @@
>> +* SBSA (Server Base System Architecture) Generic Watchdog
>> +
>> +The SBSA Generic Watchdog Timer is used to force a reset of the system
>> +after two stages of timeout have elapsed.  A detailed definition of the
>> +watchdog timer can be found in the ARM document: ARM-DEN-0029 - Server
>> +Base System Architecture (SBSA)
>> +
>> +Required properties:
>> +- compatible: Should at least contain "arm,sbsa-gwdt".
>> +
>> +- reg: Each entry specifies the base physical 64-bit address of a register
>> +  frame and the 64-bit length of that frame; currently, two frames must be
>
> Remove "64-bit" here. This depends on #address-cells and #size-cells, as
> usual.

Ah, right, Thanks , will do

>
>> +  defined, in this order:
>> +  1: Watchdog control frame
>> +  2: Refresh frame.
>> +
>> +- interrupts: At least one interrupt must be defined that will be used as
>> +  the WS0 interrupt.  A WS1 interrupt definition can be provided, but is
>> +  optional.  The interrupts must be defined in this order:
>> +  1: WS0 interrupt
>> +  2: WS1 interrupt
>
> Why is WS1 optional?

According to the description of WS1 in SBSA 2.3 (5.2 Watchdog Operation) page 21
-----------------
The signal is fed to a higher agent as an interrupt or reset for it to
take executive action.
----------------

So WS1 maybe a interrupt.

In a real Hardware,  WS1 hooks to a  reset signal pin of BMC, if this
pin is triggered, BMC will do a real warm reset.
In this case, WS1 is a reset, Linux doesn't need to deal with that.

For now , I haven't found a hardware use WS1 as  interrupt.
In <ARM v8-A Foundation Platform User Guide> 3.2 Interrupt maps  Page 22
Table 3-3 Shared peripheral interrupt assignments
IRQ ID       SPI offset      Device
60               28              EL2 Generic Watchdog WS1

But I don't have further info about it.

Anyway,  because this signal could be interrupt or reset, Linux don't
need know this signal sometimes.
So I think it should be optional in binding info.

Do I miss something? Any suggestion ? Please correct me, thanks.

>
>> +Optional properties
>> +- timeout-sec: To use a timeout value that is different from the driver
>> +  default values, use this property.
>
> Either define a default value, or don't state anything about the
> behaviour when this is not present.

OK, thanks :-)

>
>>    If used, at least one timeout value
>> +  (in seconds) must be provided.  A second optional timeout value (in
>> +  seconds) may also be provided and will be used as the pre-timeout value,
>> +  if it is given.
>> +
>> +  There are two possible sources for driver default timeout values:
>> +  (1) the driver contains hard-coded default values, or
>> +  (2) module parameters can be given when the module is loaded
>> +
>> +  If timeout/pretimeout values are provided when the module loads, they
>> +  will take priority.  Second priority will be the timeout-sec from DTB,
>> +  and third the hard-coded driver values.
>
> The last two paragraphs should go. They describe Linux behaviour rather
> than the binding.

yes, maybe that should be in the watchdog documentation?

>
> Thanks,
> Mark.



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
