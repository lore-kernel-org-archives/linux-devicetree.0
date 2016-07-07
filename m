From: Tai Tri Nguyen <ttnguyen@apm.com>
Subject: Re: [PATCH v7 1/4] MAINTAINERS: Add entry for APM X-Gene SoC PMU driver
Date: Wed, 6 Jul 2016 17:35:08 -0700
Message-ID: <CACgAJHyvusvRPKNaxHLFK=gWw2UUtjV80H175eRu6EieutxNiw@mail.gmail.com>
References: <1467850045-10584-1-git-send-email-ttnguyen@apm.com>
 <1467850045-10584-2-git-send-email-ttnguyen@apm.com> <1467850751.8360.56.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467850751.8360.56.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will.deacon@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

Hi Joe,

Thanks.

On Wed, Jul 6, 2016 at 5:19 PM, Joe Perches <joe@perches.com> wrote:
> On Wed, 2016-07-06 at 17:07 -0700, Tai Nguyen wrote:
>> Signed-off-by: Tai Nguyen <ttnguyen@apm.com>
>> ---
>>  MAINTAINERS | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> @@ -8593,6 +8593,14 @@ L:     linux-scsi@vger.kernel.org
>>  S:   Supported
>>  F:   drivers/scsi/pm8001/
>>
>> +PMU-XGENE
>> +APPLIED MICRO (APM) X-GENE SOC PMU
>
> One line section header please.

Is this strictly required?
I think I can just drop the first line "PMU-XGENE" if it's required.

>
>> +M:   Tai Nguyen <ttnguyen@apm.com>
>> +S:   Supported
>> +F:   drivers/perf/xgene_pmu.c
>> +F:   Documentation/perf/xgene-pmu.txt
>> +F:   Documentation/devicetree/bindings/perf/apm-xgene-pmu.txt
>> +
>>  POSIX CLOCKS and TIMERS
>>  M:   Thomas Gleixner <tglx@linutronix.de>
>>  L:   linux-kernel@vger.kernel.org

Regards,
-- 
Tai
