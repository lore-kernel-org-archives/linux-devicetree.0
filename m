From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 1/1] mtd: nand: Add a devicetree binding for ECC strength
 and ECC step size
Date: Tue, 11 Feb 2014 16:56:33 +0100
Message-ID: <52FA4831.20504@gmail.com>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com> <1389960820-18696-2-git-send-email-ezequiel.garcia@free-electrons.com> <20140211141914.GC23150@localhost> <20980858CB6D3A4BAE95CA194937D5E73EA6F815@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6F815-yXqyApvAXouIQmiDNMet8wC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gupta,

On 11/02/2014 16:49, Gupta, Pekon wrote:
> Hi Ezequiel,
>
>> From: Ezequiel Garcia [mailto:ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
>>> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
>>> index 03855c8..683a310 100644
>>> --- a/Documentation/devicetree/bindings/mtd/nand.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
>>> @@ -3,5 +3,9 @@
>>>   - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>>>     Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>>>     "soft_bch".
>>>
> Should nand-ecc-mode also be marked as <deprecated>, and but we continue
> supporting it in kernel code ? If yes, then what is the life-time of these
> <deprecated> bindings. I mean exactly how many kernel versions should
> continue support deprecated bindings ?

What do you mean by deprecated ? How would a NAND flash controller 
driver choose amongs
its supported NAND ecc modes if we remove this property ?

Is there another patch series removing this property in the wild ?

>
>>> +- nand-ecc-strength : integer ECC required strength.
> With recent patches from 'Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>'
> "[RFC PATCH] mtd: add per NAND partition ECC config"
> Would you like 'nand-ecc-strength' to be per partition based ?

I don't think we should rely on this for the moment: I'm still working 
on it but it's far from stable.

Moreover, we can keep a default ecc mode for the NAND chip and 
partitions will inherit this ECC
mode when they do not specify any specific ECC config.

Best Regards,

Boris

>
> with regards, pekon

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
