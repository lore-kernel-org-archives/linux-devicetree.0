From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: document /sys/firmware/fdt
Date: Wed, 28 Jun 2017 15:04:15 -0700
Message-ID: <595427DF.1050808@gmail.com>
References: <1497414007-8380-1-git-send-email-frowand.list@gmail.com>
 <20170622152124.hc7pgqlirr6h7t7k@rob-hp-laptop>
 <20170622152329.ear3hkossznzk3o5@rob-hp-laptop> <595423C7.7040400@gmail.com>
 <CACxGe6tKZRoZQEbVNJqrSqC2VtPsNJfCyHeY0KSgJbe7eQqmYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6tKZRoZQEbVNJqrSqC2VtPsNJfCyHeY0KSgJbe7eQqmYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/28/17 14:49, Grant Likely wrote:
> I'm slowly getting back into things and plan to actively participate.
> Please use my ARM address:
> 
> grant.likely-5wv7dgnIgG8@public.gmane.org

OK, I'll do that.

-Frank

> 
> g.
> 
> On Wed, Jun 28, 2017 at 10:46 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 06/22/17 08:23, Rob Herring wrote:
>>> Meant to add Grant.
>>>
>>> On Thu, Jun 22, 2017 at 10:21:24AM -0500, Rob Herring wrote:
>>>> On Tue, Jun 13, 2017 at 09:20:07PM -0700, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>>>>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>>>
>>>>> Add ABI documentation for /sys/firmware/fdt
>>>>>
>>>>> Update contact for /sys/firmware/devicetree/* to include mail list
>>>>>
>>>>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>>> ---
>>>>>  Documentation/ABI/testing/sysfs-firmware-ofw | 27 ++++++++++++++++++++++++++-
>>>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-firmware-ofw b/Documentation/ABI/testing/sysfs-firmware-ofw
>>>>> index f562b188e71d..8e700db6c295 100644
>>>>> --- a/Documentation/ABI/testing/sysfs-firmware-ofw
>>>>> +++ b/Documentation/ABI/testing/sysfs-firmware-ofw
>>>>> @@ -1,6 +1,6 @@
>>>>>  What:              /sys/firmware/devicetree/*
>>>>>  Date:              November 2013
>>>>> -Contact:   Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>> +Contact:   Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>>
>>>> Grant's email is not valid either. I would just drop it unless he wants
>>>> his secretlab.ca email.
>>>>
>>>> Rob
>>>
>>
>> No response from Grant, so I'll drop his email and add the mail list.
>>
>> Also, for the newly added section I'll change the contact from being both
>> me and the mail list to just be the mail list.
>>
>> -Frank
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
