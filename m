From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: cavium: fix PCI bus dtc warnings
Date: Thu, 27 Jul 2017 21:15:17 -0500
Message-ID: <CAL_JsqLgPRQqWu=Fh-6EroHs64_M9Q8jWa20Hv=dGro62oR=XA@mail.gmail.com>
References: <20170726210943.6875-1-robh@kernel.org> <20170726210943.6875-7-robh@kernel.org>
 <20170728014304.GA6857@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170728014304.GA6857@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 8:43 PM, Jayachandran C
<jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Jul 26, 2017 at 04:09:43PM -0500, Rob Herring wrote:
>> dtc recently added PCI bus checks. Fix these warnings:
>>
>> arch/arm64/boot/dts/cavium/thunder2-99xx.dtb: Warning (pci_bridge): Node /pci missing bus-range for PCI bridge
>> arch/arm64/boot/dts/cavium/thunder2-99xx.dtb: Warning (unit_address_vs_reg): Node /pci has a reg or ranges property, but no unit name
>>
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>> v2:
>> - Reapply broadcom vulkan changes to thunder2.
>>
>>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
>> index 4220fbdcb24a..ea50c1320bf7 100644
>> --- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
>> +++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
>> @@ -98,7 +98,7 @@
>>               clock-output-names = "clk125mhz";
>>       };
>>
>> -     pci {
>> +     pci@30000000 {
>>               compatible = "pci-host-ecam-generic";
>>               device_type = "pci";
>>               #interrupt-cells = <1>;
>> @@ -118,6 +118,7 @@
>>               ranges =
>>                 <0x02000000    0 0x40000000    0 0x40000000    0 0x20000000
>>                  0x43000000 0x40 0x00000000 0x40 0x00000000 0x20 0x00000000>;
>> +             bus-range = <0 0xff>;
>>               interrupt-map-mask = <0 0 0 7>;
>>               interrupt-map =
>>                     /* addr  pin  ic   icaddr  icintr */
>
> Thanks for fixing this up.
>
> Acked-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>
> The unit name issue is there with memory node on thunder2-99xx.dts as well, I can fix
> this up if you are not planning to.

Please do. There are lots more warnings (tree wide) and I don't plan
to fix all of them.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
