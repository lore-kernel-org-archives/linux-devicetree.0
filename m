From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] of: reserved-memory: ignore disabled memory-region
 nodes
Date: Fri, 24 May 2019 15:53:30 -0500
Message-ID: <20190524205330.GA23430@bogus>
References: <1558522031-549-1-git-send-email-puneets@nvidia.com>
 <1558522031-549-2-git-send-email-puneets@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558522031-549-2-git-send-email-puneets@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, treding@nvidia.com, vdumpa@nvidia.com, snikam@nvidia.com, jonathanh@nvidia.com, Puneet Saxena <puneets@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, 22 May 2019 16:17:11 +0530, Puneet Saxena wrote:
> From: Krishna Reddy <vdumpa@nvidia.com>
> 
> Ignore disabled nodes in the memory-region 
> nodes list and continue to initialize the rest 
> of enabled nodes.
> 
> Check if the "reserved-memory" node is available
> and if it's not available, return 0 to ignore the 
> "reserved-memory" node and continue parsing with 
> next node in memory-region nodes list.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> Signed-off-by: Puneet Saxena <puneets@nvidia.com>
> ---
> v2:
> * Fixed typo in commit message.
> * Used "of_device_is_available" to check "reserved-memory"
>   nodes are disabled/enabled.
> 
>  drivers/of/of_reserved_mem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks.

Rob
