From: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 0/6] Add common clock support for Broadcom iProc
 architecture
Date: Wed, 25 Feb 2015 11:33:46 -0800
Message-ID: <20150225193346.GD3215@dtor-ws>
References: <rjui@broadcom.com>
 <1423097705-22939-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423097705-22939-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 04, 2015 at 04:54:59PM -0800, Ray Jui wrote:
> This patchset contains the initial common clock support for Broadcom's iProc
> family of SoCs. The iProc clock architecture comprises of various PLLs, e.g.,
> ARMPLL, GENPLL, LCPLL0, MIPIPLL, and etc. An onboard crystal serves as the
> basic reference clock for these PLLs. Each PLL may have several leaf clocks.
> One special group of clocks is the ASIU clocks, which are dervied directly
> from the crystal reference clock.
> 
> This patchset also contains the basic clock support for the Broadcom Cygnus
> SoC, which implements the iProc clock architecture
> 
> Changes from v4:
>  - Add of_clk_get_parent_rate helper function into the clock framework
>  - Switch to use of_clk_get_parent_rate in the iProc PLL clock driver
> 
> Changes from v3:
>  - Fix incorrect use of passing in of_clk_src_onecell_get when adding ARM PLL
>    and other iProc PLLs as clock provider. These PLLs have zero cells in DT and
>    thefore of_clk_src_simple_get should be used instead
>  - Rename Cygnus MIPI PLL Channel 2 clock from BCM_CYGNUS_MIPIPLL_CH2_UNUSED
>    to BCM_CYGNUS_MIPIPLL_CH2_V3D, since a 3D graphic rendering engine has been
>    integrated into Cygnus revision B0 and has its core clock running off
>    MIPI PLL Channel 2
>  - Changed default MIPI PLL VCO frequency from 1.75 GHz to 2.1 GHz. This allows
>    us to derive 300 MHz V3D clock from channel 2 through the post divisor
> 
> Changes from v2:
>  - Re-arrange Cygnus clock/pll init functions so each init function is right
>    next to its clock table
>  - Removed #defines for number of clocks in Cygnus. Have the number of clocks
>    automatically determined based on array size of the clock table
> 
> Changes from v1:
>  - Separate drivers/clk/Makefile change for drivers/clk/bcm out to a standalone patch

FWIW I tested this series on BCM958305K SVK.

Tested-by: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
