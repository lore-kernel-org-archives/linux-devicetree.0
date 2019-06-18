From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH next v2] of/fdt: Fix defined but not used compiler warning
Date: Tue, 18 Jun 2019 08:09:48 -0600
Message-ID: <20190618140948.GA18305@bogus>
References: <20190612010011.90185-1-wangkefeng.wang@huawei.com>
 <20190615030343.96524-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190615030343.96524-1-wangkefeng.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Stephen Boyd <swboyd@chromium.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sat, 15 Jun 2019 11:03:43 +0800, Kefeng Wang wrote:
> When CONFIG_OF_EARLY_FLATTREE is disabled, there is a compiler
> warning,
> 
> drivers/of/fdt.c:129:19: warning: ‘of_fdt_match’ defined but not used [-Wunused-function]
>  static int __init of_fdt_match(const void *blob, unsigned long node,
> 
> Since the only caller of of_fdt_match() is of_flat_dt_match(),
> let's move the body of of_fdt_match() into of_flat_dt_match()
> and eliminate of_fdt_match().
> 
> Meanwhile, move of_fdt_is_compatible() under CONFIG_OF_EARLY_FLATTREE,
> as all callers are over there.
> 
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -Move the body of of_fdt_match() into of_flat_dt_match(), suggested by Frank.
> 
>  drivers/of/fdt.c | 99 ++++++++++++++++++++++--------------------------
>  1 file changed, 45 insertions(+), 54 deletions(-)
> 

Applied, thanks.

Rob
