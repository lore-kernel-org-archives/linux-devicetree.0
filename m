From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Sat, 31 Oct 2015 00:27:47 -0400
Message-ID: <56344343.2020000@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
 <1446174501-8870-2-git-send-email-okaya@codeaurora.org>
 <20151030145054.GE31073@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151030145054.GE31073@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/30/2015 10:50 AM, Mark Rutland wrote:
> The documentation above didn't state this was an 8-bit quantity, and you
> save nothing by doing this (all values in the binary format are padded
> to 4-byte alignment).

done.

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
