From: Arun Ramamurthy <arun.ramamurthy@broadcom.com>
Subject: Re: [PATCH] video: ARM CLCD: Added support for FBIO_WAITFORVSYNC
Date: Mon, 2 Mar 2015 11:09:42 -0800
Message-ID: <54F4B576.5030702@broadcom.com>
References: <1424898082-1522-1-git-send-email-arun.ramamurthy@broadcom.com>	 <1424898082-1522-3-git-send-email-arun.ramamurthy@broadcom.com> <1425312029.3092.1.camel@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425312029.3092.1.camel@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 15-03-02 08:00 AM, Pawel Moll wrote:
> On Wed, 2015-02-25 at 21:01 +0000, Arun Ramamurthy wrote:
>> Added ioctl and interrupt handler functions to support FBIO_WAITFORVSYNC
>> Also corrected documentation to make interrupts and interrupt-names
>> optional as they are not required properties.
>
> You may not be aware of this fact, but its the "documentation" what
> defines what properties are required...
>
Pawel, I was not aware of that. Since the driver code did not require 
the interrupts or interrupt-names bindings to load properly, I moved it 
out of the required properties. I can remove that change.

Any other comments on this change? Thanks
>> Reviewed-by: Ray Jui <rjui@broadcom.com>
>> Reviewed-by: Scott Branden <sbranden@broadcom.com>
>> Signed-off-by: Arun Ramamurthy <arun.ramamurthy@broadcom.com>0
>> ---
>>   .../devicetree/bindings/video/arm,pl11x.txt        | 11 +--
>>   drivers/video/fbdev/amba-clcd.c                    | 82 ++++++++++++++++++++++
>>   include/linux/amba/clcd.h                          |  4 ++
>>   3 files changed, 89 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/arm,pl11x.txt b/Documentation/devicetree/bindings/video/arm,pl11x.txt
>> index 2262cdb..7d19024 100644
>> --- a/Documentation/devicetree/bindings/video/arm,pl11x.txt
>> +++ b/Documentation/devicetree/bindings/video/arm,pl11x.txt
>> @@ -10,14 +10,6 @@ Required properties:
>>
>>   - reg: base address and size of the control registers block
>>
>> -- interrupt-names: either the single entry "combined" representing a
>> -	combined interrupt output (CLCDINTR), or the four entries
>> -	"mbe", "vcomp", "lnbu", "fuf" representing the individual
>> -	CLCDMBEINTR, CLCDVCOMPINTR, CLCDLNBUINTR, CLCDFUFINTR interrupts
>> -
>> -- interrupts: contains an interrupt specifier for each entry in
>> -	interrupt-names
>> -
>>   - clock-names: should contain "clcdclk" and "apb_pclk"
>>
>>   - clocks: contains phandle and clock specifier pairs for the entries
>
> So no, you can't do that.

>
> Pawel
>
