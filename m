From: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv5] watchdog: dw: Enable OF support for DW watchdog timer
Date: Tue, 22 Oct 2013 10:37:20 -0500
Message-ID: <52669BB0.3060601@gmail.com>
References: <1382452727-20685-1-git-send-email-dinguyen@altera.com> <20131022150201.GB4691@kartoffel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131022150201.GB4691@kartoffel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 10/22/13 10:02 AM, Mark Rutland wrote:
> On Tue, Oct 22, 2013 at 03:38:47PM +0100, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>> From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>
>> Add device tree support to the DW watchdog timer.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>> Acked-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>> Reviewed-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
>> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> Cc: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
>> Cc: Viresh Kumar <viresh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
>> Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>> v5:
>> - Add documentation for clocks property
>> v4:
>> - Add interrupts as an optional property, use "should contain".
>> v3:
>> - Clean up documentation
>> v2:
>> - Use of_match_ptr() for of_match_table
>> ---
>>   .../devicetree/bindings/watchdog/dw_wdt.txt        |   20 ++++++++++++++++++++
>>   drivers/watchdog/dw_wdt.c                          |    8 ++++++++
>>   2 files changed, 28 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>> new file mode 100644
>> index 0000000..3af5c13
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
>> @@ -0,0 +1,20 @@
>> +Synopsys Designware Watchdog Timer
>> +
>> +Required Properties:
>> +
>> +- compatible	: Should contain "snps,dw-wdt"
>> +- reg		: Base address and size of the watchdog timer register.
> s/register/registers/ ?
>
>> +- clocks	: phandle to the clock that drives the watchdog timer.
> Nit: clocks aren't necessarily described by just a phandle.
>
> How about:
>
> - clocks: phandle + clock-specifier for the clock that drives the watchdog
>            timer.
>
> Otherwise, given previous comments this looks fine to me.
>
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Fixed with above and added your Ack. So now the question is can take 
this through the
arm-soc tree or through Wim Van Sebroeck's drivers/watchdog tree?

Thanks,
Dinh
>
> Thanks,
> Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
