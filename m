From: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V3] of: Set the DMA mask to 64 bits when dma_addr_t is
 64-bits
Date: Mon, 08 Jul 2013 19:38:58 -0700
Message-ID: <51DB77C2.4060705@codeaurora.org>
References: <1367008266-1431-1-git-send-email-lauraa@codeaurora.org>
 <517AF270.8040106@gmail.com>
 <CACVXFVPfkqP+UyoGd-+QFRzndSam_DtU=utrBPYCPjQCGQ_F6g@mail.gmail.com>
 <51D71F81.5090503@codeaurora.org>
 <20130708104254.GS24642@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130708104254.GS24642-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Ming Lei <tom.leiming-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 7/8/2013 3:42 AM, Russell King - ARM Linux wrote:
>>
>> The problem is the way the arm_dma_limit is set up, all dma allocations
>> are currently broken regardless of if the actual device supports 64-bit
>> addresses or not.
>
> Please explain this statement.
>

The statement was a bit shortsighted given recent discussions. My point 
was that on LPAE systems right now without ZONE_DMA, the allocation 
fails by default (i.e. no call to set_mask) even if the device could 
support 64-bit physical memory. Based on this thread though, drivers 
should stop assuming the dma_mask will be set up properly and always set 
the mask appropriately.

The conclusion also seems to be that if devices on an LPAE system can't 
handle > 32-bit addresses and want to limit via mask, ZONE_DMA must be 
set up.

Please correct me if I misunderstood anything.

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
