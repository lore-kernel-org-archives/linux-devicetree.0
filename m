From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC/PATCH 4/5] arm64: Add support for arch_memremap_ro()
Date: Mon, 3 Jun 2019 16:56:13 +0100
Message-ID: <20190603155612.GC63283@arrakis.emea.arm.com>
References: <20190517164746.110786-1-swboyd@chromium.org>
 <20190517164746.110786-5-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517164746.110786-5-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, Will Deacon <will.deacon@arm.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 09:47:45AM -0700, Stephen Boyd wrote:
> Pass in PAGE_KERNEL_RO to the underlying IO mapping mechanism to get a
> read-only mapping for the MEMREMAP_RO type of memory mappings that
> memremap() supports.
> 
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Not sure what the plans are with this series but if you need an ack for
arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
