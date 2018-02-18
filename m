Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 17:52:26 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt/bindings: fix binding examples for tegra gmi
 controller
Message-ID: <20180218235226.ys5sxq5yr3zddsnb@rob-hp-laptop>
References: <20180210013326.27771-1-marcel@ziswiler.com>
 <20180210013326.27771-2-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180210013326.27771-2-marcel@ziswiler.com>
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Feb 10, 2018 at 02:33:22AM +0100, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Fix devicetree binding examples for the Generic Memory Interface (GMI)
> bus driver found on Tegra SOCs.
> 
> While at it also remove double new lines as a left over from Rob's
> commit 4da722ca19f3 ("dt-bindings: Remove "status" from examples").
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> ---
> 
>  Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
