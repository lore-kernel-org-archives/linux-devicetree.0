From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: ARC dw-mshc binding compat string
Date: Sat, 26 Mar 2016 20:16:09 +0200
Message-ID: <56F6D1E9.3050606@mentor.com>
References: <56F66121.8050507@denx.de> <56F6C639.5000301@mentor.com>
 <56F6C71B.6070002@denx.de> <56F6CC68.5040408@mentor.com>
 <56F6D083.1020402@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56F6D083.1020402@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexey Brodkin <abrodkin@synopsys.com>
List-Id: devicetree@vger.kernel.org

On 26.03.2016 20:10, Marek Vasut wrote:
> On 03/26/2016 06:52 PM, Vladimir Zapolskiy wrote:
>> Hi Marek,
>>
>> On 26.03.2016 19:30, Marek Vasut wrote:
>>> On 03/26/2016 06:26 PM, Vladimir Zapolskiy wrote:
>>>> On 26.03.2016 12:14, Marek Vasut wrote:
>>>>> Hi!
>>>>>
>>>>> I noticed that arch/arc/boot/dts/axs10x_mb.dtsi uses "altr," prefix in
>>>>> the DT compatible string:
>>>>>
>>>>> mmc@0x15000 {
>>>>>         compatible = "altr,socfpga-dw-mshc";
>>>>>         reg = < 0x15000 0x400 >;
>>>>>         num-slots = < 1 >;
>>>>>         fifo-depth = < 16 >;
>>>>>         card-detect-delay = < 200 >;
>>>>>         clocks = <&apbclk>, <&mmcclk>;
>>>>>         clock-names = "biu", "ciu";
>>>>>         interrupts = < 7 >;
>>>>>         bus-width = < 4 >;
>>>>> };
>>>>>
>>>>> I don't think this is OK, since ARC is unrelated to Altera, which is
>>>>> what the "altr," prefix stands for. I think the socfpga-dw-mshc shim
>>>>> should be extended with another compatibility string, something like
>>>>> "snps,arc-dw-mshc" and the axs10x_mb.dtsi should be adjusted
>>>>> accordingly. What do you think ?
>>>>>
>>>>
>>>> There is "snps,dw-mshc" described in
>>>> Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt and supported by
>>>> dw_mmc host controller driver.
>>>
>>> Thanks, that's even better.
>>>
>>> btw what do you think of using altr, prefix on non-altera system, that
>>> doesn't seem ok, right ?
>>
>> according to ePAPR the prefix should represent a device (IP block here
>> I believe) manufacturer, so it should be okay to use "altr" prefix on
>> non-Altera system, if Altera provides  another hardware vendor with
>> some own IP block.
> 
> In this case, it's Synopsys who provides the SD/MMC/MS core to other
> chip makers (Altera etc).

Correct.

>> That said, I would rather prefer to see "snps,dw-mshc" prefix on description
>> of an MMC controller found on SoCFPGA series, "altr,socfpga-dw-mshc" seems
>> to be redundant.
> 
> According to drivers/mmc/host/dw_mmc-pltfm.c , the Altera SoCFPGA one
> "altr,socfpga-dw-mshc" and also Imagination Technology Pistacio one
> "img,pistachio-dw-mshc" need specialty bit (SDMMC_CMD_USE_HOLD_REG),
> while the stock one "snps,dw-mshc" does not. I am not sure if the ARC
> one needs it as well, but most likely yes.
> 
> I wonder if that bit is needed on some particular version of the DWMMC
> core. In that case, should we have "snps,dw-mshc" and "snps,dw-mshc-vN"
> binding ? Or should we use DT property to discern the need for this bit ?
> 

That's the most common way to take into account peculiarities, add
a property and handle it from the driver.
