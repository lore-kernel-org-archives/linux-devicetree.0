From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC/PATCH 0/5] Read-only memremap() proposal
Date: Fri, 17 May 2019 10:35:14 -0700
Message-ID: <20190517173514.GM2085@tuxbook-pro>
References: <20190517164746.110786-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517164746.110786-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri 17 May 09:47 PDT 2019, Stephen Boyd wrote:

> This patch series implements a read-only version of memremap() via
> a new MEMREMAP_RO flag. If this is passed in the mapping call, we'll
> try to map the memory region as read-only if it doesn't intersect
> with an existing mapping. Otherwise, we'll try to fallback to other
> flags to try to map the memory that way.
> 
> The main use case I have is to map the command-db memory region on
> Qualcomm devices with a read-only mapping. It's already a const marked
> pointer and the API returns const pointers as well, so this series makes
> sure that even stray writes can't modify the memory. To get there we
> introduce a devm version of memremap() for a reserved memory region, add
> a memremap() flag, and implement support for that flag on arm64.
> 

I have a few places where the first patch will be useful, and the rest
looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> 
> Stephen Boyd (5):
>   reserved_mem: Add a devm_memremap_reserved_mem() API
>   soc: qcom: cmd-db: Migrate to devm_memremap_reserved_mem()
>   memremap: Add support for read-only memory mappings
>   arm64: Add support for arch_memremap_ro()
>   soc: qcom: cmd-db: Map with read-only mappings
> 
>  arch/arm64/include/asm/io.h     |  1 +
>  drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
>  drivers/soc/qcom/cmd-db.c       | 14 +++-------
>  include/linux/io.h              |  1 +
>  include/linux/of_reserved_mem.h |  6 +++++
>  kernel/iomem.c                  | 15 +++++++++--
>  6 files changed, 70 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b
> prerequisite-patch-id: 62119e27c0c0686e02f0cb55c296b878fb7f5e47
> prerequisite-patch-id: bda32cfc1733c245ae3f141d7c27b18e4adcc628
> prerequisite-patch-id: b8f8097161bd15e87d54dcfbfa67b9ca1abc7204
> -- 
> Sent by a computer through tubes
> 
