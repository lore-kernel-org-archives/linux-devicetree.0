From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v4 2/6] arm: dts: socfpga: add altera fpga manager
Date: Thu, 11 Dec 2014 09:56:18 +0100
Message-ID: <d9903a1dee0343c083dc7ec04a70ff99@BN1BFFO11FD015.protection.gbl>
References: <1418156090-23578-1-git-send-email-atull@opensource.altera.com>
 <1418156090-23578-3-git-send-email-atull@opensource.altera.com>
 <20141210150109.GA23358@pengutronix.de>
 <alpine.DEB.2.02.1412101123530.25868@linuxheads99>
 <20141210174945.GC23358@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141210174945.GC23358@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, atull <atull@opensource.altera.com>
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvand
List-Id: devicetree@vger.kernel.org

On 12/10/2014 06:49 PM, Steffen Trumtrar wrote:
> On Wed, Dec 10, 2014 at 11:25:59AM -0600, atull wrote:
>> On Wed, 10 Dec 2014, Steffen Trumtrar wrote:
>>
>>> Hi!
>>>
>>> On Tue, Dec 09, 2014 at 02:14:46PM -0600, atull@opensource.altera.com wrote:
>>>> From: Alan Tull <atull@opensource.altera.com>
>>>>
>>>> Add Altera FGPA manager to device tree.
>>>>
>>>> Signed-off-by: Alan Tull <atull@opensource.altera.com>
>>>> ---
>>>>  arch/arm/boot/dts/socfpga.dtsi |   10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
>>>> index 4472fd9..bab98b6 100644
>>>> --- a/arch/arm/boot/dts/socfpga.dtsi
>>>> +++ b/arch/arm/boot/dts/socfpga.dtsi
>>>> @@ -751,5 +751,15 @@
>>>>  			compatible = "altr,sys-mgr", "syscon";
>>>>  			reg = <0xffd08000 0x4000>;
>>>>  		};
>>>> +
>>>> +		hps_0_fpgamgr: fpgamgr@0xff706000 {
>>>> +			compatible = "altr,fpga-mgr", "simple-bus";
>>>> +			reg = <0xFF706000 0x1000
>>>> +			       0xFFB90000 0x1000>;
>>>> +			interrupts = <0 175 4>;
>>>> +			#address-cells = <1>;
>>>> +			#size-cells = <1>;
>>>> +			ranges;
>>>> +		};
>>>
>>> The fpgamgr is NOT a bus. You don't need ranges and/or simple-bus.
>>>
>>> Regards,
>>> Steffen
>>
>> Actually, I am going to be using this when I add the DT notification 
>> stuff.  That stuff is waiting for DT overlays to show up in the main
>> tree.
>>
>> So the choice it to either change this file now, once, or do the minimal 
>> changes and have to change it again later.
>>
> 
> Yes, that is what I thought. And still, devices can NOT show up
> at the fpgamgr. They show up on the various bridges.
> 
> And as far as I understand the DT overlay stuff, you specify in
> the overlay what the parent node will be.
> For i2c this is one of the i2c-hosts, for spi one of the spi-hosts
> and for IP cores in a bitstream one of the bridges.
> 
> The fpgamgr is, from my understanding, only responsible for writing
> the bitstream to the FPGA; nothing more.

+1 on this.
I think you can easily decide later where DT overlays will be added.

Thanks,
Michal
