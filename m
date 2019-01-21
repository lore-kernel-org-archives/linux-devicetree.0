Return-Path: <SRS0=ZZ7n=P5=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Document r8a77470
 support
References: <1540544153-48098-1-git-send-email-biju.das@bp.renesas.com>
 <20181030135956.sofloch72mgsqi2o@verge.net.au>
 <OSBPR01MB2103273E3B91A5AAD68A08D4B89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4b384324-a570-58f0-e985-63aa31e84bf8@roeck-us.net>
Date: Mon, 21 Jan 2019 09:20:05 -0800
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB2103273E3B91A5AAD68A08D4B89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 1/21/19 8:33 AM, Biju Das wrote:
> Hi All,
> 
> Gentle reminder.
> 
> Are you happy with the below patch? Or do you want me to resend  patch with the tags?
> 

No need to resend; somehow it is missing from my local patchwork instance for watchdog-next
and got lost. I applied it to my watchdog-next branch with all tags. Wim will pick it up
from there.

Thanks,
Guenter

> https://patchwork.kernel.org/patch/10657119/
> 
> regards,
> Biju
> 
>> -----Original Message-----
>> From: Simon Horman <horms@verge.net.au>
>> Sent: 30 October 2018 14:00
>> To: Biju Das <biju.das@bp.renesas.com>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>; Guenter Roeck
>> <linux@roeck-us.net>; Rob Herring <robh+dt@kernel.org>; Mark Rutland
>> <mark.rutland@arm.com>; linux-watchdog@vger.kernel.org;
>> devicetree@vger.kernel.org; Geert Uytterhoeven
>> <geert+renesas@glider.be>; Chris Paterson
>> <Chris.Paterson2@renesas.com>; Fabrizio Castro
>> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
>> Subject: Re: [PATCH] dt-bindings: watchdog: renesas-wdt: Document
>> r8a77470 support
>>
>> On Fri, Oct 26, 2018 at 09:55:53AM +0100, Biju Das wrote:
>>> RZ/G1C (R8A77470) watchdog implementation is compatible with R-Car
>>> Gen2, therefore add relevant documentation.
>>>
>>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 
