From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 2/6] dma: bcm-sba-raid: Peek mbox when we are left with
 no free requests
Date: Fri, 28 Jul 2017 08:45:01 +0530
Message-ID: <20170728031500.GS3053@localhost>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
 <1501047404-14456-3-git-send-email-anup.patel@broadcom.com>
 <20170726171028.GJ3053@localhost>
 <CAALAos_+ba+fg8wiqtgzWdf3L554G_jW83-J7jFoDNni5_yS9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAALAos_+ba+fg8wiqtgzWdf3L554G_jW83-J7jFoDNni5_yS9w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dan Williams <dan.j.williams@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Device Tree <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 10:25:25AM +0530, Anup Patel wrote:
> On Wed, Jul 26, 2017 at 10:40 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> > On Wed, Jul 26, 2017 at 11:06:40AM +0530, Anup Patel wrote:
> >> We should peek mbox channels when we are left with no free
> >> sba_requests in sba_alloc_request()
> >
> > and why is the world should we do that, how does that help??
> 
> When setting up RAID array on several NVMe disk we observed
> that sba_alloc_request() start failing (due to no free requests left)
> and RAID array setup becomes very slow.
> 
> Doing mbox channel peek when we have no free requests left,
> improves performance of RAID array setup.

How about documenting this tribal knowledge in the changelog. Changelogs are
very useful, 6 months down the line, you will struggle to remember why this
was changed..

> 
> This change is inspired from mv_chan_alloc_slot() implemented
> in drivers/dma/mv_xor.c
> 
> Regards,
> Anup

-- 
~Vinod
