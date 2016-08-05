From: Shubhrajyoti Datta <shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2] watchdog: xilinx: Add clock support
Date: Fri, 5 Aug 2016 09:27:09 +0530
Message-ID: <CAKfKVtGHeVz6s0YgZ6__KN-R8iT1EmkUyMmHOXj3FfwJQyP20Q@mail.gmail.com>
References: <1470198518-22286-1-git-send-email-shubhrajyoti.datta@xilinx.com> <20160804172918.GA22921@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160804172918.GA22921@rob-hp-laptop>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 4, 2016 at 10:59 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Aug 03, 2016 at 09:58:38AM +0530, Shubhrajyoti Datta wrote:
>> Add support for the clock. Currently we enable
>> at probe and relinquish at remove.
>>
>> Acked-by: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> ---
>> v2:
>> fix spaces and error path.
>>
>>  .../devicetree/bindings/watchdog/of-xilinx-wdt.txt |  3 +++
>>  drivers/watchdog/of_xilinx_wdt.c                   | 23 ++++++++++++++++++++--
>>  2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt b/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
>> index 6d63782..b0a9fa3 100644
>> --- a/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/of-xilinx-wdt.txt
>> @@ -5,6 +5,8 @@ Required properties:
>>  - compatible         : Should be "xlnx,xps-timebase-wdt-1.00.a" or
>>                         "xlnx,xps-timebase-wdt-1.01.a".
>>  - reg                        : Physical base address and size
>> +- clocks             : Input clock specifier. Refer to common clock
>> +                       bindings.
>
> You can't add new required properties. Doing so breaks compatibility
> with old DTs.
Will resend fixing the compatibility with old dts.

>
> Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
