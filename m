From: Jingchang Lu <jingchang.lu@freescale.com>
Subject: RE: [PATCHv5 1/6] ARM: dts: Add SoC level device tree support for
 LS1021A
Date: Tue, 21 Oct 2014 01:53:30 +0000
Message-ID: <da1e5200fc1f44e2b32d3c81beee168d@BL2PR03MB467.namprd03.prod.outlook.com>
References: <1413192963-11153-1-git-send-email-jingchang.lu@freescale.com>
 <1413192963-11153-2-git-send-email-jingchang.lu@freescale.com>
 <20141019013701.GC7869@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141019013701.GC7869@tiger>
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
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "chenhui.zhao@freescale.com" <chenhui.zhao@freescale.com>, "arnd@arndb.de" <arnd@arndb.de>, "shaveta@freescale.com" <shaveta@freescale.com>, Chao Fu <B44548@freescale.com>, Suresh Gupta <suresh.gupta@freescale.com>, "bhupesh.sharma@freescale.com" <bhupesh.sharma@freescale.com>, "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>, Ruchika Gupta <ruchika.gupta@freescale.com>, "nikhil.badola@freescale.com" <nikhil.badola@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Shawn Guo [mailto:shawn.guo@linaro.org]
>Sent: Sunday, October 19, 2014 9:37 AM
>To: Lu Jingchang-B35083
>Cc: arnd@arndb.de; mark.rutland@arm.com; linux-arm-
>kernel@lists.infradead.org; devicetree@vger.kernel.org; Lu Jingchang-
>B35083; Badola Nikhil-B46172; Zhao Chenhui-B35336; Gupta Suresh-B42813;
>Leekha Shaveta-B20052; Gupta Ruchika-R66431; Sharma Bhupesh-B45370; Fu
>Chao-B44548; Xiubo Li-B47053
>Subject: Re: [PATCHv5 1/6] ARM: dts: Add SoC level device tree support for
>LS1021A
>
>On Mon, Oct 13, 2014 at 05:35:58PM +0800, Jingchang Lu wrote:
>> +/ {
>> +	compatible = "fsl,ls1021a";
>> +	interrupt-parent = <&gic>;
>> +
>> +	aliases {
>> +		serial0 = &lpuart0;
>> +		serial1 = &lpuart1;
>> +		serial2 = &lpuart2;
>> +		serial3 = &lpuart3;
>> +		serial4 = &lpuart4;
>> +		serial5 = &lpuart5;
>> +		sysclk = &sysclk;
>
>What is this sysclk aliase used for?
The sysclk alias is used by dtb fixup stage in u-boot to set the proper clk frequency
for its configurable. The sysclk is compatible to "fixed-clock" but there may be more
than one "fixed-clock" source and only the sysclk is desired, so an alias is add to
located it exclusively. Thanks.

>
>> +		};
>
>Bad indent.
>
>> +
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu@f00 {
>> +			compatible = "arm,cortex-a7";
>> +			device_type = "cpu";
>> +			reg = <0xf00>;
>> +		};
>> +
>> +		cpu@f01 {
>> +			compatible = "arm,cortex-a7";
>> +			device_type = "cpu";
>> +			reg = <0xf01>;
>> +		};
>> +	};
>> +
>> +	timer {
>> +		compatible = "arm,armv7-timer";
>> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
>IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
>IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
>IRQ_TYPE_LEVEL_LOW)>,
>> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
>IRQ_TYPE_LEVEL_LOW)>;
>
>I like this indent style ...
>
>> +	};
>> +
>> +	pmu {
>> +		compatible = "arm,cortex-a7-pmu";
>> +		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
>> +				<GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
>
>... not this style.  Please fix such indents through the file.

I will, thanks.

Best Regards,
Jingchang

>
>> +	};
>
>Shawn
