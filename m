From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Support Persistent Protection Bits
 (PPB) locking
Date: Wed, 12 Dec 2012 16:44:18 +0100
Message-ID: <50C8A652.9040301@denx.de>
References: <1354864954-30290-1-git-send-email-sr@denx.de>
 <1355151644.2657.41.camel@sauron.fi.intel.com> <50C62CBA.5040401@denx.de>
 <1355325915.3400.8.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355325915.3400.8.camel-Bxnoe/o8FG+Ef9UqXRslZEEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Holger Brunck <holger.brunck-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/12/2012 04:25 PM, Artem Bityutskiy wrote:
> On Mon, 2012-12-10 at 19:40 +0100, Stefan Roese wrote:
>> On 12/10/2012 04:00 PM, Artem Bityutskiy wrote:
>>> On Fri, 2012-12-07 at 08:22 +0100, Stefan Roese wrote:
>>>> +       /*
>>>> +        * Wait for some time as unlocking of all sectors takes quite long
>>>> +        */
>>>> +       timeo = jiffies + (2 * HZ);     /* 2s max (un)locking */
>>>
>>> Please, use msecs_to_jiffies() instead.
>>
>> Sure, thats better.
> 
> Would you please do this instead?

Yes. I was just waiting for some further comments.

>> AFAIK, chip->mutex protects the access to the chip itself. So that
>> sequences are not interrupted.
>>
>> I have to admit that I haven't looked into get_chip() so far. It seems
>> to handle a state machine. Normally (idle state) it will just fall
>> through (FL_READY).
> 
> So it looks like the idea is that you first take the mutex, then call
> get_chip() which will wait for the chip becoming really ready, and then
> you can safely use it.

Thats it.

>>
>>> Why you need to drop the mutex here?
>>
>> Not sure, that might not be necessary. Copy and past from another loop
>> in the same file.
> 
> Probably from 'get_chip()' ?

Yes, most likely.

>>> Why is it not an ABBA deadlock to do this:
>>>
>>> Task 1: In the loop above, has chip locked, doing
>>>         mutex_lock(&chip->mutex);
>>>
>>> Task 2: done mutex_lock(&chip->mutex), now doing
>>>         ret = get_chip(map, chip, adr + chip->start, FL_LOCKING);
>>
>> I don't see two different locks/mutexes (only A) here. As get_chip()
>> does no request any real mutex. Please correct me if I'm wrong.
> 
> Right, there is indeed no deadlock.
> 
>> In many other places UDELAY() is called:
>>
>> #define UDELAY(map, chip, adr, usec)  \
>> do {  \
>> 	mutex_unlock(&chip->mutex);  \
>> 	cfi_udelay(usec);  \
>> 	mutex_lock(&chip->mutex);  \
>> } while (0)
> 
> Why not to use this as well then for consistency?

Okay, will do.

I'll send a new patch version today.

Thanks for the review,
Stefan
