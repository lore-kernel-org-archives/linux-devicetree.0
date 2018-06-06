From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v4 0/6] Enhance support for the SP805 WDT
Date: Wed, 6 Jun 2018 16:40:29 -0700
Message-ID: <79188fe9-1da3-94d2-ee1f-0c04d3aa9225@broadcom.com>
References: <1527530497-10392-1-git-send-email-ray.jui@broadcom.com>
 <e3f657f1-bd7e-cadb-9cfe-dee6cf8c1668@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e3f657f1-bd7e-cadb-9cfe-dee6cf8c1668@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 6/6/2018 12:29 PM, Florian Fainelli wrote:
> On 05/28/2018 11:01 AM, Ray Jui wrote:
>> This patch series enhances the support for the SP805 watchdog timer.
>> First of all, 'timeout-sec' devicetree property is added. In addition,
>> support is also added to allow the driver to reset the watchdog if it
>> has been detected that watchdot has been started in the bootloader. In
>> this case, the driver will initiate the ping service from the kernel
>> watchdog subsystem, before a user mode daemon takes over. This series
>> also enables SP805 in the default ARM64 defconfig
>>
>> This patch series is based off v4.17-rc5 and is available on GIHUB:
>> repo: https://github.com/Broadcom/arm64-linux.git
>> branch: sp805-wdt-v4
>>
>> Changes since v3:
>>   - Improve description of 'timeout-sec' in the binding document, per
>> recommendation from Guenter Roeck
>>
>> Changes since v2:
>>   - Fix indent and format to make them consistent within arm,sp805.txt
>>
>> Changes since v1:
>>   - Consolidate two duplicated SP805 binding documents into one
>>   - Slight change of the wdt_is_running implementation per discussion
>>
>> Ray Jui (6):
>>    Documentation: DT: Consolidate SP805 binding docs
>>    Documentation: DT: Add optional 'timeout-sec' property for sp805
>>    watchdog: sp805: add 'timeout-sec' DT property support
>>    watchdog: sp805: set WDOG_HW_RUNNING when appropriate
>>    arm64: dt: set initial SR watchdog timeout to 60 seconds
>>    arm64: defconfig: add CONFIG_ARM_SP805_WATCHDOG
> 
> I can take the last two patches and Guenter would take the first 4 or
> would you want to proceed differently?
> 

It looks like we still need to figure out how to proceed based on 
discussions with Rob and Guenter on 1/6?

Thanks,

Ray
