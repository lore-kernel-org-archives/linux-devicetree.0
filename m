From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Sat, 31 Oct 2015 07:53:39 -0500
Message-ID: <5634B9D3.9000009@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <4548985.gMZJhM3R1p@wuerfel> <56346502.5070600@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56346502.5070600@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sinan Kaya wrote:
>
> I expect this driver to grow in functionality over time. Right now, it
> does the global init for the DMA. After that all channels execute on
> their own without depending on each other. Global init has to be done
> first before attempting to do any channel initialization.
>
> There is also implied startup ordering requirements. I was doing this by
> using channel driver with the late binding to guarantee that.
>
> As soon as I use module_platform_driver, the ordering gets reversed for
> some reason.

If you want to force two probe functions to be called in order, then 
that's what -EPROBE_DEFER is for.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
