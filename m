From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 13/15] MIPS: JZ4770: Workaround for corrupted DMA
 transfers
Date: Fri, 05 Jan 2018 19:03:52 +0100
Message-ID: <1515175432.2058.0@smtp.crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
        <20180102150848.11314-13-paul@crapouillou.net>
        <CANc+2y4mJMMiN4SPiPtcXMrQ0AM_2XGnVRk1Dvyv9VYpNN3x-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANc+2y4mJMMiN4SPiPtcXMrQ0AM_2XGnVRk1Dvyv9VYpNN3x-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,
Hi,

>> [...]
>> 
>>  +/*
>>  + * We have seen MMC DMA transfers read corrupted data from SDRAM 
>> when a burst
>>  + * interval ends at physical address 0x10000000. To avoid this 
>> problem, we
>>  + * remove the final page of low memory from the memory map.
>>  + */
>>  +void __init jz4770_reserve_unsafe_for_dma(void)
>>  +{
>>  +       int i;
>>  +
>>  +       for (i = 0; i < boot_mem_map.nr_map; i++) {
>>  +               struct boot_mem_map_entry *entry = boot_mem_map.map 
>> + i;
>>  +
>>  +               if (entry->type != BOOT_MEM_RAM)
>>  +                       continue;
>>  +
>>  +               if (entry->addr + entry->size != 0x10000000)
>>  +                       continue;
>>  +
>>  +               entry->size -= PAGE_SIZE;
>>  +               break;
>>  +       }
>>  +}
>>  +
> 
> Just a wild idea (probably bad too). Changing the memory node in the
> device tree to skip this physical address would work I think. What is
> your opinion about that?

I guess it would work as well, but I don't think this fix should be in 
devicetree.

-Paul
