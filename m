From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/3] ARM: configs: stm32: Enable ARM_MPU
Date: Tue, 27 Feb 2018 18:11:25 +0100
Message-ID: <64b2e6b6-4d91-5dd7-be10-276f0b9d0ea3@st.com>
References: <1513101746-18030-1-git-send-email-alexandre.torgue@st.com>
 <1513101746-18030-3-git-send-email-alexandre.torgue@st.com>
 <5d8f2c2f-ca2e-632e-bac6-29299dda724e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5d8f2c2f-ca2e-632e-bac6-29299dda724e@arm.com>
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
To: Vladimir Murzin <vladimir.murzin@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patrice.chotard@st.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Vlad

On 12/13/2017 11:11 AM, Vladimir Murzin wrote:
> On 12/12/17 18:02, Alexandre Torgue wrote:
>> STM32 MCUs embed a Memory Protection Unit. Enabling this setting will
>> allow the Kernel to configure the MPU according to devicetree.
> 
> Would it be better to "select ARM_MPU" for machines with Cortex-M7?

Sorry for this late answer. You are right I will use a "select" only for 
stm32f7 and stm32h7 machines in mach-stm32/Kconfig.

Regards
Alex

> 
> Vladimir
> 
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>
>> diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
>> index bb358ff..e642bdf9 100644
>> --- a/arch/arm/configs/stm32_defconfig
>> +++ b/arch/arm/configs/stm32_defconfig
>> @@ -24,6 +24,7 @@ CONFIG_SET_MEM_PARAM=y
>>   CONFIG_DRAM_BASE=0x90000000
>>   CONFIG_FLASH_MEM_BASE=0x08000000
>>   CONFIG_FLASH_SIZE=0x00200000
>> +CONFIG_ARM_MPU=y
>>   CONFIG_PREEMPT=y
>>   # CONFIG_ATAGS is not set
>>   CONFIG_ZBOOT_ROM_TEXT=0x0
>>
> 
