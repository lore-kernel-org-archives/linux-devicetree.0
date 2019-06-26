From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv3 1/1] coresight: Do not default to CPU0 for missing CPU
 phandle
Date: Thu, 27 Jun 2019 00:32:14 +0530
Message-ID: <68fea180-c3a4-b7d9-09b6-1d3ddbc89f9d@codeaurora.org>
References: <cover.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <635466ab6a27781966bb083e93d2ca2729473ced.1561346998.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYky6D5EsCL2vOa4hHaqTQRXbN+TT0pSzFrykDL_fHEkiBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYky6D5EsCL2vOa4hHaqTQRXbN+TT0pSzFrykDL_fHEkiBQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On 6/26/2019 11:11 PM, Mathieu Poirier wrote:
> Hi Sai,
> 
> On Sun, 23 Jun 2019 at 21:36, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 3c5ceda8db24..4990da2c13e9 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -159,16 +159,16 @@ static int of_coresight_get_cpu(struct device *dev)
>>          struct device_node *dn;
>>
>>          if (!dev->of_node)
>> -               return 0;
>> +               return -ENODEV;
>> +
>>          dn = of_parse_phandle(dev->of_node, "cpu", 0);
>> -       /* Affinity defaults to CPU0 */
>>          if (!dn)
>> -               return 0;
>> +               return -ENODEV;
>> +
>>          cpu = of_cpu_node_to_id(dn);
>>          of_node_put(dn);
>>
>> -       /* Affinity to CPU0 if no cpu nodes are found */
>> -       return (cpu < 0) ? 0 : cpu;
>> +       return cpu;
>>   }
> 
> Function of_coresight_get_cpu() needs to return -ENODEV rather than 0
> when !CONFIG_OF
> 
>>
>>   /*
>> @@ -734,14 +734,14 @@ static int acpi_coresight_get_cpu(struct device *dev)
>>          struct acpi_device *adev = ACPI_COMPANION(dev);
>>
>>          if (!adev)
>> -               return 0;
>> +               return -ENODEV;
>>          status = acpi_get_parent(adev->handle, &cpu_handle);
>>          if (ACPI_FAILURE(status))
>> -               return 0;
>> +               return -ENODEV;
>>
>>          cpu = acpi_handle_to_logical_cpuid(cpu_handle);
>>          if (cpu >= nr_cpu_ids)
>> -               return 0;
>> +               return -ENODEV;
>>          return cpu;
>>   }
>>
> 
> Same as above, but for !CONFIG_ACPI
> 

Have fixed and resent, thanks Mathieu.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
