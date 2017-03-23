From: Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt: bindings: fpga: add xilinx slave-serial
 binding description
Date: Thu, 23 Mar 2017 18:56:16 -0500
Message-ID: <CANk1AXS2FaSf3om3+HfKGd3uZ=hCXBz7Stj1KYVyH8eKYKoddg@mail.gmail.com>
References: <1488300022-30150-1-git-send-email-agust@denx.de>
 <1488300022-30150-2-git-send-email-agust@denx.de> <10677530-3c57-d3d9-ae9d-e29a6fcf4de7@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10677530-3c57-d3d9-ae9d-e29a6fcf4de7-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 16, 2017 at 6:01 AM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> On 28.2.2017 17:40, Anatolij Gustschin wrote:
>> Add dt binding documentation details for Xilinx FPGA configuration
>> over slave serial interface.
>>
>> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
>> Acked-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> Changes in v4:
>>
>>  - add Acked-by tags
>>
>> Changes in v3:
>>
>>  - extend example to show the usage in SPI master node, connected
>>    to the fpga-region node
>>
>> Changes in v2:
>>
>>  - correct gpios properties in example to match above description
>>
>>  - use fpga-mgr@0 instead of fpga-spi@0 in example
>>
>>  .../bindings/fpga/xilinx-slave-serial.txt          | 44 ++++++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
>>
>> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
>> new file mode 100644
>> index 0000000..9766f74
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
>> @@ -0,0 +1,44 @@
>> +Xilinx Slave Serial SPI FPGA Manager
>> +
>> +Xilinx Spartan-6 FPGAs support a method of loading the bitstream over
>> +what is referred to as "slave serial" interface.
>> +The slave serial link is not technically SPI, and might require extra
>> +circuits in order to play nicely with other SPI slaves on the same bus.
>> +
>> +See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf
>> +
>> +Required properties:
>> +- compatible: should contain "xlnx,fpga-slave-serial"
>> +- reg: spi chip select of the FPGA
>> +- prog_b-gpios: config pin (referred to as PROGRAM_B in the manual)
>> +- done-gpios: config status pin (referred to as DONE in the manual)
>> +
>> +Example for full FPGA configuration:
>> +
>> +     fpga-region0 {
>> +             compatible = "fpga-region";
>> +             fpga-mgr = <&fpga_mgr_spi>;
>> +             #address-cells = <0x1>;
>> +             #size-cells = <0x1>;
>> +     };
>> +
>> +     spi1: spi@10680 {
>> +             compatible = "marvell,armada-xp-spi", "marvell,orion-spi";
>> +             pinctrl-0 = <&spi0_pins>;
>> +             pinctrl-names = "default";
>> +             #address-cells = <1>;
>> +             #size-cells = <0>;
>> +             cell-index = <1>;
>> +             interrupts = <92>;
>> +             clocks = <&coreclk 0>;
>> +             status = "okay";
>> +
>> +             fpga_mgr_spi: fpga-mgr@0 {
>> +                     compatible = "xlnx,fpga-slave-serial";
>> +                     spi-max-frequency = <60000000>;
>> +                     spi-cpha;
>> +                     reg = <0>;
>> +                     done-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
>> +                     prog_b-gpios = <&gpio0 29 GPIO_ACTIVE_LOW>;
>> +             };
>> +     };
>>
>
> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Acked-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>
> Thanks,
> Michal
>
> --
> Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
> w: www.monstr.eu p: +42-0-721842854
> Maintainer of Linux kernel - Xilinx Microblaze
> Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
> U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP SoCs
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
