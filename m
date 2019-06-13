From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC/PATCH 1/5] reserved_mem: Add a devm_memremap_reserved_mem()
 API
Date: Thu, 13 Jun 2019 16:51:14 -0600
Message-ID: <20190613225114.GA16158@bogus>
References: <20190517164746.110786-1-swboyd@chromium.org>
 <20190517164746.110786-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517164746.110786-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: devicetree@vger.kernel.org

On Fri, 17 May 2019 09:47:42 -0700, Stephen Boyd wrote:
> We have a few drivers that need to get a reserved memory region, request
> the region, and map the reserved memory with memremap(). Add an API to
> do this all in one function call.
> 
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/of/of_reserved_mem.c    | 45 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h |  6 +++++
>  2 files changed, 51 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
