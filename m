From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] mtd: ofpart: update devicetree binding specification
Date: Mon, 26 Oct 2015 23:35:24 -0500
Message-ID: <CAL_JsqJ4Ha7R92=6xkwYXZjpEprjWoVxyXM6cG=yykVoTMH-vw@mail.gmail.com>
References: <cover.1439911625.git.hramrach@gmail.com> <e47db0c8eeaeb11353bcb2f4dcd138e813c3ecd7.1439911625.git.hramrach@gmail.com>
 <20151011200402.GE3696@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151011200402.GE3696@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 11, 2015 at 3:04 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi DT maintainers,
>
> It's a bit hypocritical of me, since I've been a slow reviewer as well,
> but... can we get some review on this one? Usually, I'm comfortable
> taking driver DT bindings without your review, but this one is a bit
> more generic and is more far-reaching than the average driver.

Sorry, missed this one. This would be a good one to send to
devicetree-spec to BTW.

> I'm not a big fan of this change, and I don't quite understand why the
> bus driver (the SPI bus, which is a level up from the SPI device / MTD
> node) can specify its grandchildren (see spi-samsung.txt). But given the

That's just an example. I just would change it.

> constraints, I think Michal's solution is OK. And I do agree that MTD's
> ofpart should be bit more specific.
>
> Anyway, a quick look and an Ack/Nak would be appreciated.

Looks fine to me:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>
> Thanks,
> Brian
>
> On Tue, Aug 18, 2015 at 03:34:08PM -0000, Michal Suchanek wrote:
>> To avoid conflict with other drivers using subnodes of the mtd device
>> create only one ofpart-specific node rather than any number of
>> arbitrary partition subnodes.
>>
>> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> v3:
>>
>>  - rename DT node ofpart -> partitions
>> ---
>>  .../devicetree/bindings/mtd/partition.txt          | 68 +++++++++++++---------
>>  1 file changed, 40 insertions(+), 28 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
>> index 8e5557d..8c2aff7 100644
>> --- a/Documentation/devicetree/bindings/mtd/partition.txt
>> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
>> @@ -4,10 +4,16 @@ Partitions can be represented by sub-nodes of an mtd device. This can be used
>>  on platforms which have strong conventions about which portions of a flash are
>>  used for what purposes, but which don't use an on-flash partition table such
>>  as RedBoot.
>> +
>> +The partition table should be partitions subnode of the mtd node. Partitions are
>> +defined in subnodes of the partitions node.
>> +
>> +For backwards compatibility partitions as direct subnodes of the mtd device are
>> +supported. This use is discouraged.
>>  NOTE: if the sub-node has a compatible string, then it is not a partition.
>>
>> -#address-cells & #size-cells must both be present in the mtd device. There are
>> -two valid values for both:
>> +#address-cells & #size-cells must both be present in the partitions subnode of the
>> +mtd device. There are two valid values for both:
>>  <1>: for partitions that require a single 32-bit cell to represent their
>>       size/address (aka the value is below 4 GiB)
>>  <2>: for partitions that require two 32-bit cells to represent their
>> @@ -28,44 +34,50 @@ Examples:
>>
>>
>>  flash@0 {
>> -     #address-cells = <1>;
>> -     #size-cells = <1>;
>> +     partitions {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>>
>> -     partition@0 {
>> -             label = "u-boot";
>> -             reg = <0x0000000 0x100000>;
>> -             read-only;
>> -     };
>> +             partition@0 {
>> +                     label = "u-boot";
>> +                     reg = <0x0000000 0x100000>;
>> +                     read-only;
>> +             };
>>
>> -     uimage@100000 {
>> -             reg = <0x0100000 0x200000>;
>> +             uimage@100000 {
>> +                     reg = <0x0100000 0x200000>;
>> +             };
>>       };
>>  };
>>
>>  flash@1 {
>> -     #address-cells = <1>;
>> -     #size-cells = <2>;
>> +     partitions {
>> +             #address-cells = <1>;
>> +             #size-cells = <2>;
>>
>> -     /* a 4 GiB partition */
>> -     partition@0 {
>> -             label = "filesystem";
>> -             reg = <0x00000000 0x1 0x00000000>;
>> +             /* a 4 GiB partition */
>> +             partition@0 {
>> +                     label = "filesystem";
>> +                     reg = <0x00000000 0x1 0x00000000>;
>> +             };
>>       };
>>  };
>>
>>  flash@2 {
>> -     #address-cells = <2>;
>> -     #size-cells = <2>;
>> +     partitions {
>> +             #address-cells = <2>;
>> +             #size-cells = <2>;
>>
>> -     /* an 8 GiB partition */
>> -     partition@0 {
>> -             label = "filesystem #1";
>> -             reg = <0x0 0x00000000 0x2 0x00000000>;
>> -     };
>> +             /* an 8 GiB partition */
>> +             partition@0 {
>> +                     label = "filesystem #1";
>> +                     reg = <0x0 0x00000000 0x2 0x00000000>;
>> +             };
>>
>> -     /* a 4 GiB partition */
>> -     partition@200000000 {
>> -             label = "filesystem #2";
>> -             reg = <0x2 0x00000000 0x1 0x00000000>;
>> +             /* a 4 GiB partition */
>> +             partition@200000000 {
>> +                     label = "filesystem #2";
>> +                     reg = <0x2 0x00000000 0x1 0x00000000>;
>> +             };
>>       };
>>  };
>> --
>> 2.1.4
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
