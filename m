From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] arm: mvebu: support for SMP on 98DX3336 SoC
Date: Thu, 22 Dec 2016 16:47:04 -0600
Message-ID: <20161222224704.6ikncsvb76y4zmfe@rob-hp-laptop>
References: <20161222041328.3303-1-chris.packham@alliedtelesis.co.nz>
 <20161222041328.3303-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161222041328.3303-3-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 22, 2016 at 05:13:25PM +1300, Chris Packham wrote:
> Compared to the armada-xp the 98DX3336 uses different registers to set
> the boot address for the secondary CPU so a new enable-method is needed.
> This will only work if the machine definition doesn't define an overall
> smp_ops because there is not currently a way of overriding this from the
> device tree if it is set in the machine definition.

Doesn't look like you documented the enable-method value.

> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
>  .../bindings/arm/marvell/98dx3236-resume-ctrl.txt  | 18 ++++++
>  arch/arm/mach-mvebu/Makefile                       |  1 +
>  arch/arm/mach-mvebu/common.h                       |  1 +
>  arch/arm/mach-mvebu/platsmp.c                      | 43 ++++++++++++++
>  arch/arm/mach-mvebu/pmsu-98dx3236.c                | 69 ++++++++++++++++++++++
>  5 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx3236-resume-ctrl.txt
>  create mode 100644 arch/arm/mach-mvebu/pmsu-98dx3236.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
