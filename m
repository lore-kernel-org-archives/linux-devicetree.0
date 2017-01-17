From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add Garmin vendor prefix
Date: Tue, 17 Jan 2017 02:52:22 +0100
Message-ID: <70a7c21f-cfe8-bada-fb33-a1d0111c02a9@gmail.com>
References: <20161229051306.28547-1-matt@ranostay.consulting>
 <06f2cde2-ac7e-d0e5-5e35-a4946d0398f8@gmail.com>
 <CAJ_EiSQ+kfNnoDsed67v_1CLui7Fp2qMsx67bYMvQ0Y98jO+Aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ_EiSQ+kfNnoDsed67v_1CLui7Fp2qMsx67bYMvQ0Y98jO+Aw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/17/2017 02:50 AM, Matt Ranostay wrote:
> On Mon, Jan 16, 2017 at 5:07 PM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 12/29/2016 06:13 AM, Matt Ranostay wrote:
>>
>> Some commit message / description of the company would be useful.
>>
>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
>>> ---
>>> Changes from v1:
>>> * switch to stock ticker for Garmin Limited
>>>
>>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> index 16d3b5e7f5d1..5749bfc5fc5b 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> @@ -107,6 +107,7 @@ firefly   Firefly
>>>  focaltech    FocalTech Systems Co.,Ltd
>>>  friendlyarm  Guangzhou FriendlyARM Computer Tech Co., Ltd
>>>  fsl  Freescale Semiconductor
>>> +grmn Garmin Limited
>>
>> Why grmn ? Why not 'garmin' ? Also, the rest uses Ltd. , so make it
>> consistent ?
>>
> 
> As already stated GRMN is the US stock ticker...  and is the "correct way" :)

So we should use the US stock tickers for DT vendor prefixes now ?

>>>  ge   General Electric Company
>>>  geekbuying   GeekBuying
>>>  gef  GE Fanuc Intelligent Platforms Embedded Systems, Inc.
>>>
>>
>>
>> --
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
