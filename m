From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] of: reserved_mem: fix reserve memory leak
Date: Wed, 10 Apr 2019 08:56:48 -0500
Message-ID: <20190410135648.GA25739@bogus>
References: <20190219074500.16454-1-vichy.kuo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219074500.16454-1-vichy.kuo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: pierre Kuo <vichy.kuo@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 03:45:00PM +0800, pierre Kuo wrote:
> The __reserved_mem_init_node will call region specific reserved memory
> init codes, but once all compatibled init codes failed, the memory region
> will left in memory.reserved and cause leakage.
> 
> Take cma reserve memory DTS for example, if user declare 1MB size,
> which is not align to (PAGE_SIZE << max(MAX_ORDER - 1,
> pageblock_order)), rmem_cma_setup will return -EINVAL.
> Meanwhile, rmem_dma_setup will also return -EINVAL since "reusable"
> property is not set. If finally there is no reserved memory init pick up
> this memory, kernel will left the 1MB leak in memory.reserved.
> 
> This patch will remove this kind of memory from memory.reserved, only
> when __reserved_mem_init_node return neither 0 nor -ENOENT.
> 
> Signed-off-by: pierre Kuo <vichy.kuo@gmail.com>
> ---
>  drivers/of/of_reserved_mem.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)

As no one else seems to have any comments, I've applied it.

Rob
