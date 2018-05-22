From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: stm32: Add ADC support to stm32mp157c
Date: Tue, 22 May 2018 17:51:04 +0200
Message-ID: <cf74dc2b-ba17-be3d-b3ca-7cda515bf7a6@st.com>
References: <1525247091-18143-1-git-send-email-fabrice.gasnier@st.com>
 <1525247091-18143-4-git-send-email-fabrice.gasnier@st.com>
 <20180507182317.7406c682@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180507182317.7406c682@archlinux>
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
To: Jonathan Cameron <jic23@kernel.org>, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjamin.gaignard@linaro.org, lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/07/2018 07:23 PM, Jonathan Cameron wrote:
> On Wed, 2 May 2018 09:44:51 +0200
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> 
>> stm32mp157c has an ADC block with two physical ADCs.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> The driver support is now queued up in the IIO tree and should
> be in Linux next later this week.

Hi,

Many Thanks Jonathan :-)

Alex, I just sent an updated version (v3) of this patch (with additional
dmas).

Best Regards,
Fabrice

> 
> Thanks,
> 
> Jonathan
> 
>> ---
>>  arch/arm/boot/dts/stm32mp157c.dtsi | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
>> index bc3eddc..7758a90 100644
>> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
>> @@ -160,6 +160,38 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		adc: adc@48003000 {
>> +			compatible = "st,stm32mp1-adc-core";
>> +			reg = <0x48003000 0x400>;
>> +			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
>> +			clock-names = "bus", "adc";
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			status = "disabled";
>> +
>> +			adc1: adc@0 {
>> +				compatible = "st,stm32mp1-adc";
>> +				#io-channel-cells = <1>;
>> +				reg = <0x0>;
>> +				interrupt-parent = <&adc>;
>> +				interrupts = <0>;
>> +				status = "disabled";
>> +			};
>> +
>> +			adc2: adc@100 {
>> +				compatible = "st,stm32mp1-adc";
>> +				#io-channel-cells = <1>;
>> +				reg = <0x100>;
>> +				interrupt-parent = <&adc>;
>> +				interrupts = <1>;
>> +				status = "disabled";
>> +			};
>> +		};
>> +
>>  		rcc: rcc@50000000 {
>>  			compatible = "st,stm32mp1-rcc", "syscon";
>>  			reg = <0x50000000 0x1000>;
> 
