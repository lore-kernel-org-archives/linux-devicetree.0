From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: nand: denali: reduce the register space in
 the example
Date: Thu, 14 Sep 2017 17:16:12 +0900
Message-ID: <CAK7LNAS9PZM49HJJRegQ9C+nrHKJntvHeURqO5Y07L5_dJpTeQ@mail.gmail.com>
References: <1505373456-24047-1-git-send-email-yamada.masahiro@socionext.com> <3c17c272-40ec-4eeb-0dc3-59a64400e6f8@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3c17c272-40ec-4eeb-0dc3-59a64400e6f8-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi.


2017-09-14 17:04 GMT+09:00 Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> Hi,
>
> i assume arch/arm/boot/dts/socfpga.dtsi should be update as well. Right?

I think so.
(also arch/arm/boot/dts/socfpga_arria10.dtsi in the same way)

The wrong property "dma-mask" was removed by
commit 60d920d32ca40660e382cf9ccbc236599a49e607.



> On 14.09.2017 09:17, Masahiro Yamada wrote:
>>
>> This example allocates too much for register regions.  Especially,
>> there are only two registers in the "nand_data" interface of this
>> hardware (ADDR: 0x00, DATA: 0x10).
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> ---
>>
>>   Documentation/devicetree/bindings/mtd/denali-nand.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> index 504291d..0ee8edb 100644
>> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> @@ -29,7 +29,7 @@ nand: nand@ff900000 {
>>         #address-cells = <1>;
>>         #size-cells = <1>;
>>         compatible = "altr,socfpga-denali-nand";
>> -       reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
>> +       reg = <0xff900000 0x20>, <0xffb80000 0x1000>;
>>         reg-names = "nand_data", "denali_reg";
>>         interrupts = <0 144 4>;
>>   };
>>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
