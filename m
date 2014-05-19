From: Thor Thayer <tthayer.linux@gmail.com>
Subject: Re: [PATCHv5 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM controller
Date: Mon, 19 May 2014 13:36:30 -0500
Message-ID: <CAF03EBfOrBWsGVkwYHQt9Pm858LtkgUThkM6dFjksa93ETo_bw@mail.gmail.com>
References: <1400169891-29546-1-git-send-email-tthayer@altera.com>
	<1400169891-29546-2-git-send-email-tthayer@altera.com>
	<20140516075344.GF949@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140516075344.GF949@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Thor Thayer <tthayer@altera.com>, Rob Herring <robherring2@gmail.com>, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, linux@arm.linux.org.uk, Dinh Nguyen <dinguyen@altera.com>, dougthompson@xmission.com, Grant Likely <grant.likely@linaro.org>, Borislav Petkov <bp@alien8.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 16, 2014 at 2:53 AM, Steffen Trumtrar
<s.trumtrar@pengutronix.de> wrote:
> Hi!
>
> On Thu, May 15, 2014 at 11:04:49AM -0500, tthayer@altera.com wrote:
>> From: Thor Thayer <tthayer@altera.com>
>>
>> Addition of the Altera SDRAM controller bindings and device
>> tree changes to the Altera SoC project.
>>
>> v2: Changes to SoC SDRAM EDAC code.
>>
>> v3: Implement code suggestions for SDRAM EDAC code.
>>
>> v4: Remove syscon from SDRAM controller bindings.
>>
>> v5: No Change, bump version for consistency.
>>
>> Signed-off-by: Thor Thayer <tthayer@altera.com>
>> ---
>>  .../bindings/arm/altera/socfpga-sdram.txt          |   11 +++++++++++
>>  arch/arm/boot/dts/socfpga.dtsi                     |    5 +++++
>>  2 files changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
>> new file mode 100644
>> index 0000000..8f8746b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
>> @@ -0,0 +1,11 @@
>> +Altera SOCFPGA SDRAM Controller
>> +
>> +Required properties:
>> +- compatible : "altr,sdr-ctl";
>> +- reg : Should contain 1 register ranges(address and length)
>> +
>> +Example:
>> +     sdrctl@ffc25000 {
>> +             compatible = "altr,sdr-ctl";
>> +             reg = <0xffc25000 0x1000>;
>> +     };
>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>> index df43702..6ce912e 100644
>> --- a/arch/arm/boot/dts/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>> @@ -676,6 +676,11 @@
>>                       clocks = <&l4_sp_clk>;
>>               };
>>
>> +             sdrctl@ffc25000 {
>> +                     compatible = "altr,sdr-ctl", "syscon";
>                                                    ^^^^^^^^^^
>
> Get rid of that, too, please.

Hi Steffan,

I believe I need to keep the "syscon". The same register (ctrlcfg)
that has the ECC enable bitfield also includes the DRAM configuration
bitfields that other drivers will want to access (specifically the
FPGA bridge needs this information). Since this register will be
shared between drivers,  syscon seems like the best solution.

I may be misunderstanding something so feel free to elaborate. Thanks
for reviewing.

Thor


>> +                     reg = <0xffc25000 0x1000>;
>> +             };
>> +
>
> How about
>
>                 sdrctl@ffc25000 {
>                         compatible = "altr,sdr-ctl";
>                         reg = <0xffc25000 0x1000>;
>                         ranges;
>
>                         edac@ffc2502c {
>                                 compatible = "altr,sdram-edac";
>                                 reg = <0xffc2502c 0x50>;
>                                 interrupts = <0 39 4>;
>                         };
>                 };
>
> Then we can later add:
>
>                         sdr-ports: ports@ffc2507c {
>                                 #reset-cells = <1>;
>                                 compatible = "altr,sdr-ports";
>                                 reg = <0xffc2507c 0x10>;
>                                 clocks = <&ddr_dqs_clk>;
>                                 ...
>                         };
>
> to use the reset-controller framework for the port resets.
>
>>               rstmgr@ffd05000 {
>>                       compatible = "altr,rst-mgr";
>>                       reg = <0xffd05000 0x1000>;
>> --
>
> Regards,
> Steffen
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
