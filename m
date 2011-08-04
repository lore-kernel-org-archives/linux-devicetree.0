From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH v2] of/address: Add of_iomap_nocache
Date: Thu, 4 Aug 2011 06:10:15 -0700
Message-ID: <20110804131015.GA6596@huya.qualcomm.com>
References: <1312454196-31028-1-git-send-email-davidb@codeaurora.org>
 <B148344E-9580-4C9B-A8FD-942A9713291C@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B148344E-9580-4C9B-A8FD-942A9713291C@kernel.crashing.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@kernel.crashing.org>
Cc: David Brown <davidb@codeaurora.org>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2011 at 07:44:07AM -0500, Kumar Gala wrote:
> 
> On Aug 4, 2011, at 5:36 AM, David Brown wrote:
> 
> > Add uncached mappings from devicetree nodes similar to regular io
> > mappings.
> > 
> > SPARC is coherent, so there this call is the same as regular of_iomap.
> > 
> > +extern void __iomem *of_iomap_nocache(struct device_node *device, int index);
> 
> What about adding an of_iomap_prot() to match ioremap_prot().

It can be done, but I actually have a use for nocache.  We can
probably add the prot version when first needed.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
