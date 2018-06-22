From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 1/3] mtd: rawnand: denali_dt: add more clocks based on
 IP datasheet
Date: Fri, 22 Jun 2018 22:24:56 +0900
Message-ID: <CAK7LNAQdfEF3j69DnmpwTMnuBQJ+f4x-1Di9TZ1f5hvVmPDwmw@mail.gmail.com>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
 <1529025532-22087-2-git-send-email-yamada.masahiro@socionext.com>
 <20180619132811.45bf6454@bbrezillon> <20180622134235.5ab76325@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622134235.5ab76325@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-stable #4 . 14+" <stable@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

2018-06-22 20:42 GMT+09:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> Hi Masahiro,
>
> On Tue, 19 Jun 2018 13:28:11 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>
>> Hi Masahiro,
>>
>> On Fri, 15 Jun 2018 10:18:50 +0900
>> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>>
>> > According to the Denali User's Guide, this IP needs three clocks:
>> >
>> >  - clk: controller core clock
>> >
>> >  - clk_x: bus interface clock
>> >
>> >  - ecc_clk: clock at which ECC circuitry is run
>> >
>> > Currently, denali_dt.c requires a single anonymous clock and its
>> > frequency.  However, the driver needs to get the frequency of "clk_x"
>> > not "clk".  This is confusing because people tend to assume the
>> > anonymous clock means the core clock.  In fact, I got a report of
>> > SOCFPGA breakage because the timing parameters are calculated based
>> > on a wrong frequency.
>> >
>> > Instead of the cheesy implementation, the clocks in the real hardware
>> > should be represented in the driver and the DT-binding.
>> >
>> > However, adding new clocks would break the existing platforms.  For the
>> > backward compatibility, the driver still accepts a single clock just as
>> > before.  If clk_x is missing, clk_x_rate is set to a hardcoded value.
>> > This is fine for existing DT of Socionext UniPhier, and also fixes the
>> > issue of Altera (Intel) SOCFPGA because both platforms use 200 MHz for
>> > the bus interface clock.
>> >
>> > Fixes: 1bb88666775e ("mtd: nand: denali: handle timing parameters by setup_data_interface()")
>>
>> Sorry for changing my mind, but I think this patch is doing more than
>> just fixing a bug. The bugfix should IMO be limited to unconditionally
>> setting ->clk_x_rate to 200000000 since this is what was done before
>> commit 1bb88666775e. And the remaining changes should go in nand/next.
>
> Do you want me to write this patch? Note that I can't really take this
> patch since Rob asked for a new version with DT bindings changes placed
> in a separate patch.


Sorry for the delay.  I was traveling.

Now I am back home, and started to flush my TODO queue.

V4 will be soon.




-- 
Best Regards
Masahiro Yamada
