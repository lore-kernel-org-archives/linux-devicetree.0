From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: add driver for the flash in Lattice machxo2 FPGAs
Date: Fri, 25 Jul 2014 14:07:33 +0530
Message-ID: <53D2174D.80909@gmail.com>
References: <20140724162225.22308.66538.stgit@localhost> <53D1D8ED.4010209@gmail.com> <53D20F51.2090705@parkeon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D20F51.2090705-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/25/2014 01:33 PM, Martin Fuzzey wrote:

(...)

> +
>>> +static void machxo2_lock(struct machxo2 *machxo2)
>>> +{
>>> +    if (!mutex_trylock(&machxo2->lock)) {
>>> +        dev_dbg(machxo2->dev, "wait for %s from %pf\n",
>>> +                __func__, __builtin_return_address(0));
>>> +
>>
>> dev_dbg(machxo2->dev, "wait for %s from %pf\n",
>>     __func__, __builtin_return_address(0));
>>
>
> Sorry, not understanding here.
> You want the second line to be LESS intented??
>
> Coding style (chapter 2) says:
>     Descendants are always substantially shorter than the parent and
>     are placed substantially to the right
>
> Idem for the others

this is the problem with my email client sorry.. 2nd line should start exactly
below 'm' in machxo2->dev...
  
dev_dbg(machxo2->dev, "wait for %s from %pf\n",
	__func__, __builtin_return_address(0));

>
>> +static int machxo2_transceive(
>>> +            struct machxo2 *machxo2,
>>> +            const void *send_buf, unsigned send_len,
>>> +            void *recv_buf, unsigned recv_len)
>>
(...)

>>> +struct machxo2 *machxo2_create(struct device *dev,
>>> +            struct machxo2_busops *busops);
>>> +
>>
>> struct machxo2 *machxo2_create(struct device *dev,
>>                    struct machxo2_busops *busops);
>>
>>
> Same again - is it just too much indenting?
> I don't see anything wrong here
>
same...


-- 
Regards,
Varka Bhadram.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
