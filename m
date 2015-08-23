From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Sun, 23 Aug 2015 23:58:35 +0200
Message-ID: <CAPybu_1m6_BP54_C-utM1AnPRE4CGh=qFjvFJhFf2MDeugaKbw@mail.gmail.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org>
 <1433686811-12303-3-git-send-email-grant.likely@linaro.org>
 <20150615164630.GC1583@katana> <CAPybu_0S2b+xo3UJKbgpu39rtPT2x89+nEZ_hahLXiGbcCmeEA@mail.gmail.com>
 <CAPybu_0dYgQ_vKnXhZyOf-m5Z7DOnRKD4bB91dWk41pepmqDDA@mail.gmail.com> <CAL_JsqJwpTdKdvDTUN5H3fjd9pDinShjk9Kp2J5=DUUo4iFsZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJwpTdKdvDTUN5H3fjd9pDinShjk9Kp2J5=DUUo4iFsZg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

thanks!

Please, remember that we need to push it also to stable :)



On Sun, Aug 23, 2015 at 11:52 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Jul 16, 2015 at 3:33 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> ping?
>>
>> Hello Grant, Hello Greg
>>
>> Is there any planned timeframe for applying this patch into someones tree?
>
> Greg is out ATM. I'll pick this up for 4.3.
>
> Rob
>
>>
>>
>> Thanks!
>>
>> On Tue, Jun 23, 2015 at 7:12 PM, Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>>> Hello
>>>
>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>
>>> This patch now have a bunch of tested-by and without it, the current
>>> version of linux-next crash.
>>>
>>> Who will take it? Grant,  Greg? Please make sure to notify
>>> linux-stable since at least 4.1
>>>
>>> Thanks!
>>>
>>>
>>> --
>>> Ricardo Ribalda
>>
>>
>>
>> --
>> Ricardo Ribalda



-- 
Ricardo Ribalda
