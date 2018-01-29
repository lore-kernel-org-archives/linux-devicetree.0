From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 1/2] of: change overlay apply input data from EDT to FDT
Date: Mon, 29 Jan 2018 00:12:03 -0800
Message-ID: <86a33d15-e453-2448-279e-cecb41c323e9@gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
 <1517194414-19932-2-git-send-email-frowand.list@gmail.com>
 <CAK7LNAQBjkZe05Vmm7mPhYWEM7ExMb7J3f8m5UYP_goMUW+75Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQBjkZe05Vmm7mPhYWEM7ExMb7J3f8m5UYP_goMUW+75Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On 01/28/18 19:21, Masahiro Yamada wrote:
> Hi Frank,
> 
> 2018-01-29 11:53 GMT+09:00  <frowand.list@gmail.com>:
>> From: Frank Rowand <frank.rowand@sony.com>
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index df697976740a..2b7ee68c908e 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -3,6 +3,21 @@ DTC_FLAGS_testcases := -Wno-interrupts_property
>>  obj-y += testcases.dtb.o
>>
>>  obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
>> +                           overlay_0.dtb.o \
>> +                           overlay_1.dtb.o \
>> +                           overlay_2.dtb.o \
>> +                           overlay_3.dtb.o \
>> +                           overlay_4.dtb.o \
>> +                           overlay_5.dtb.o \
>> +                           overlay_6.dtb.o \
>> +                           overlay_7.dtb.o \
>> +                           overlay_8.dtb.o \
>> +                           overlay_9.dtb.o \
>> +                           overlay_10.dtb.o \
>> +                           overlay_11.dtb.o \
>> +                           overlay_12.dtb.o \
>> +                           overlay_13.dtb.o \
>> +                           overlay_15.dtb.o \
>>                             overlay_bad_phandle.dtb.o \
>>                             overlay_bad_symbol.dtb.o \
>>                             overlay_base.dtb.o
>> @@ -14,6 +29,7 @@ DTC_FLAGS_overlay := -@
>>  DTC_FLAGS_overlay_bad_phandle := -@
>>  DTC_FLAGS_overlay_bad_symbol := -@
>>  DTC_FLAGS_overlay_base := -@
>> +DTC_FLAGS_testcases := -@
>>
> 
> This overwrites '-Wno-interrupts_property' a few lines above.
> 
> Perhaps, do you want to do like this?
> 
>      DTC_FLAGS_testcases += -@
> 
> or
> 
>      DTC_FLAGS_testcases := -Wno-interrupts_property -@

Yes, thanks for catching that!  I'll fix it.

-Frank
