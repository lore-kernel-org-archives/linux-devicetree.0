From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCHv2] watchdog: dw: Enable OF support for DW watchdog
 timer.
Date: Tue, 22 Oct 2013 05:57:34 -0500
Message-ID: <52665A1E.5020700@gmail.com>
References: <1380739472-26172-1-git-send-email-dinguyen@altera.com> <20131021110532.GA8144@kartoffel> <5265C9B0.2060003@roeck-us.net> <20131022103936.GA5511@kartoffel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131022103936.GA5511@kartoffel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 10/22/13 5:39 AM, Mark Rutland wrote:
> On Tue, Oct 22, 2013 at 01:41:20AM +0100, Guenter Roeck wrote:
>> On 10/21/2013 04:05 AM, Mark Rutland wrote:
>>> On Wed, Oct 02, 2013 at 07:44:32PM +0100, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>>>> From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> Add device tree support to the DW watchdog timer.
>>>>
>>>> Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>>> Acked-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>>>> Reviewed-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
>>>> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>>>> Cc: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>>>> Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
>>>> Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
>>>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>>> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>>> Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> ---
>>>> v2:
>>>> - Use of_match_ptr() for of_match_table
>>>> ---
>>>>    .../devicetree/bindings/watchdog/dw_wdt.txt        |   16 ++++++++++++++++
>>>>    drivers/watchdog/dw_wdt.c                          |    8 ++++++++
>>>>    2 files changed, 24 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>>>> new file mode 100644
>>>> index 0000000..29e150b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>>>> @@ -0,0 +1,16 @@
>>>> +Synopsys Designware Watchdog Timer
>>>> +
>>>> +Required Properties:
>>>> +
>>>> +- Compatiblity	: "snps,dw-wdt"
>>> This should presumably be:
>>>
>>> - compatbile: should contain "snps,dw-wdt"
>>>
>> Hi Mark,
>>
>> s/compatbile/compatible/ :-)
> Indeed :)
Changed for v3.
>
>> "must be" or "should contain" ? I see both in various bindings.
>> Is there a preference ?
> I would prefer "should contain" -- it doesn't preclude future compatible
> variants.
Oops..v3 has "should be"...will change to "should contain" in v4.
>
>>>> +- reg		: Base address of the watchdog timer register.
>>> And the size...
>>>
>>>> +
>>>> +Example:
>>>> +
>>>> +	watchdog0: wd@ffd02000 {
>>>> +		compatible = "snps,dw-wdt";
>>>> +		reg = <0xffd02000 0x1000>;
>>>> +		interrupts = <0 171 4>;
>>> This wasn't mentioned.
>>>
>>> Is it necessary?
>>>
>>   From looking into the code ...
>>
>> The driver doesn't use interrupts, so I guess the answer is no. Cut-and-paste error, maybe ?
> Does the device have any interrupts, even if they're unused?
Yes, the device does have an interrupt. Should I add it as an optional 
property?
>
>>> Is it the only interrupt?
>>>
>>>> +		clocks = <&per_base_clk>;
>>> Similarly, is this the only clock?
>>>
>> The driver uses one clock, and it is mandatory.
> Is this the only clock into the unit?
>
> Does it have a name?
Yes, this is is the only clock into the unit. No, it does not have name.

Thanks,
Dinh
>
> Thanks,
> Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
