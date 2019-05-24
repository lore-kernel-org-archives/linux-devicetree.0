From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] of/fdt: Mark initial_boot_params as
 __ro_after_init
Date: Fri, 24 May 2019 16:39:29 -0500
Message-ID: <20190524213929.GA11780@bogus>
References: <20190514204053.124122-1-swboyd@chromium.org>
 <20190514204053.124122-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514204053.124122-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, 14 May 2019 13:40:53 -0700, Stephen Boyd wrote:
> The FDT pointer, i.e. initial_boot_params, shouldn't be changed after
> init. It's only set by boot code and then the only user of the FDT is
> the raw sysfs reading API. Mark this pointer with __ro_after_init so
> that the pointer can't be changed after init.
> 
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/of/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
