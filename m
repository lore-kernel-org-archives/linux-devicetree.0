From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 3/9] of: mtd: add NAND timings retrieval support
Date: Thu, 09 Jan 2014 09:36:18 +0100
Message-ID: <52CE5F82.6070802@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com> <1389190924-26226-4-git-send-email-b.brezillon@overkiz.com> <20140108183418.GA12358@obsidianresearch.com> <52CDA032.3010804@overkiz.com> <20140108191339.GB12358@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140108191339.GB12358-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/01/2014 20:13, Jason Gunthorpe wrote:
> On Wed, Jan 08, 2014 at 08:00:02PM +0100, boris brezillon wrote:
>> Hello Jason,
>>
>> Le 08/01/2014 19:34, Jason Gunthorpe a ?crit :
>>> On Wed, Jan 08, 2014 at 03:21:58PM +0100, Boris BREZILLON wrote:
>>>
>>>> +int of_get_nand_timings(struct device_node *np, struct nand_timings *timings)
>>>> +{
>>>> +	memset(timings, 0, sizeof(*timings));
>>>> +	of_property_read_u32(np, "tCLS-min", &timings->tCLS_min);
>>>> +	of_property_read_u32(np, "tCLH-min", &timings->tCLH_min);
>>>> +	of_property_read_u32(np, "tCS-min", &timings->tCS_min);
>>> [..]
>>>
>>> A while ago when discussing another controller it was pointed out
>>> these values are all auto-probable directly from the NAND via a ONFI
>>> defined GET FEATURE @0x01 query, and adding these timings to the DT
>>> was NAK'd..
>>>
>>> Basically you set the interface to the slowest ONFI timing mode, do
>>> the GET FEATURE to the NAND chip and then increase the interface speed
>>> to the highest mutually supported ONFI mode.
>>> Is there some reason you need to encode this in the DT?
>> What if the NAND does not support the ONFI interface (and this is
>> exactly the case for the NAND available on the cubietruck board:
>> H27UCG8T2ATR).
> Sounds like a good reason to me!
>
> You might want to check if you can boil down the DT timings from the
> huge list to just an ONFI mode number..

Sure, but the sunxi driver needs at least 19 of them...

>
> I'd echo Rob's comments, the property needs to include the units
> in the name, and I strongly recommend picoseconds for these
> values.

Agreed, picosecond is a more future-proof unit.

>
> Also, you might want to check that the ONFI names for these parameters
> are used, not a vendor specific name to try and avoid confusion.

I'll check it.

Thanks.

Best Regards,

Boris

>
> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
