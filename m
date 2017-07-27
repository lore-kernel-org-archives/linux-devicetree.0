From: Anup Patel <anup.patel@broadcom.com>
Subject: Re: [PATCH 0/6] Broadcom SBA-RAID driver improvements
Date: Thu, 27 Jul 2017 09:37:58 +0530
Message-ID: <CAALAos9sk0Oum_8tPiL2BvctmqqJViz=HOO4BSbTF59frz7drA@mail.gmail.com>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com> <20170726170259.GH3053@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170726170259.GH3053@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Device Tree <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 10:33 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Wed, Jul 26, 2017 at 11:06:38AM +0530, Anup Patel wrote:
>> This patchset does various improvments to Broadcom SBA-RAID
>> driver and also adds SBA-RAID DT nodes for Stingray SOC.
>>
>> The patches are based on "[PATCH v2 0/7] FlexRM driver improvements"
>> and can also be found at sba-raid-imp-v1 branch of
>> https://github.com/Broadcom/arm64-linux.git
>
> and i cant apply this series without these?

The dependency is only because of last DT patch for stingray.

We are going to separate patchset for Stingray DT changes
so I will drop PATCH6 and have this part of Stingray DT patchset.

>
>>
>> Anup Patel (6):
>>   dma: bcm-sba-raid: Improve memory allocation in SBA RAID driver
>>   dma: bcm-sba-raid: Peek mbox when we are left with no free requests
>>   dma: bcm-sba-raid: pre-ack async tx descriptor
>>   dma: bcm-sba-raid: Break sba_process_deferred_requests() into two
>>     parts
>>   dma: bcm-sba-raid: Add debugfs support
>
> why are these tagged dma, I have told you explcitly to fix this!!

Sure, I will remove "dma:" tag in next revision.

Regards,
Anup
