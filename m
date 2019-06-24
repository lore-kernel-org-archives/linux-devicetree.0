From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v7 3/5] mtd: Add support for HyperBus memory devices
Date: Mon, 24 Jun 2019 19:03:44 +0530
Message-ID: <053894bc-1536-0b6c-5255-ab9be6d66eee@ti.com>
References: <20190620172250.9102-1-vigneshr@ti.com>
 <20190620172250.9102-4-vigneshr@ti.com>
 <4d17e914-cd1f-c6fe-b70a-6aae02e0cf4e@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4d17e914-cd1f-c6fe-b70a-6aae02e0cf4e@cogentembedded.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 22/06/19 1:22 AM, Sergei Shtylyov wrote:
> Hello!
> 
> On 06/20/2019 08:22 PM, Vignesh Raghavendra wrote:
> 
>> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
>> Bus interface between a host system master and one or more slave
>> interfaces. HyperBus is used to connect microprocessor, microcontroller,
>> or ASIC devices with random access NOR flash memory (called HyperFlash)
>> or self refresh DRAM (called HyperRAM).
>>
>> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
>> signal and either Single-ended clock(3.0V parts) or Differential clock
>> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
>> At bus level, it follows a separate protocol described in HyperBus
>> specification[1].
>>
>> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
>> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
>> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
>> HyperBus operates at >166MHz frequencies.
> 
>    s/wrt/WRT/.

OK

[...]
>> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
>> new file mode 100644
>> index 000000000000..ead969aad35b
>> --- /dev/null
>> +++ b/include/linux/mtd/hyperbus.h
>> @@ -0,0 +1,86 @@
> [...]
>> +/**
>> + * struct hyperbus_ops - struct representing custom HyperBus operations
>> + * @read16: read 16 bit of data to flash in a single burst. Used to read
> 
>    s/to flash/from flash/.
>

Will fix


> [...]
>> +#endif /* __LINUX_MTD_HYPERBUS_H__ */
> 
>    I thought you agreed to add the #defines for the HF commands. Well, I can add them
> as well...
> 

Sorry, I thought you were proposing to add them to your driver's header
file. Anyways, I think its better to add defines when there is an actual
user.

If there are no further comments, I will fixup things locally and queue
up for next release.

-- 
Regards
Vignesh
