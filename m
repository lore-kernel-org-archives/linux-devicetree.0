From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 7/7] ARM: dts: stm32: Enable pwm1 and pwm3 for
 stm32f469-eval
Date: Fri, 20 Jan 2017 11:36:59 +0100
Message-ID: <eb886932-8c63-ac73-44e8-c886e51d07ff@st.com>
References: <1484832854-6314-1-git-send-email-fabrice.gasnier@st.com>
 <1484832854-6314-8-git-send-email-fabrice.gasnier@st.com>
 <451b28a0-6cf3-d75a-59a2-d4e2f8a7b373@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <451b28a0-6cf3-d75a-59a2-d4e2f8a7b373@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Torgue <alexandre.torgue@st.com>, jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

On 01/20/2017 11:19 AM, Alexandre Torgue wrote:
> Hi Fabrice
>
>
> On 01/19/2017 02:34 PM, Fabrice Gasnier wrote:
>> Define and enable pwm1 and pwm3, timers1 & 3 trigger outputs on
>> stm32f469-eval board.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>> ---
>
> Typo issue in commit header (stm32f469 --> stm32f429)
Hi Alexandre,

I'll fix this in next revision.
Tanks for reviewing.

BR,
Fabrice

>
>
>>  arch/arm/boot/dts/stm32429i-eval.dts | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts 
>> b/arch/arm/boot/dts/stm32429i-eval.dts
>> index 2181220..892100f 100644
>> --- a/arch/arm/boot/dts/stm32429i-eval.dts
>> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
>> @@ -171,3 +171,31 @@
>>      pinctrl-names = "default";
>>      status = "okay";
>>  };
>> +
>> +&timers1 {
>> +    status = "okay";
>> +
>> +    pwm {
>> +        pinctrl-0 = <&pwm1_pins>;
>> +        pinctrl-names = "default";
>> +        status = "okay";
>> +    };
>> +
>> +    timer@0 {
>> +        status = "okay";
>> +    };
>> +};
>> +
>> +&timers3 {
>> +    status = "okay";
>> +
>> +    pwm {
>> +        pinctrl-0 = <&pwm3_pins>;
>> +        pinctrl-names = "default";
>> +        status = "okay";
>> +    };
>> +
>> +    timer@2 {
>> +        status = "okay";
>> +    };
>> +};
>>
