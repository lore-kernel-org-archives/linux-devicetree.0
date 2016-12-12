From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] Documentation: ti-syscon-reset: fix header path
Date: Mon, 12 Dec 2016 20:52:26 +0100
Message-ID: <CAGm1_kt6OPb9kdG0s3vRwb0g-=7B=Z6CJgVERZuceNhXMwWZvA@mail.gmail.com>
References: <1481278287-23842-1-git-send-email-yegorslists@googlemail.com> <20161212184021.hewybkfaygrle63a@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161212184021.hewybkfaygrle63a@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 12, 2016 at 7:40 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Dec 09, 2016 at 11:11:27AM +0100, yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org wrote:
>> From: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>
>> 'include' was missing from path.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>> index 164c7f3..5b20e20 100644
>> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>> @@ -44,7 +44,7 @@ Required properties:
>>                                     reset status register
>>                           Cell #7 : Flags used to control reset behavior,
>>                                     availible flags defined in the DT include
>> -                                   file <dt-bindings/reset/ti-syscon.h>
>> +                                   file <include/dt-bindings/reset/ti-syscon.h>
>
> There's pretty much equal mixture of include or not. Not really much
> point in fixing 1 instance if there's no clear correct way. Given it is
> written with <...>, that matches how you write the include statement.

OK I see the point of omitting include now. I was looking at this from
VIM point of view. I cannot automatically jump to the file via 'gf'.

Yegor
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
