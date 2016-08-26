From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v7 10/14] arm64/numa: define numa_distance as array to
 simplify code
Date: Fri, 26 Aug 2016 16:29:16 +0100
Message-ID: <20160826152915.GH30302@arm.com>
References: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
 <1472024693-12912-11-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472024693-12912-11-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 24, 2016 at 03:44:49PM +0800, Zhen Lei wrote:
> 1. MAX_NUMNODES is base on CONFIG_NODES_SHIFT, the default value of the
>    latter is very small now.
> 2. Suppose the default value of MAX_NUMNODES is enlarged to 64, so the
>    size of numa_distance is 4K, it's still acceptable if run the Image
>    on other processors.
> 3. It will make function __node_distance quicker than before.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  arch/arm64/include/asm/numa.h |  1 -
>  arch/arm64/mm/numa.c          | 74 +++----------------------------------------
>  2 files changed, 5 insertions(+), 70 deletions(-)

I fail to see the advantages of this patch. Do you have some compelling
performance figures or something?

Will
