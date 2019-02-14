From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 0/4] Add nvmem support on STM32
Date: Thu, 14 Feb 2019 11:36:11 +0100
Message-ID: <46ae9e00-1cf6-0ac9-eb9d-540eae7c621b@st.com>
References: <1548866336-14765-1-git-send-email-fabrice.gasnier@st.com>
 <4aaa83b2-35a6-e2c2-a3f4-6579b5d67038@st.com>
 <46a59513-a322-1e14-41b5-ecbd4c478286@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <46a59513-a322-1e14-41b5-ecbd4c478286@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/13/19 11:34 AM, Srinivas Kandagatla wrote:
> 
> 
> On 13/02/2019 10:15, Fabrice Gasnier wrote:
>> On 1/30/19 5:38 PM, Fabrice Gasnier wrote:
>>> Non volatile memory area is available on STM32. It contains various
>>> factory programmed information such as unique device ID, analog
>>> calibration...
>>> This patchset adds NVMEM support to access these data.
>>
>> Hello,
>>
>> Gentle reminder for this new driver review
> Nvmem provider driver itself looks fine for me, but I am unable to take
> this as 5.1 material, as I normally take nvmem patches which are
> reviewed and ready before rc5.
> 

Hi Srini,
Thanks for the feedback.

> dt bindings patch needs an ack from DT maintainers.

I hope Rob cant take a look at it.

Best Regards,
Fabrice

> 
> Thanks,
> srini
>>
>> Best Regards,
>> Fabrice
>>
>>>
>>> Fabrice Gasnier (4):
>>>    dt-bindings: nvmem: Add STM32 factory-programmed romem
>>>    nvmem: Add driver for STM32 factory-programmed read only mem
>>>    nvmem: stm32: add support for STM32MP15 BSEC to control OTP data
>>>    ARM: dts: stm32: Add romem and temperature calibration on stm32mp157c
>>>
>>>   .../devicetree/bindings/nvmem/st,stm32-romem.txt   |  31 ++++
>>>   arch/arm/boot/dts/stm32mp157c.dtsi                 |  13 ++
>>>   drivers/nvmem/Kconfig                              |  10 +
>>>   drivers/nvmem/Makefile                             |   2 +
>>>   drivers/nvmem/stm32-romem.c                        | 202
>>> +++++++++++++++++++++
>>>   5 files changed, 258 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
>>>   create mode 100644 drivers/nvmem/stm32-romem.c
>>>
