From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH][V2] Documentation: bus: ti-sysc: fix spelling mistakes
 "multipe" and "interconnet"
Date: Thu, 4 Apr 2019 16:53:07 +0530
Message-ID: <46156ce3-7b5d-2545-41f2-5816ae9c1a5a@codeaurora.org>
References: <20190404111657.21477-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404111657.21477-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, Faiz Abbas <faiz_abbas@ti.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 4/4/2019 4:46 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is are a couple of spelling mistakes in the Documentation. Fix them.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>
> V2: Add fix to interconnect, thanks to Mukesh Ojha for spotting that
>
> ---
>   Documentation/devicetree/bindings/bus/ti-sysc.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> index 85a23f551f02..cf0e1d6d6f2e 100644
> --- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> @@ -131,6 +131,6 @@ using offsets from l4_cfg second segment (0x4a000000 + 0x80000 = 0x4a0ab000):
>   		};
>   	};
>   
> -Note that other SoCs, such as am335x can have multipe child devices. On am335x
> +Note that other SoCs, such as am335x can have multiple child devices. On am335x
>   there are two MUSB instances, two USB PHY instances, and a single CPPI41 DMA
> -instance as children of a single interconnet target module.
> +instance as children of a single interconnect target module.
