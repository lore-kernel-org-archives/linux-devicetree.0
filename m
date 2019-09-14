From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
Date: Sat, 14 Sep 2019 17:50:55 +0200
Message-ID: <2d812f08-cacb-2ef2-8073-f03a22ec4033@gmail.com>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
 <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqL47dQT-P78j4Ph61fsgA45Ha0AJjDajiMk52yFj++s+g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On 9/13/19 5:14 PM, Rob Herring wrote:
> On Sat, Sep 7, 2019 at 5:16 PM <marek.vasut@gmail.com> wrote:
>>
>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>
>> Add dma-ranges property into /soc node to describe the DMA capabilities
>> of the bus. This is currently needed to translate PCI DMA ranges, which
>> are limited to 32bit addresses.
> 
> FYI, I've started working on this problem and issues around
> dma-ranges/dma_mask. Hopefully I'll get some patches out next week.

Thanks

>> ---
>> NOTE: This is needed for the following patches to work correctly:
>>       https://patchwork.ozlabs.org/patch/1144870/
>>       https://patchwork.ozlabs.org/patch/1144871/
> 
> First I'm seeing those... Well, I do have v7 from 2+ years ago...

Right, this issue was dragging on for a very long time.

> Not sure if these take into account the new dma_bus_mask, but that
> should simplify solving the issue.

What's that about ?

>> ---
>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> index 95deff66eeb6..2102140a6723 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
>> @@ -330,6 +330,7 @@
>>                 #address-cells = <2>;
>>                 #size-cells = <2>;
>>                 ranges;
>> +               dma-ranges = <0 0x40000000 0 0x40000000 0 0xc0000000>;
> 
> Is the limitation in the bus or the PCI bridge or both? The commit
> message sounds like it's the PCI bridge in which case this is wrong
> (or incomplete).

I believe it is the PCI bridge too.

> 'dma-ranges' should be on the bus node where the
> restriction/translation exists. For PCI devices, that's the PCI bridge
> node. So a 32-bit only PCI bridge should have a dma-ranges size of
> 4GB. If the SoC bus has more restrictions, then that should be in the
> PCI bridge parent assuming that restriction also applies to other
> devices.

Would that mean the dma-ranges for /soc/pcie@fe000000/ [1], which is
already present in the DTSi, is the one that should be used to determine
the controller limitations ?

[1]
https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm64/boot/dts/renesas/r8a7795.dtsi#L2653

-- 
Best regards,
Marek Vasut
