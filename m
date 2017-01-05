From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv2 4/5] arm: mvebu: Add device tree for 98DX3236 SoCs
Date: Thu, 5 Jan 2017 20:10:34 +0000
Message-ID: <13295ed8de3442daa373d1f39ea8b5a5@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170105033641.6212-5-chris.packham@alliedtelesis.co.nz>
 <20170105135837.GC25333@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Mark Rutland <mark.rutland@arm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 06/01/17 02:59, Mark Rutland wrote:
> On Thu, Jan 05, 2017 at 04:36:40PM +1300, Chris Packham wrote:
>> +		internal-regs {
>> +			coreclk: mvebu-sar@18230 {
>> +				compatible = "marvell,mv98dx3236-core-clock";
>> +			};
>> +
>> +			cpuclk: clock-complex@18700 {
>> +				compatible = "marvell,mv98dx3236-cpu-clock";
>> +			};
>> +
>> +			corediv-clock@18740 {
>> +				compatible = "marvell,mv98dx3236-corediv-clock";
>> +				reg = <0xf8268 0xc>;
>> +				base = <&dfx>;
>> +				#clock-cells = <1>;
>> +				clocks = <&mainpll>;
>> +				clock-output-names = "nand";
>> +			};
>
> [...]
>
>> +		};
>> +
>> +		dfx-registers {
>> +			compatible = "simple-bus";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0 MBUS_ID(0x08, 0x00) 0 0x100000>;
>> +
>> +			dfx: dfx@0 {
>> +				compatible = "simple-bus";
>> +				reg = <0 0x100000>;
>> +			};
>> +		};
>
> What is this dfx-registers, exactly?

I've been trying to get that info out of Marvell for a while I'm not 
even sure what the "DFX" acronym stands for. The Armdada 38x also has a 
thing called "DFX" but it seems to be quite different to this one. From 
what I can tell it contains common elements used by both the CPU and 
switch chip so there are things related to clocking and IO pad 
configuration. It is necessary for both the switch and CPU to have a 
handle to access it.

> It has no children, so why is it a
> simple-bus?
>
> From the above, and the patch adding the corediv driver, it looks like
> the corediv-clock actually lives in this block, so I don't understand
> why the corediv-clock is sitting in internal-regs with a sideband
> reference to dfx.

Yeah I think the corediv-clock should be a child of this node. I'll move 
it there.

>
> Thanks,
> Mark.
>
