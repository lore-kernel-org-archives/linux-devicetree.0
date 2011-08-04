From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH] of/address: Add of_iomap_nocache
Date: Thu, 4 Aug 2011 09:17:52 -0700
Message-ID: <20110804161752.GA19156@huya.qualcomm.com>
References: <1312451629-28036-1-git-send-email-davidb@codeaurora.org>
 <20110804.031254.836213129500890372.davem@davemloft.net>
 <4E3AC05A.1070208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E3AC05A.1070208@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: David Miller <davem@davemloft.net>, davidb@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2011 at 10:52:58AM -0500, Rob Herring wrote:
> On 08/04/2011 05:12 AM, David Miller wrote:
> > From: David Brown <davidb@codeaurora.org>
> > Date: Thu,  4 Aug 2011 02:53:49 -0700
> > 
> >> Add uncached mappings from devicetree nodes similar to regular io
> >> mappings.
> >>
> >> Signed-off-by: David Brown <davidb@codeaurora.org>
> > 
> > You'll need to add a sparc implementation.
> 
> Sparc just defines ioremap_nocache to ioremap, so is that really needed?

The first version of my patch only defines the new function in a file
compiled on non-SPARC targets.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
