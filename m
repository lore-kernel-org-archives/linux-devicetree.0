From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/12] ARM: dts: socfpga: add base fpga region and fpga bridges
Date: Thu, 5 Jan 2017 10:34:37 -0600
Message-ID: <CANk1AXRsrW1YHRPn4Rcv7Pu8jBUEcOmREOFYvvMV8D9eKLU-6g@mail.gmail.com>
References: <1483575694-29599-1-git-send-email-dinguyen@kernel.org>
 <1483575694-29599-11-git-send-email-dinguyen@kernel.org> <CANk1AXSbqohp73xHpp7e9-37d61ZB-dRAPAFc2eQGRYUnvB+0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANk1AXSbqohp73xHpp7e9-37d61ZB-dRAPAFc2eQGRYUnvB+0w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 5, 2017 at 10:28 AM, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Jan 4, 2017 at 6:21 PM, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> Add h2f and lwh2f bridges.
>> Add base FPGA Region to support DT overlays for FPGA programming.
>> Add l3regs.
>>
>> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>> Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/socfpga.dtsi | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>> index de29172..dccc281 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -93,6 +93,16 @@
>>                         };
>>                 };
>>
>> +               base_fpga_region {
>> +                       compatible = "fpga-region";
>> +                       fpga-mgr = <&fpgamgr0>;
>> +                       fpga-bridges = <&fpga_bridge0>, <&fpga_bridge1>;
>
> Hi Dinh,
>
> We want to get rid of the 'fpga-bridges' line.
>
>> +
>> +                       #address-cells = <0x1>;
>> +                       #size-cells = <0x1>;
>> +                       ranges = <0 0xff200000 0x100000>;
>
> Should get rid of the ranges line here too.  The 'fpga-bridges' and
> 'ranges' line can be added in the overlay.
>
> Alan
>
>> +               };
>> +
>>                 can0: can@ffc00000 {
>>                         compatible = "bosch,d_can";
>>                         reg = <0xffc00000 0x1000>;
>> @@ -513,6 +523,22 @@
>>                                 };
>>                 };
>>
>> +               fpga_bridge0: fpga_bridge@ff400000 {
>> +                       compatible = "altr,socfpga-lwhps2fpga-bridge";
>> +                       reg = <0xff400000 0x100000>;
>> +                       resets = <&rst LWHPS2FPGA_RESET>;
>> +                       reset-names = "lwhps2fpga";

The driver doesn't need 'reset-names' here or below for fpga_bridge1.

>> +                       clocks = <&l4_main_clk>;
>> +               };
>> +
>> +               fpga_bridge1: fpga_bridge@ff500000 {
>> +                       compatible = "altr,socfpga-hps2fpga-bridge";
>> +                       reg = <0xff500000 0x10000>;
>> +                       resets = <&rst HPS2FPGA_RESET>;
>> +                       reset-names = "hps2fpga";
>> +                       clocks = <&l4_main_clk>;
>> +               };
>> +
>>                 fpgamgr0: fpgamgr@ff706000 {
>>                         compatible = "altr,socfpga-fpga-mgr";
>>                         reg = <0xff706000 0x1000
>> @@ -694,6 +720,11 @@
>>                         arm,prefetch-offset = <7>;
>>                 };
>>
>> +               l3regs@0xff800000 {
>> +                       compatible = "altr,l3regs", "syscon";
>> +                       reg = <0xff800000 0x1000>;
>> +               };
>> +
>>                 mmc: dwmmc0@ff704000 {
>>                         compatible = "altr,socfpga-dw-mshc";
>>                         reg = <0xff704000 0x1000>;
>> --
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
