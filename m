From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 5/6] Documentation: dt: soc: add Keystone Navigator
 DMA bindings
Date: Wed, 7 May 2014 10:22:46 -0400
Message-ID: <536A41B6.2090202@ti.com>
References: <1398296783-1176-1-git-send-email-santosh.shilimkar@ti.com>	<1398296783-1176-6-git-send-email-santosh.shilimkar@ti.com> <CAL_Jsq+uZscamuezWsHrwf_OuxucXOG4kT8V9xCzmBnF9cpEXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+uZscamuezWsHrwf_OuxucXOG4kT8V9xCzmBnF9cpEXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 05 May 2014 12:17 PM, Rob Herring wrote:
> On Wed, Apr 23, 2014 at 6:46 PM, Santosh Shilimkar
> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
>> The Keystone Navigator DMA driver sets up the dma channels and flows for
>> the QMSS(Queue Manager SubSystem) who triggers the actual data movements
>> across clients using destination queues. Every client modules like
>> NETCP(Network Coprocessor), SRIO(Serial Rapid IO) and CRYPTO
>> Engines has its own instance of packet dma hardware. QMSS has also
>> an internal packet DMA module which is used as an infrastructure
>> DMA with zero copy.
>>
>> Initially this driver was proposed as DMA engine driver but since the
>> hardware is not typical DMA engine and hence doesn't comply with typical
>> DMA engine driver needs, that approach was naked. Link to that
>> discussion -
>>         https://lkml.org/lkml/2014/3/18/340
>>
>> As aligned, now we pair the Navigator DMA with its companion Navigator
>> QMSS subsystem driver.
>>
>> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
>> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Sandeep Nair <sandeep_n-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../bindings/soc/keystone-navigator-dma.txt        |  101 ++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/keystone-navigator-dma.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/keystone-navigator-dma.txt b/Documentation/devicetree/bindings/soc/keystone-navigator-dma.txt
>> new file mode 100644
>> index 0000000..4b7d9a7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/keystone-navigator-dma.txt
>> @@ -0,0 +1,101 @@
>> +Keystone Navigator DMA Controller
>> +
>> +This document explains the device tree bindings for the packet dma
>> +on keystone devices. The Keystone Navigator DMA driver sets up the dma
>> +channels and flows for the QMSS(Queue Manager SubSystem) who triggers
>> +the actual data movements across clients using destination queues. Every
>> +client modules like  NETCP(Network Coprocessor), SRIO(Serial Rapid IO),
>> +CRYPTO Engines etc has its own instance of dma hardware. QMSS has also
>> +an internal packet DMA module which is used as an infrastructure DMA
>> +with zero copy.
>> +
>> +Navigator DMA cloud layout:
>> +       ------------------
>> +       | Navigator DMAs |
>> +       ------------------
>> +               |
>> +               |-> DMA instance #0
>> +               |
>> +               |-> DMA instance #1
>> +                       .
>> +                       .
>> +               |
>> +               |-> DMA instance #n
>> +
>> +Navigator DMA properties:
>> +Required properties:
>> + - compatible: Should be "ti,keystone-navigator-dma"
>> + - clocks:     phandle to dma instances clocks
> 
> 2 clocks are in the example. Define how many clocks and the order.
>
Will do.
 
>> +
>> +DMA instance properties:
>> +Required properties:
>> + - reg: Should contain register location and length of the following dma
>> +       register regions. Register regions should be specified in the following
>> +       order.
>> +       - Global control register region (global).
>> +       - Tx DMA channel configuration register region (txchan).
>> +       - Rx DMA channel configuration register region (rxchan).
>> +       - Tx DMA channel Scheduler configuration register region (txsched).
>> +       - Rx DMA flow configuration register region (rxflow).
>> + - qm-base-address: Base address of the logical queue managers for dma.
> 
> Why is this not part of reg?
>
Actually these are the QMSS address values needs to be programmed in DMA
registers. I will extract this info from QMSS phandle to make it clear in next
version.
 
>> + - #dma-cells: Has to be 1. Keystone DMA doesn't support anything else.
> 
> So this uses the common DMA binding?
> 
Its just left over from last version. I will remove it.

>> +
>> +Optional properties:
>> + - reg-names: Names for the register regions.
>> + - enable-all: Enable all DMA channels.
> 
> vs. none of them?
vs clients opening specific channels what they need. This property is
useful for the userspace fast path case where the linux drivers enables
the channels used by userland stack. Sorry for not being clear.

> 
>> + - loop-back: To loopback Tx streaming I/F to Rx streaming I/F. Used for
>> +             infrastructure transfers.
>> + - rx-retry-timeout: Number of dma cycles to wait before retry on buffer
>> +                    starvation.
> 
> Prefix these with "ti,"
> 
Will do.

>> +Example:
>> +
>> +       knav_dmas: knav_dmas@0 {
>> +               compatible = "ti,keystone-navigator-dma";
>> +               clocks = <&papllclk>, <&clkxge>;
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               ranges;
>> +
>> +               dma_gbe {
>> +                       dma-id = <0>;
> 
> This is not documented in the above binding.
> 
>> +                       reg = <0x2004000 0x100>,
>> +                                 <0x2004400 0x120>,
>> +                                 <0x2004800 0x300>,
>> +                                 <0x2004c00 0x120>,
>> +                                 <0x2005000 0x400>;
>> +                       reg-names = "global", "txchan", "rxchan",
>> +                                       "txsched", "rxflow";
>> +
>> +                       qm-base-address = <0x23a80000 0x23a90000
>> +                                          0x23aa0000 0x23ab0000>;
>> +               };
>> +
>> +               dma_xgbe {
>> +                       dma-id = <1>;
>> +                       reg = <0x2fa1000 0x100>,
>> +                               <0x2fa1400 0x200>,
>> +                               <0x2fa1800 0x200>,
>> +                               <0x2fa1c00 0x200>,
>> +                               <0x2fa2000 0x400>;
>> +                       reg-names = "global", "txchan", "rxchan",
>> +                                       "txsched", "rxflow";
>> +
>> +                       qm-base-address = <0x23a80000 0x23a90000
>> +                                          0x23aa0000 0x23ab0000>;
> 
> The same address as above is correct here?
>
It is correct. I will extract this information from QMSS phandle
to avoid confusion.
 
>> +               };
>> +       };
>> +
>> +Navigator DMA client:
>> +Required properties:
>> +- dma-id:      DMA instance number
> 
> How is this used? It is to match with the above "DMA Instance"? Can
> you use phandles?
> 
Yes to match the 'DMA instance'. Phandle is good idea. I will use that.

> The use of DMA client and DMA instance are not very clear.
> 
>> +- rx-channel:  DMA receive channel number
>> +- tx-channel:  DMA transmit channel number
> 
> These could be args to a phandle.
> 
Yep.

Thanks for the detailed review. Can you please give your feedback on
PATCH 3/6 which addresses your previous comments. You indicated that
you might have more comments apart from what you already gave on
previous version.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
