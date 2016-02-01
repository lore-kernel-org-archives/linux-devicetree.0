From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V13 09/10] vfio, platform: add support for ACPI while
 detecting the reset driver
Date: Mon, 1 Feb 2016 11:16:52 -0500
Message-ID: <56AF84F4.2080809@codeaurora.org>
References: <1454106914-15857-1-git-send-email-okaya@codeaurora.org>
 <1454106914-15857-10-git-send-email-okaya@codeaurora.org>
 <56AF82FA.7000303@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56AF82FA.7000303@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Auger <eric.auger@linaro.org>, dmaengine@vger.kernel.org, marc.zyngier@arm.com, mark.rutland@arm.com, timur@codeaurora.org, devicetree@vger.kernel.org, cov@codeaurora.org, vinod.koul@intel.com, jcm@redhat.com
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, agross@codeaurora.org, arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Baptiste Reynal <b.reynal@virtualopensystems.com>
List-Id: devicetree@vger.kernel.org

On 2/1/2016 11:08 AM, Eric Auger wrote:
>> For ACPI systems, ACPI HID needs to match and compat in the registered
>> > reset
>> > driver needs to match for ACPI reset driver loading to work.
> Don't really get the sentence. For ACPI systems, a registered reset
> function is selected if its associated ACPI HID matches the device ACPI HID?

Old commit message. I did an internal review before posting the patch. The first
version of the patch was a hack. I simplified the code but forgot to update the 
commit message.

Now, the rule is simple.

- ACPI HID needs match for ACPI systems
- DT compat needs to match for OF systems

as expected. I'll rephrase for the next version.

>> > 
>> > For OF based systems, DT compatible string needs to match and compat in the
>> > registered reset driver needs to match for DT reset driver loading to work.
> same here
> 
> I added Baptiste who is vfio platform driver sub-system maintainer.

Thanks, we should ask Baptiste to get his email into the Maintainer file list.

> 
> On my side I tested with of amd xgbe and I don't observe any regression.
> 
> Best Regards

Can I add your tested by?

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
