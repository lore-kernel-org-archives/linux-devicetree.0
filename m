From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v11 4/9] soc: qcom: rpmpd: Add a Power domain driver to
 model corners
Date: Fri, 18 Jan 2019 10:24:45 +0530
Message-ID: <ac10a4b9-96fe-0e62-a831-9b3ebe67de23@codeaurora.org>
References: <20190110040209.6028-1-rnayak@codeaurora.org>
 <20190110040209.6028-5-rnayak@codeaurora.org>
 <20190117174254.GA17273@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117174254.GA17273@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, henryc.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

[]..

>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index fcbf8a2e4080..df5cd9fa0d5e 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -98,6 +98,15 @@ config QCOM_RPMH
>>   	  of hardware components aggregate requests for these resources and
>>   	  help apply the aggregated state on the resource.
>>   
>> +config QCOM_RPMPD
>> +	bool "Qualcomm RPM Power domain driver"
>> +	depends on MFD_QCOM_RPM && QCOM_SMD_RPM
> 
> Since this is bool, but the dependent configurations are tristate,
> configurations such as arm64:allmodconfig result in
> 
> CONFIG_QCOM_RPMPD=y
> CONFIG_MFD_QCOM_RPM=m
> CONFIG_QCOM_SMD_RPM=m
> 
> This in turn results in
> 
>     arm-linux-gnueabi-ld: drivers/soc/qcom/rpmpd.o: in function `rpmpd_send_enable':
>>> rpmpd.c:(.text+0x64): undefined reference to `qcom_rpm_smd_write'
>     arm-linux-gnueabi-ld: drivers/soc/qcom/rpmpd.o: in function `rpmpd_power_on':
>     rpmpd.c:(.text+0x408): undefined reference to `qcom_rpm_smd_write'
>>> arm-linux-gnueabi-ld: rpmpd.c:(.text+0x460): undefined reference to `qcom_rpm_smd_write'
> 
> as reported by 0day.

Thanks for reporting this, the QCOM_RPMPD dependency on MFD_QCOM_RPM was removed
by a patch on top from Bjorn [1]. I have posted a fix now [2] to make QCOM_RPMPD
depend on QCOM_SMD_RPM=y

[1] https://lkml.org/lkml/2019/1/17/5
[2] https://lkml.org/lkml/2019/1/17/1043

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
