From: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND
 controller documentation
Date: Tue, 25 Sep 2018 11:14:04 +0200
Message-ID: <88321fb8-08a4-e8a2-9ac5-2bef910cd53a@st.com>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
 <1537199260-7280-2-git-send-email-christophe.kerello@st.com>
 <20180922103440.12575714@xps13> <c9925c9c-af40-8044-8dbe-866fbe3a2f99@st.com>
 <20180924191725.2439fd10@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924191725.2439fd10@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, computersforpeace@gmail.com, dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Boris,

On 09/24/2018 07:17 PM, Boris Brezillon wrote:
> Hi Christophe,
> 
> On Mon, 24 Sep 2018 18:36:27 +0200
> Christophe Kerello <christophe.kerello@st.com> wrote:
> 
>>>> +- st,fmc2_timings: array of 8 bytes for NAND timings. The meanings of
>>>> +  these bytes are:
>>>> +  byte 0 TCLR      : CLE to RE delay in number of AHB clock cycles, only 4 bits
>>>> +                     are valid. Zero means one clock cycle, 15 means 16 clock
>>>> +                     cycles.
>>>> +  byte 1 TAR       : ALE to RE delay, 4 bits are valid. Same format as TCLR.
>>>> +  byte 2 THIZ      : number of HCLK clock cycles during which the data bus is
>>>> +                     kept in Hi-Z (tristate) after the start of a write access.
>>>> +                     Only valid for write transactions. Zero means 1 cycle,
>>>> +                     255 means 256 cycles.
>>>> +  byte 3 TWAIT     : number of HCLK clock cycles to assert the command to the
>>>> +                     NAND flash in response to SMWAITn. Zero means 1 cycle,
>>>> +                     255 means 256 cycles.
>>>> +  byte 4 THOLD_MEM : common memory space timing
>>>> +                     number of HCLK clock cycles to hold the address (and data
>>>> +                     when writing) after the command deassertion. Zero means
>>>> +                     1 cycle, 255 means 256 cycles.
>>>> +  byte 5 TSET_MEM  : common memory space timing
>>>> +                     number of HCLK clock cycles to assert the address before
>>>> +                     the command is asserted. Zero means 1 cycle, 255 means 256
>>>> +                     cycles.
>>>> +  byte 6 THOLD_ATT : attribute memory space timing
>>>> +                     number of HCLK clock cycles to hold the address (and data
>>>> +                     when writing) after the command deassertion. Zero means
>>>> +                     1 cycle, 255 means 256 cycles.
>>>> +  byte 7 TSET_ATT  : attribute memory space timing
>>>> +                     number of HCLK clock cycles to assert the address before
>>>> +                     the command is asserted. Zero means 1 cycle, 255 means 256
>>>> +                     cycles.
>>>
>>> Let me review the driver but this array of timings is really
>>> suspicious. I am pretty sure you don't need it in the DT.
>>
>> "st,fmc2-timings" is an optional property that allow the end user to
>> overwrite the timings calculated by setup_data_interface callback. By
>> setting this property in the NAND flash memory device tree node, the end
>> user could have a better throughput. For NON ONFI SLC NAND, timing mode
>> 0 is often used.
> 
> Exactly the kind of tweaking I'd like to avoid. If the NAND is not ONFI,
> the vendor driver (nand_<manufacturer>.c) can overwrite
> chip->default_onfi_timing_mode, and if the ONFI timings modes are not
> exactly matching the NAND spec and you need the exact timings, then we
> should consider adding a manufacturer hook to let the manufacturer
> driver tweak the timings. In any case, I'm not willing to accept
> timings description in the DT.
> 

Ok, I understand the way it should work. This property will be removed 
from the device tree bindings and the timings will be only calculated by 
calling setup_data_interface callback in the driver.

Regards,
Christophe Kerello.

> Regards,
> 
> Boris
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
