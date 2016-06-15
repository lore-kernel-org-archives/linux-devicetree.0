From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v3 2/2] reset: add a SYSCON based reset driver
Date: Wed, 15 Jun 2016 11:52:23 -0500
Message-ID: <576187C7.3020901@ti.com>
References: <20160601184125.20241-1-afd@ti.com>
 <20160601184125.20241-3-afd@ti.com> <57618775.3000903@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57618775.3000903@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/15/2016 11:51 AM, Suman Anna wrote:
> Hi Andrew,
> 
> On 06/01/2016 01:41 PM, Andrew F. Davis wrote:
>> Add a reset-controller driver for performing reset management of
>> various devices present on the SoC, with the reset registers shared
>> between devices in a common register memory space. This driver uses
>> the syscon/regmap frameworks to actually implement the various reset
>> functionalities needed by the reset consumer devices.
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> [s-anna@ti.com: add documentation, syscon name change]
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/reset/Kconfig        |  10 ++
>>  drivers/reset/Makefile       |   1 +
>>  drivers/reset/reset-syscon.c | 289 +++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 300 insertions(+)
>>  create mode 100644 drivers/reset/reset-syscon.c
>>
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 0b2733d..73072e2 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -15,5 +15,15 @@ menuconfig RESET_CONTROLLER
>>  config RESET_OXNAS
>>  	bool
>>  
>> +config SYSCON_RESET
>> +	tristate "SYSCON Reset Driver"
>> +	depends on RESET_CONTROLLER
> 
> Please add a depends on HAS_IOMEM here that you seem to have missed from
> our local patches.
> 

Will add for v4.

Thanks,
Andrew
