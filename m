From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Fri, 30 Oct 2015 21:53:31 -0400
Message-ID: <56341F1B.4090200@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <5741892.rRLhcI7KQG@wuerfel> <5633E442.3010003@codeaurora.org>
 <4552697.VhjWnxQoIo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4552697.VhjWnxQoIo@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/30/2015 6:28 PM, Arnd Bergmann wrote:
> I missed that part. If the descriptor count is a hardware feature,
> just make that property mandatory. OTOH, if this is an optimization
> setting, better drop that property entirely.

I'm going to make this a module parameter instead and get rid of the 
constant. The reason, I have this default parameter today is that QEMU 
does not support passing device tree arguments for platform devices.

QEMU allows you to set memory and interrupt resources only for platform 
devices.

At least now, I can pass the argument via command line before starting QEMU.

I'll put checks that the value needs to come from either 
DTS/ACPI/command line.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
