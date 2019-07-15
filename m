From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: stm32: add syscfg to ADC on stm32mp157c
Date: Mon, 15 Jul 2019 09:01:05 +0200
Message-ID: <c69cff23-b67e-2aed-f250-c237e9cd4a3d@st.com>
References: <1562148496-26789-1-git-send-email-fabrice.gasnier@st.com>
 <1562148496-26789-4-git-send-email-fabrice.gasnier@st.com>
 <20190714171310.1816afe3@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190714171310.1816afe3@archlinux>
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
To: Jonathan Cameron <jic23@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 7/14/19 6:13 PM, Jonathan Cameron wrote:
> On Wed, 3 Jul 2019 12:08:16 +0200
> Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
> 
>> On stm32mp157c, the ADC inputs are multiplexed with analog switches which
>> have reduced performances when their supply is below 2.7V (vdda by
>> default).
>> Add syscfg registers that can be used on stm32mp157c, to get full ADC
>> analog performances.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> I've applied the patches using this on the assumption this will go via
> the usual SoC route.
> 
> Thanks,

Hi Jonathan,

Many thanks,
Fabrice

> 
> Jonathan
> 
>> ---
>>  arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
>> index 2dd5162..b9a5b58 100644
>> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
>> @@ -862,6 +862,7 @@
>>  			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
>>  			clock-names = "bus", "adc";
>>  			interrupt-controller;
>> +			st,syscfg = <&syscfg>;
>>  			#interrupt-cells = <1>;
>>  			#address-cells = <1>;
>>  			#size-cells = <0>;
> 
