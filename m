From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 3/6] tegra: fdt: Add NAND controller binding and
 definitions
Date: Tue, 31 Jul 2012 10:19:04 +0100
Message-ID: <CAPnjgZ2puWwHz+bq06P=Zy5+3D99FAaR=La9_QZtAW4F-vvOMQ@mail.gmail.com>
References: <1343631210-22278-1-git-send-email-sjg@chromium.org>
 <1343631210-22278-4-git-send-email-sjg@chromium.org>
 <50171331.8060708@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50171331.8060708-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Scott,

On Tue, Jul 31, 2012 at 12:05 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> On 07/30/2012 01:53 AM, Simon Glass wrote:
>> diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
>> index f95be58..d936b1e 100644
>> --- a/arch/arm/dts/tegra20.dtsi
>> +++ b/arch/arm/dts/tegra20.dtsi
>> @@ -204,4 +204,11 @@
>>               compatible = "nvidia,tegra20-kbc";
>>               reg = <0x7000e200 0x0078>;
>>       };
>> +
>> +     nand: nand-controller@70008000 {
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             compatible = "nvidia,tegra20-nand";
>> +             reg = <0x70008000 0x100>;
>> +     };
>>  };
>> diff --git a/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
>> new file mode 100644
>> index 0000000..86ae408
>> --- /dev/null
>> +++ b/doc/device-tree-bindings/nand/nvidia,tegra20-nand.txt
>> @@ -0,0 +1,53 @@
>> +NAND Flash
>> +----------
>> +
>> +(there isn't yet a generic binding in Linux, so this describes what is in
>> +U-Boot. There should not be Linux-specific or U-Boot specific binding, just
>> +a binding that describes this hardware. But agreeing a binding in Linux in
>> +the absence of a driver may be beyond my powers.)
>
> Please at least attempt to get a binding accepted in Linux, or perhaps
> in a neutral repository such as devicetree.org (but point out on
> devicetree-discuss that you've posted it there).  The device tree is
> supposed to describe the hardware, not what Linux currently uses.
>
>> +Example
>> +-------
>> +
>> +nand-controller@0x70008000 {
>> +     compatible = "nvidia,tegra20-nand";
>> +     #address-cells = <1>;
>> +     #size-cells = <0>;
>> +     nvidia,wp-gpios = <&gpio 59 0>;         /* PH3 */
>> +     nvidia,nand-width = <8>;
>> +     nvidia,timing = <26 100 20 80 20 10 12 10 70>;
>> +     nand@0 {
>> +             reg = <0>;
>> +             compatible = "hynix,hy27uf4g2b", "nand-flash";
>> +     };
>> +};
>
> Where is "reg" in the parent node?  You're not supposed to have a unit
> address without reg.   Also, most bus bindings don't put 0x in the unit
> address).
>
> I see that it's OK in the actual .dtsi -- it's just the example that
> needs fixing.

OK I will fix these and send a new patch.

Regards,
Simon

>
> -Scott
>
>
