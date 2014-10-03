From: Masami Hiramatsu <masami.hiramatsu.pt-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 1/3] arm: socfpga: Enable ECC of L2 and OCRAM on
 startup.
Date: Fri, 03 Oct 2014 18:51:56 +0900
Message-ID: <542E71BC.3050606@hitachi.com>
References: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com> <1412181092-27162-2-git-send-email-tthayer@opensource.altera.com> <542C3654.1070604@gmail.com> <542C6CFB.4090809@opensource.altera.com> <542C6DBB.9060202@opensource.altera.com> <542C7DD0.5030601@opensource.altera.com> <542D3918.3040909@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542D3918.3040909-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dinh,

(2014/10/02 20:38), Dinh Nguyen wrote:
> On 10/1/14, 5:18 PM, Thor Thayer wrote:
>>
>> On 10/01/2014 04:10 PM, Dinh Nguyen wrote:
>>>
>>> On 10/1/14, 4:07 PM, Thor Thayer wrote:
>>>> On 10/01/2014 12:13 PM, Dinh Nguyen wrote:
>>>>> On 10/1/14, 11:31 AM, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>>>>>> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>>>>>
>>> [...]
>>>>>>      static void socfpga_cyclone5_restart(enum reboot_mode mode, const
>>>>>> char *cmd)
>>>>>> @@ -98,6 +101,13 @@ static void socfpga_cyclone5_restart(enum
>>>>>> reboot_mode mode, const char *cmd)
>>>>>>        writel(temp, rst_manager_base_addr + SOCFPGA_RSTMGR_CTRL);
>>>>>>    }
>>>>>>    +static void __init socfpga_cyclone5_init(void)
>>>>>> +{
>>>>>> +    of_platform_populate(NULL, of_default_bus_match_table,
>>>>>> +                 NULL, NULL);
>>>>> Why is this needed?
>>>>>
>>>>> Dinh
>>>> Hi Dinh.
>>>>
>>>> Are you asking why the of_platform_populate() is needed? If so, it is
>>>> used to kick off discovery of devices at the root of the tree.
>>> I was asking about of_platform populate(). This was removed in this
>>> commit:
>>>
>>> 8b5c18f05 ARM: l2c: socfpga: convert to generic l2c OF initialisation
>>>
>>> Just trying to understand what's the need to add it back?
>>>
>>> Dinh
>> It is used to kick off discovery of devices at the root of the tree. 
>> This is needed when .init_machine was defined because we're not using
>> the default implementation (which called this function).
>>
> 
> Then, can you please add a separate patch to fix up the removal of the call?

It seems that this patch does enough reasonable thing.

To initialize ECC on OCRAM, socfpga_init_ocram_ecc() must be invoked
while booting. In that case, he might need this function.

8b5c18f05 is to replace l2x0_of_init() with .l2c_aux_* fields, and
this patch has a different reason to call another init function in
.init_machine. In this case, it is natural to define .init_machine
handler in this patch.

IOW, both use same socfpga_cyclone5_init() for the function name,
but those have different purpose. I think it is not reviving the
old function, but just adding a new function which has same name.

Thank you,

-- 
Masami HIRAMATSU
Software Platform Research Dept. Linux Technology Research Center
Hitachi, Ltd., Yokohama Research Laboratory
E-mail: masami.hiramatsu.pt-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
