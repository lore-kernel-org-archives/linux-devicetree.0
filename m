From: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone-k2l: fix broken Ethernet due to
 disabled OSR
Date: Wed, 29 Mar 2017 11:13:39 -0500
Message-ID: <5adb4f5d-78c4-453d-898d-60c588eb1d14@oracle.com>
References: <59ba5ef37f17ff1c10d9d52ca06ef341b2d476eb.1490782833.git.nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59ba5ef37f17ff1c10d9d52ca06ef341b2d476eb.1490782833.git.nsekhar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd, Olof,

On 3/29/17 5:32 AM, Sekhar Nori wrote:
> From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>
> Ethernet networking on K2L has been broken since v4.11-rc1. This was
> caused by commit 32a34441a9bd ("ARM: keystone: dts: fix netcp clocks
> and add names"). This commit inadvertently moves on-chip static RAM
> clock to the end of list of clocks provided for netcp. Since keystone
> PM domain support does not have a list of recognized con_ids, only the
> first clock in the list comes under runtime PM management. This means
> the OSR (On-chip Static RAM) clock remains disabled and that broke
> networking on K2L.
>
> The OSR is used by QMSS on K2L as an external linking RAM. However this
> is a standalone RAM that can be used for non-QMSS usage (as well as from
> DSP side). So add a SRAM device node for the same and add the OSR clock
> to the node.
>
> Remove the now redundant OSR clock node from netcp.
>
> To manage all clocks defined for netCP's use by runtime PM needs keystone
> generic power domain (genpd) driver support which is under works.
> Meanwhile, this patch restores K2L networking and is correct irrespective
> of any future genpd work since OSR is an independent module and not part
> of NetCP anyway.
>
> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
> Acked-by: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
> [nsekhar-l0cyMroinI0@public.gmane.org: commit message updates, port to latest mainline]
> Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
> ---
Acked-by: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Can you please pick this up for rcx fixes ?

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
