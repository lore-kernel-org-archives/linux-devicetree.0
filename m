From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH] mtd: denali: fix property name for Denali DT binding
Date: Thu, 3 Mar 2016 12:56:59 +0900
Message-ID: <CAK7LNAT4qvp0DcevLXtGyGUn2kDjHWOH42Yn5yR9xGZkJ8Qdvw@mail.gmail.com>
References: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
	<5298318.0qJ9fLYbSx@wuerfel>
	<CAK7LNAS2r=_RL6dmj1xhCzGtvMP=emC=_bW4Ot5SMe6ij-WpBQ@mail.gmail.com>
	<20160208213757.GA3223@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160208213757.GA3223@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


2016-02-09 6:37 GMT+09:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Feb 08, 2016 at 05:41:33PM +0900, Masahiro Yamada wrote:
>> Hi Arnd,
>>
>>
>> 2016-02-08 17:29 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
>> > On Monday 08 February 2016 16:31:42 Masahiro Yamada wrote:
>> >> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> index b04d03a..785b825 100644
>> >> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
>> >> @@ -5,7 +5,7 @@ Required properties:
>> >>    - reg : should contain registers location and length for data and reg.
>> >>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>> >>    - interrupts : The interrupt number.
>> >> -  - dm-mask : DMA bit mask
>> >> +  - dma-mask : DMA bit mask
>> >>
>> >>  The device tree may optionally contain sub-nodes describing partitions of the
>> >>  address space. See partition.txt for more detail.
>> >>
>> >
>> > It looks like this binding is wrong in multiple ways, and it doesn't seem to
>> > be used in any .dts files. Is this actually being shipped anywhere or
>> > could we try to fix the binding properly?
>> >
>>
>> Looks like it is locally used in Altera's Rocketboard tree now.
>>
>> See this:
>>
>> https://github.com/altera-opensource/linux-socfpga/blob/socfpga-4.3/arch/arm/boot/dts/socfpga.dtsi
>>
>>
>> I hope Dinh can comment on the status.
>
> From the looks of it, this property should be dropped and the driver
> should be updated to not touch dev->dma_mask. The core sets it up
> correctly now.


I am still a newbie as for DMA.
Could you help me to understand what we should do and/or what we should not do
for the DMA mask.


Documentation/DMA-API-HOWTO.txt says as follows:

-------------------->8-----------------------
For correct operation, you must interrogate the kernel in your device
probe routine to see if the DMA controller on the machine can properly
support the DMA addressing limitation your device has.  It is good
style to do this even if your device holds the default setting,
because this shows that you did think about these issues wrt. your
device.
--------------------<8----------------------


>From your statement, low-level drivers should no longer touch dma-mask
(i.e., the quoted paragraph above no longer applies to the latest
driver implementation),
is this correct?



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
