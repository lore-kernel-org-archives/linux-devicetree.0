From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] hwspinlock/msm: Add support for Qualcomm MSM HW Mutex
 block
Date: Fri, 29 Aug 2014 17:14:07 -0700
Message-ID: <5401174F.8040508@codeaurora.org>
References: <1409354063-20289-1-git-send-email-bjorn.andersson@sonymobile.com> <20140829234128.GB25668@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140829234128.GB25668@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Courtney Cavin <courtney.cavin@sonymobile.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, Suman Anna <s-anna@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 08/29/14 16:41, Courtney Cavin wrote:
> On Sat, Aug 30, 2014 at 01:14:23AM +0200, Bjorn Andersson wrote:
>> From: Kumar Gala <galak@codeaurora.org>
>>
>> Add driver for Qualcomm MSM Hardware Mutex block that exists on
>> newer Qualcomm SoCs.
>>
>> Cc: Jeffrey Hugo <jhugo@codeaurora.org>
>> Cc: Eric Holmberg <eholmber@codeaurora.org>
>> Cc: Courtney Cavin <courtney.cavin@sonymobile.com>
>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>> [bjorn: added pm_runtime calls, from Courtney,
>> 	added sfpb-mutex compatible,
>> 	updated DT binding documentation formatting]
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
>> ---
> [...]
>> diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
>> index 3612cb5..2cd39e2 100644
>> --- a/drivers/hwspinlock/Kconfig
>> +++ b/drivers/hwspinlock/Kconfig
>> @@ -8,6 +8,17 @@ config HWSPINLOCK
>>  
>>  menu "Hardware Spinlock drivers"
>>  
>> +config HWSPINLOCK_MSM
>> +	tristate "MSM Hardware Spinlock device"
>> +	depends on ARCH_QCOM
> This should also depend on OF, as it won't compile or work without it.

Doesn't ARCH_QCOM imply OF? ARCH_MULTIPLATFORM has a select USE_OF.

>
>> +	select HWSPINLOCK
>> +	help
>> +	  Say y here to support the MSM Hardware Mutex functionality, which
>> +	  provides a synchronisation mechanism for the various processors on
>> +	  the SoC.
>> +
>> +	  If unsure, say N.
>> +
>>

Maybe MSM should be changed to qcom? Just a thought.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
