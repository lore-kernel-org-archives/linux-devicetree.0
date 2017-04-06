From: Michael Ellerman <patch-notifications-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [v2,1/3] drivers/of/base.c: Add of_property_read_u64_index
Date: Thu,  6 Apr 2017 23:06:06 +1000 (AEST)
Message-ID: <3vzNHy3Nw9z9sDB@ozlabs.org>
References: <1491213104-24450-1-git-send-email-alistair@popple.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491213104-24450-1-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, mhairgrove-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shailendras-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-04-03 at 09:51:42 UTC, Alistair Popple wrote:
> There is of_property_read_u32_index but no u64 variant. This patch
> adds one similar to the u32 version for u64.
> 
> Signed-off-by: Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/2475a2b6c877a0c8d1ca42c3f2b30f

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
