Return-Path: <SRS0=dIfH=OV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1700 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbeLLV0w (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Dec 2018 16:26:52 -0500
Date: Wed, 12 Dec 2018 13:26:50 -0800
From: Sivaram Nair <sivaramn@nvidia.com>
Subject: Re: [PATCH 2/4] firmware: tegra: refactor bpmp driver
Message-ID: <20181212212650.GB3443@sdt>
References: <1544643088-17678-1-git-send-email-talho@nvidia.com>
 <1544643088-17678-3-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1544643088-17678-3-git-send-email-talho@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Timo Alho <talho@nvidia.com>
Cc: treding@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 12, 2018 at 09:31:26PM +0200, Timo Alho wrote:
>  
>  static bool tegra_bpmp_is_req_ready(struct tegra_bpmp_channel *channel)
>  {
> -	return tegra_bpmp_is_resp_ready(channel);
> +	struct tegra_bpmp *bpmp = channel->bpmp;
> +
> +	return bpmp->soc->ops->is_req_ready(channel);

Perhaps, write a helper function to return ops pointer from channel and
use it here and below?

>  
> +extern struct tegra_bpmp_ops tegra186_bpmp_ops;

Move this to bpmp-private.h?
