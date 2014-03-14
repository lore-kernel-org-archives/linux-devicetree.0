From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Watchdog support for Armada 375/38x SoC
Date: Fri, 14 Mar 2014 15:21:30 -0700
Message-ID: <532380EA.7010809@roeck-us.net>
References: <1394658715-2017-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394658715-2017-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/12/2014 02:11 PM, Ezequiel Garcia wrote:
> Third round of the patchset adding support for watchdog on Armada 375 and
> Armada 38x SoCs.
>
> The new Armada 375/385 SoCs have two registers for the watchdog RSTOUT:
>
>   1. It has a dedicated register (similar to the one in A370/XP)
>   2. Also has a bit in a shared RSTOUT register.
>
> Therefore, in order to support this two-folded RSTOUT, we extend the 'reg'
> property in the watchdog devicetree and require a new pair of cells to specify
> the shared RSTOUT.
>
> On the driver side, we need to implement per-SoC stop() and enabled()
> functions. Such somewhat complex infrastructure is needed to ensure the driver
> performs proper reset of the watchdog timer, by masking and disabling the
> RSTOUT before the interrupt is enabled.
>
> I've pushed a branch so people can test this easily, e.g. ensuring
> no regressions on Dove, Kirkwood and A370/XP:
>
> https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_a385_a375_v3
>
> Changes from v2:
>
>    * Cleaned-up usage of atomic_io_modify(), using it only when needed.
>      For instance, the RSTOUT dedicated register on Armada 370/375/380/XP
>      can be safely access without any lock.
>
>    * Use devm_ioremap_resource() for the non-shared registers. The shared
>      registers need to use devm_ioremap(), which does not request the
>      memory region.
>
> Changes from v1:
>
>    * Reworked entirely!
>
> Ezequiel Garcia (8):
>    watchdog: orion: Introduce a SoC-specific RSTOUT mapping
>    watchdog: orion: Remove unneeded atomic access
>    watchdog: orion: Introduce per-SoC stop() function
>    watchdog: orion: Introduce per-SoC enabled() function
>    watchdog: orion: Add Armada 375/380 SoC support
>    ARM: mvebu: Enable Armada 375 watchdog in the devicetree
>    ARM: mvebu: Enable Armada 380/385 watchdog in the devicetree
>    ARM: mvebu: Add A375/A380 watchdog binding documentation
>
>   .../devicetree/bindings/watchdog/marvel.txt        |   7 +
>   arch/arm/boot/dts/armada-375.dtsi                  |   6 +
>   arch/arm/boot/dts/armada-38x.dtsi                  |   7 +
>   drivers/watchdog/orion_wdt.c                       | 180 +++++++++++++++++++--
>   4 files changed, 188 insertions(+), 12 deletions(-)
>
For the series:
	Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
