From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: lpc32xx: add device node for IRAM on-chip
 memory
Date: Sun, 2 Oct 2016 22:09:23 -0700
Message-ID: <20161003050923.GA4403@localhost>
References: <1467931601-25067-1-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467931601-25067-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 08, 2016 at 01:46:41AM +0300, Vladimir Zapolskiy wrote:
> The change adds a new device node with description of generic SRAM
> on-chip memory found on NXP LPC32xx SoC series and connected to AHB
> matrix slave port 3.
> 
> Note that NXP LPC3220 SoC has 128KiB of SRAM memory, the other
> LPC3230, LPC3240 and LPC3250 SoCs all have 256KiB SRAM space,
> in the shared DTSI file this change specifies 128KiB SRAM size.
> 
> Also it's worth to mention that the SRAM area contains of 64KiB banks,
> 2 banks on LPC3220 and 4 banks on the other SoCs from the series, and
> all SRAM banks but the first one have independent power controls,
> the description of this feature will be added with the introduction of
> power domains for the SoC series.
> 
> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> Cc: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> Hi Arnd, Olof, Kevin,
> 
> please consider to include this NXP LPC32xx DT change directly to
> ARM tree for v4.8.
> 
> The SRAM device node will be utilized to store PM resume code
> and to store MAC buffers.

Hi,

When sweeping my inbox looking for patches we had missed, this still showed
up from back in July. I've now applied it, it'll make it into 4.9 (in
next/late). Sorry for missing it earlier.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
