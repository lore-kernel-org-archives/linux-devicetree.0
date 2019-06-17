Return-Path: <SRS0=tmaH=UQ=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V4 27/28] PCI: tegra: Add support for GPIO based PERST#
References: <20190613152404.GB30445@e121166-lin.cambridge.arm.com>
 <cb2dd446-1275-7179-33ac-e5c237d81da6@nvidia.com>
 <20190614143222.GB23116@e121166-lin.cambridge.arm.com>
 <1508173d-0ecc-f498-6ab2-78a718086b35@nvidia.com>
 <20190614145023.GA24588@e121166-lin.cambridge.arm.com>
 <20190614152304.GK15526@ulmo>
 <20190614155934.GA28253@e121166-lin.cambridge.arm.com>
 <51e4ae62-f842-1d2f-fbca-0b2063dd53a6@nvidia.com>
 <20190614165353.GB30511@e121166-lin.cambridge.arm.com>
 <1c662f82-8329-5e1b-58bf-b2fe1643adb0@nvidia.com>
 <20190617094839.GE18020@e121166-lin.cambridge.arm.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <0f9bb97d-5a30-a654-0cc6-a57a7bd894c8@nvidia.com>
Date: Mon, 17 Jun 2019 15:57:09 +0530
MIME-Version: 1.0
In-Reply-To: <20190617094839.GE18020@e121166-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 17-Jun-19 3:18 PM, Lorenzo Pieralisi wrote:
> On Fri, Jun 14, 2019 at 10:53:13PM +0530, Manikanta Maddireddy wrote:
>
> [...]
>
>>> Ok. My point then is that you have no way to enforce this requirement on
>>> platforms that actually need it, I do not even know if there is a
>>> way you can do it (I was thinking along the lines of using a
>>> compatible string to detect whether the GPIO #PERST reset is mandatory)
>>> but maybe this is not even a SOC property.
>>>
>>> Maybe what I am asking is overkill, I just wanted to understand.
>>>
>>> I was just asking a question to understand how you handle the case
>>> where a GPIO pin definition is missing in DT for a platform that
>>> actually needs it, the driver will probe but nothing will work.
>>>
>>> It would be good to describe this and capture it in the commit log.
>>>
>>> Thanks,
>>> Lorenzo
>> I can't think of a easy way to enforce this requirement. As you said
>> compatible string is per SOC, so we can't use it for a platform.
>> This issue is present on only one platform, so it is hard to miss the
>> DT property. That is the reason for publishing this patch with out this
>> enforcement in driver.
>>
>> I thought for changing PERST# to GPIO for all platform, but testing is
>> a tedious job. Also I don't have Tegra20 and Tegra30 platforms.
> I can't help with that.
>
>> Do you want me to drop the patch or update the limitation in the commit
>> log?
> It is Thierry's call, if he is OK with it fine by me, please do
> update the commit log, it will help everybody understand.
>
> Lorenzo

Sure, I will update the commit log in V5.
Please let me know if you completed reviewing this series, I will
send V5 addressing review comments in this patch.

Manikanta
