From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for mtd
 nvmem
Date: Fri, 10 Mar 2017 05:52:36 +0100
Message-ID: <eb8f93fd-0534-2b91-7fec-7d40ddf7b8cb@gmail.com>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <9f54978c-6d61-cf2c-fb2d-f5ef2af19e0f@gmail.com>
 <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHc34fG_TZbHrRp=oB_e=-o18zDesT73YSEx1Tr5ZE0oSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Alban <albeu-GANU6spQydw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/10/2017 05:06 AM, Moritz Fischer wrote:
> On Thu, Mar 9, 2017 at 7:17 PM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 03/07/2017 09:26 AM, Alban wrote:
>>> Config data for drivers, like MAC addresses, is often stored in MTD.
>>> Add a binding that define how such data storage can be represented in
>>> device tree.
>>>
>>> Signed-off-by: Alban <albeu-GANU6spQydw@public.gmane.org>
>>> ---
>>> Changelog:
>>> v2: * Added a "Required properties" section with the nvmem-provider
>>>       property
>>> ---
>>>  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>> new file mode 100644
>>> index 0000000..8ed25e6
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
>>> @@ -0,0 +1,33 @@
>>> += NVMEM in MTD =
>>> +
>>> +Config data for drivers, like MAC addresses, is often stored in MTD.
>>> +This binding define how such data storage can be represented in device tree.
>>> +
>>> +An MTD can be defined as an NVMEM provider by adding the `nvmem-provider`
>>> +property to their node. Data cells can then be defined as child nodes
>>> +of the partition as defined in nvmem.txt.
>>
>> Why don't we just read the data from MTD and be done with it ? What's
>> the benefit of complicating things by using nvmem ?
> 
> Well because usually stuff like MAC addresses etc are stored in eeproms.

But eeproms are already supported, see drivers/misc/ .

> This gives a nice abstraction with making them both look like nvmem (that was my
> reasoning back then when I submitted a patch to support the OTP part in a
> SPI NOR part.

Hm, I am confused here, we're mixing SPI NOR, EEPROMs and OTP devices here.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
