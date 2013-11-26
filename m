From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 06/12] mtd: nand: davinci: adjust DT properties to MTD
 generic
Date: Tue, 26 Nov 2013 12:49:46 +0200
Message-ID: <52947CCA.2010400@ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>, <1384187188-5776-7-git-send-email-ivan.khoronzhuk@ti.com> <4F5844B3A985794BA902E12C070812375F8D20@DNCE04.ent.ti.com> <529447A7.1050605@ti.com> <52947832.3080309@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52947832.3080309-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/26/2013 12:30 PM, Grygorii Strashko wrote:
> On 11/26/2013 09:03 AM, Sekhar Nori wrote:
>> On Monday 11 November 2013 10:31 PM, Khoronzhuk, Ivan wrote:
>>> The properties davinci-ecc-mode, davinci-nand-use-bbt, davinci-nand-buswidth
>>> are MTD generic. Correct names for them are: nand-ecc-mode, nand-on-flash-bbt,
>>> nand-bus-width accordingly. So rename them in dts and documentation.
>>>
>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
>>> ---
>>>    .../devicetree/bindings/mtd/davinci-nand.txt       |   25 ++++++++++++++++----
>>>    drivers/mtd/nand/davinci_nand.c                    |   11 ++++++---
>>>    2 files changed, 28 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
>>> index d2a3fc0..befaa5b 100644
>>> --- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
>>> @@ -37,7 +37,7 @@ Recommended properties :
>>>    - ti,davinci-mask-chipsel:     mask for chipselect address. Needed to mask
>>>                                   addresses for given chipselect.
>>>
>>> -- ti,davinci-ecc-mode:         operation mode of the NAND ecc mode. ECC mode
>>> +- nand-ecc-mode:               operation mode of the NAND ecc mode. ECC mode
>>>                                   valid values for davinci driver:
>>>                                   - "none"
>>>                                   - "soft"
>>> @@ -45,10 +45,25 @@ Recommended properties :
>>>
>>>    - ti,davinci-ecc-bits:         used ECC bits, currently supported 1 or 4.
>>>
>>> -- ti,davinci-nand-buswidth:    buswidth 8 or 16.
>>
>> Shouldn't we keep the documentation for existing bindings while just
>> marking them as deprecated?
>
> I haven't found any requirements about this in doc.
> It's done in both way in other drivers - some keep properties in bindings
> documentation and some are not.
>
> Regards,
> -grygorii
>

For me this is not needed, but for example from mtd:
Documentation/devicetree/bindings/mtd/gpmc-nand.txt
,it contains deprecated properties, like a lot of others.

And this sad me I should remain deprecated properties.
Anyway if we have these properties in driver we should describe them.

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
