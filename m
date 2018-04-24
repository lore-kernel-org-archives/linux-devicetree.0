From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 0/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Tue, 24 Apr 2018 10:36:01 +0900
Message-ID: <CAK7LNAQZEkarVA-JKgivjJsV8yhGsXpJUEeoJB=UhXfj5y-Knw@mail.gmail.com>
References: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com> <31be9c49-7562-1c06-7bf9-bafaea2f1c16@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <31be9c49-7562-1c06-7bf9-bafaea2f1c16@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, DTML <devicetree@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

2018-04-24 9:11 GMT+09:00 Manu Gautam <mgautam@codeaurora.org>:
> HI,
>
>
> On 4/19/2018 4:03 AM, Masahiro Yamada wrote:
>> In the current design of DWC3 driver,
>> the DT typically becomes a nested structure like follows:
>>
>>   dwc3-glue {
>>           compatible = "foo,dwc3";
>>           ...
>>
>>           dwc3 {
>>                   compatible = "snps,dwc3";
>>                   ...
>>           };
>>   }
>>
>> The current DWC3 core (drivers/usb/dwc3/core.c) can not handle
>> clocks / resets at all.
>>
>> The only solution we have now, is to put DWC3 core node under
>> the glue layer node, then add clocks and resets there.
>> Actually, dwc3-of-simple.c exists to handle clocks and resets.
>>
>> As always for digital circuits, DWC3 core IP itself needs clock input.
>> This is specific to this IP.  So, supporting clocks and resets in
>> dwc3/core.c makes sense.
>
> Why can't dwc3-of-simple be used with this IP?
> Adding core/reset handling in both core and glue drivers might
> only add to confusion and I cant think of a reason why having a parent
> node representing dwc3-of-simple glue would be any concern.
> Or are you planning to remove dwc3-of-simple.c driver?


dwc3-of-simple.c can be removed only after at least
all upstream DT files are migrated.
(and give enough time for migration of downstream DT)

At least, new platforms are not required to use this hack.




-- 
Best Regards
Masahiro Yamada
