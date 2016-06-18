From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sat, 18 Jun 2016 21:35:42 +0200
Message-ID: <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5765A14F.6020201-/L3Ra7n9ekc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/18/2016 09:30 PM, Richard Weinberger wrote:
> Am 18.06.2016 um 21:17 schrieb Hauke Mehrtens:
>> This makes it possible to open a ubi layer in device tree, this is
>> helpful when the rootfs is on a ubi layer. It loops though all mtd
>> partitions and mounts the partition which is compatible with
>> "ubi,volume". The same was only possible with kernel command line
>> arguments before.
>>
>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
>>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++++++++++
>>  2 files changed, 96 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt
> 
> Some time ago I thought about an UBI DT binding too, but
> I have been told that device tree is only for describing the hardware
> and nothing else.
> So I fear this will be rejected by DT folks.

There are some devices on the market that are storing the root file
system in an ubi layer.
To make this work there are currently two options.
1. patch the kernel to specify which partitions to open in the code.
2. provide some kernel command line parameter which specifies what to open.

I would like to specify this in device tree.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
