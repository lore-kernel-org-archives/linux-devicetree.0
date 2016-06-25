From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 2/2] ubi: open volumes define in device tree
Date: Sat, 25 Jun 2016 22:24:31 +0200
Message-ID: <ea18e1b8-c823-edf1-73b3-0568f504fec9@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <1466277476-14853-2-git-send-email-hauke@hauke-m.de>
 <CAAEAJfATWJL0fGEcBup+cWzhHUe_4CF4XHWuvp4NYOesmaTyZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAEAJfATWJL0fGEcBup+cWzhHUe_4CF4XHWuvp4NYOesmaTyZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/24/2016 08:45 PM, Ezequiel Garcia wrote:
> On 18 June 2016 at 16:17, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org> wrote:
>> This makes it possible to define a volume to open in device tree. This
>> is helpful when a root file system is on a ubi layer. Without this
>> patch it is only possible to device with with kernel command line
>> parameters.
>>
>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/ubi.txt | 22 +++++++++++++++++
>>  drivers/mtd/ubi/build.c                       | 34 +++++++++++++++++++++++++++
>>  2 files changed, 56 insertions(+)
>>
....
>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> index 16baeb5..1c22533 100644
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -1,6 +1,7 @@
>>  /*
>>   * Copyright (c) International Business Machines Corp., 2006
>>   * Copyright (c) Nokia Corporation, 2007
>> + * Copyright (c) 2016 Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>>   *
> 
> A tangential comment for this and other patches.
> 
> There's no need to add your copyright when you are submitting
> small contributions.
> 
The GPL v2 [0] says in section 1 a):
> You must cause the modified files to carry prominent notices stating
> that you changed the files and the date of any change.

My assumption is that my changes are copyrightable and then I have to
add a notice accordingly to the GPL. I do not really care about this and
can remove this.

Hauke

[0]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
