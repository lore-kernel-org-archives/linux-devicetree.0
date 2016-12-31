From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add Garmin vendor prefix
Date: Sat, 31 Dec 2016 15:19:13 +0000
Message-ID: <6b4e2c4d-720a-a8c1-d45a-5b96abd37454@kernel.org>
References: <20161229051306.28547-1-matt@ranostay.consulting>
 <144bd616-1b5a-970a-edcb-13ebf67178f1@kernel.org>
 <CAJ_EiSTQ6naDiRP6o1UOr33UyKDtXaan2j4UPFNMTRKReuR-PQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ_EiSTQ6naDiRP6o1UOr33UyKDtXaan2j4UPFNMTRKReuR-PQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31/12/16 05:55, Matt Ranostay wrote:
> On Fri, Dec 30, 2016 at 12:26 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On 29/12/16 05:13, Matt Ranostay wrote:
>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Signed-off-by: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
>> Rob, just to check - is this the right way to go with prefixes?
>> It's awfully ugly in this case ;)
> 
> Rob said the stock ticker (likely the US exchanges) is the way to go :)
Fair enough.  Both applied to the togreg branch of iio.git and pushed
out as testing.

Thanks,

Jonathan
> 
>>
>> Jonathan
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
>>>  ge   General Electric Company
>>>  geekbuying   GeekBuying
>>>  gef  GE Fanuc Intelligent Platforms Embedded Systems, Inc.
>>>
>>
