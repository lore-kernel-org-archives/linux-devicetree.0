From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 2/3] dts: Updated devicetree bindings for Zynq 7000 platform
Date: Tue, 13 Oct 2015 19:50:56 -0700
Message-ID: <CAAtXAHfRt-6+Hs=DTUDg1_2vxHo213ut_DWgH8Uq2xMuRp+e_A@mail.gmail.com>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
	<1444344307-22509-3-git-send-email-moritz.fischer@ettus.com>
	<561B7E3C.4060908@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <561B7E3C.4060908@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Rob Herring <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi Michal,

On Mon, Oct 12, 2015 at 2:32 AM, Michal Simek <michal.simek@xilinx.com> wrote:
> On 10/09/2015 12:45 AM, Moritz Fischer wrote:
>> Added addtional bindings required for FPGA Manager operation
>> of the Xilinx Zynq Devc configuration interface.
>>
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>> ---
>>  arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
>> index dc0457e..1a5220e 100644
>> --- a/arch/arm/boot/dts/zynq-7000.dtsi
>> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
>> @@ -294,6 +294,11 @@
>>               devcfg: devcfg@f8007000 {
>>                       compatible = "xlnx,zynq-devcfg-1.0";
>>                       reg = <0xf8007000 0x100>;
>> +                     interrupt-parent = <&intc>;
>> +                     interrupts = <0 8 4>;
>> +                     clocks = <&clkc 12>;
>> +                     clock-names = "ref_clk";
>> +                     syscon = <&slcr>;
>>               };
>>
>>               global_timer: timer@f8f00200 {
>>
>
> This patch should go via arm-soc tree. That's why please remove it from
> this patchset.

Just to clarify, you want this as a separate patch?

>
> Thanks,
> Michal

Cheers,

Moritz
