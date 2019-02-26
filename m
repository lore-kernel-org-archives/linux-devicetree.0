From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: Add STM32 factory-programmed romem
Date: Tue, 26 Feb 2019 10:14:00 +0100
Message-ID: <d2473029-76a7-de2c-8ff5-9d065577f0b1@st.com>
References: <1548866336-14765-1-git-send-email-fabrice.gasnier@st.com>
 <1548866336-14765-2-git-send-email-fabrice.gasnier@st.com>
 <20190225165307.GA26260@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190225165307.GA26260@bogus>
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
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, lionel.debieve@st.com, alexandre.torgue@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2/25/19 5:53 PM, Rob Herring wrote:
> On Wed, Jan 30, 2019 at 05:38:53PM +0100, Fabrice Gasnier wrote:
>> Add documentation for STMicroelectronics STM32 Factory-programmed
>> read only memory area.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> ---
>>  .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
>> new file mode 100644
>> index 0000000..fbff52e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
>> @@ -0,0 +1,31 @@
>> +STMicroelectronics STM32 Factory-programmed data device tree bindings
>> +
>> +This represents STM32 Factory-programmed read only non-volatile area: locked
>> +flash, OTP, read-only HW regs... This contains various information such as:
> 
> Several distinct types here. Does s/w need to know the difference 
> rather than just one generic-ish compatible? Access size restrictions 
> maybe? Ability to unlock and program?

Hi Rob,

The reading part is represented here as "st,stm32-romem" compatible, to
simply handle read only access. I agree this could be a generic-ish.

BUT the specifics are regarding the ability to unlock/lock and program.
Access size can vary from one part to another (e.g. on stm32f4,
reference manual sates: OTP area is divided into 16 OTP data blocks of
32 bytes. on stm32f7, OTP area is divided into 16 OTP data blocks of 64
bytes.)

In STM32MP15, both the read & write access through the BSEC are
specific, represented by dedicated compatible.

Do you wish I update the compatible to something like:
"st,stm32f4-otp"
"st,stm32mp15-bsec"
?

Thanks for reviewing,
Best regards,
Fabrice

> 
> If not, then why even make this stm32 specific?
> 
>> +analog calibration data for temperature sensor (e.g. TS_CAL1, TS_CAL2),
>> +internal vref (VREFIN_CAL), unique device ID...
>> +
>> +Required properties:
>> +- compatible:		Should be one of:
>> +			"st,stm32-romem"
>> +			"st,stm32mp15-bsec"
>> +- reg:			Offset and length of factory-programmed area.
>> +- #address-cells:	Should be '<1>'.
>> +- #size-cells:		Should be '<1>'.
>> +
>> +Optional Data cells:
>> +- Must be child nodes as described in nvmem.txt.
>> +
>> +Example on stm32f4:
>> +	romem: nvmem@1fff7800 {
>> +		compatible = "st,stm32-romem";
>> +		reg = <0x1fff7800 0x400>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +
>> +		/* Data cells: ts_cal1 at 0x1fff7a2c */
>> +		ts_cal1: calib@22c {
>> +			reg = <0x22c 0x2>;
>> +		};
>> +		...
>> +	};
>> -- 
>> 1.9.1
>>
