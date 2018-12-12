Return-Path: <SRS0=dIfH=OV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1918 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbeLLVbb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Dec 2018 16:31:31 -0500
Date: Wed, 12 Dec 2018 13:31:30 -0800
From: Sivaram Nair <sivaramn@nvidia.com>
Subject: Re: [PATCH 3/4] firmware: tegra: add bpmp driver for Tegra210
Message-ID: <20181212213130.GA3395@sdt>
References: <1544643088-17678-1-git-send-email-talho@nvidia.com>
 <1544643088-17678-4-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1544643088-17678-4-git-send-email-talho@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Timo Alho <talho@nvidia.com>
Cc: treding@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 12, 2018 at 09:31:27PM +0200, Timo Alho wrote:
> +}
> +
> +static irqreturn_t rx_irq(int irq, void *data)

s/rx_irq/tegra210_bpmp_rx_irq/?

> @@ -793,6 +799,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
>  
>  extern struct tegra_bpmp_ops tegra186_bpmp_ops;
> +extern struct tegra_bpmp_ops tegra210_bpmp_ops;

Move to bpmp-private.h?
