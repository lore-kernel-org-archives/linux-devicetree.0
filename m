From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] irq/of: Fix comment typo for irq_of_parse_and_map
Date: Mon, 09 Sep 2013 17:03:35 +0100
Message-ID: <20130909160335.2E26A3E0F23@localhost>
References: <1377913450-30108-1-git-send-email-wangyijing@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377913450-30108-1-git-send-email-wangyijing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

On Sat, 31 Aug 2013 09:44:10 +0800, Yijing Wang <wangyijing@huawei.com> wrote:
> Fix trivial comment typo for irq_of_parse_and_map().
> 
> Signed-off-by: Yijing Wang <wangyijing@huawei.com>

Applied, thanks.

g.

> ---
>  drivers/of/irq.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 1264923..1752988 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -28,7 +28,7 @@
>  
>  /**
>   * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
> - * @device: Device node of the device whose interrupt is to be mapped
> + * @dev: Device node of the device whose interrupt is to be mapped
>   * @index: Index of the interrupt to map
>   *
>   * This function is a wrapper that chains of_irq_map_one() and
> -- 
> 1.7.1
> 
> 
