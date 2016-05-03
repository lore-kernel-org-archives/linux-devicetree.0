From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V4 0/2] vfio, platform: add ACPI support
Date: Tue, 3 May 2016 16:46:29 -0400
Message-ID: <57290E25.7010501@codeaurora.org>
References: <1462136872-17590-1-git-send-email-okaya@codeaurora.org>
 <3322250.xDEDujoeAM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <3322250.xDEDujoeAM@wuerfel>
Sender: kvm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org, mark.rutland@arm.com, devicetree@vger.kernel.org, vikrams@codeaurora.org, marc.zyngier@arm.com, linux-arm-msm@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, shankerd@codeaurora.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
List-Id: devicetree@vger.kernel.org

On 5/3/2016 4:12 PM, Arnd Bergmann wrote:
> On Sunday 01 May 2016 17:07:50 Sinan Kaya wrote:
>> The patchset makes three different changes.
>> 1. Add support for probing ACPI platform devices.
>> 2. Add support for ACPI _RST method support during reset
>> 3. Make reset driver a requirement by default with an optional
>>    kernel command line override
> 
> Looks nice, thanks for rewriting this!
> 
> For future submissions, it would help to have a list of changes
> compared to the previous versions a the patch set in the cover
> letter to help reviewers, but this time my memory was still fresh
> enough.
> 
> 	Arnd
> 

Sure, will do. I asked Rafael to review the ACPI code. 

+		ret = vfio_platform_call_reset(vdev);

This is the only problem I'm seeing in the code. I tested the ACPI path only. 
I'm wondering if Eric could test the device tree version.

+		if (ret)
+			goto err_irq;
 
I'll get rid of this line on the first patch and move it to second
patch along with reset_required check.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
