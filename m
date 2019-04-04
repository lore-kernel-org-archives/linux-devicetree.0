From: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH] Documentation: bus: ti-sysc: fix spelling mistake
 "multipe" -> "multiple"
Date: Thu, 4 Apr 2019 14:24:23 +0530
Message-ID: <b9ac4a18-1863-3f4b-b5b8-718ec05d9de2@codeaurora.org>
References: <20190404081529.15394-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404081529.15394-1-colin.king@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tony Lindgren <tony@atomide.com>, Faiz Abbas <faiz_abbas@ti.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 4/4/2019 1:45 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the Documentation. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   Documentation/devicetree/bindings/bus/ti-sysc.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.txt b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> index 85a23f551f02..8eec4c384000 100644
> --- a/Documentation/devicetree/bindings/bus/ti-sysc.txt
> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.txt
> @@ -131,6 +131,6 @@ using offsets from l4_cfg second segment (0x4a000000 + 0x80000 = 0x4a0ab000):
>   		};
>   	};
>   
> -Note that other SoCs, such as am335x can have multipe child devices. On am335x
> +Note that other SoCs, such as am335x can have multiple child devices. On am335x

>   there are two MUSB instances, two USB PHY instances, and a single CPPI41 DMA
>   instance as children of a single interconnet target module.

s/interconnet/interconnect

fix this as well.
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
