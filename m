From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 2/2] dt-bindings: iio: update STM32 timers clock names
Date: Wed, 14 Jun 2017 17:16:19 +0200
Message-ID: <dcd26219-e711-1ff1-4083-69d3d86139f6@st.com>
References: <1496993874-9870-1-git-send-email-fabrice.gasnier@st.com>
 <1496993874-9870-3-git-send-email-fabrice.gasnier@st.com>
 <CA+M3ks4z46rPmjBt=pfJQBBjr5Hr7Oj4P=tv5wjo9WB_Ca_vsA@mail.gmail.com>
 <20170611122009.37ed409b@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170611122009.37ed409b@kernel.org>
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
To: Jonathan Cameron <jic23@kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-iio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Benjamin GAIGNARD <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On 06/11/2017 01:20 PM, Jonathan Cameron wrote:
> On Fri, 9 Jun 2017 09:43:42 +0200
> Benjamin Gaignard <benjamin.gaignard@linaro.org> wrote:
> 
>> 2017-06-09 9:37 GMT+02:00 Fabrice Gasnier <fabrice.gasnier@st.com>:
>>> Clock name has been updated during driver/DT binding review:
>>> https://lkml.org/lkml/2016/12/13/718
>>> Update DT binding doc to reflect this.
>>>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Same fixes tag as previous as this is an example of the binding for the
> mfd rather than actually part of the IIO binding.
> 
> Fixes: d0f949e220fd ("mfd: Add STM32 Timers driver")
> Acked-by: Jonathan Cameron <jic23@kernel.org>
> 
> I'm assuming Rob / Mark or Lee will pick this up.  If people
> do want it to go through the IIO tree let me know.

Hi Jonathan, all,

I just sent an updated version with Fixes tag.
I also missed pwm dt-binding in v1. I added it in V2.

Thanks for reviewing,
Best Regards,
Fabrice

> 
> Jonathan
>>> ---
>>>  Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
>>> index 55a653d..6abc755 100644
>>> --- a/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
>>> +++ b/Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt
>>> @@ -14,7 +14,7 @@ Example:
>>>                 compatible = "st,stm32-timers";
>>>                 reg = <0x40010000 0x400>;
>>>                 clocks = <&rcc 0 160>;
>>> -               clock-names = "clk_int";
>>> +               clock-names = "int";
>>>
>>>                 timer@0 {
>>>                         compatible = "st,stm32-timer-trigger";
>>> --
>>> 1.9.1
>>>  
>> Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
