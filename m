From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Watchdog support for Armada 375/38x SoC
Date: Tue, 4 Mar 2014 12:53:41 -0500
Message-ID: <20140304175341.GO1872@titan.lakedaemon.net>
References: <1393949244-5011-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393949244-5011-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Ezequiel,

On Tue, Mar 04, 2014 at 01:07:17PM -0300, Ezequiel Garcia wrote:
> Here's a new patchset adding support for watchdog on Armada 375 and
> Armada 38x SoCs. Regarding the previous patchset, this time we're handling
> the SoCs differences in the watchdog driver itself.
> 
> The new Armada 375/385 SoCs have two registers for the watchdog RSTOUT:
> 
>  1. It has a dedicated register (similar to the one in A370/XP)
>  2. Also has a bit in a shared RSTOUT register.
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
> Changes from v1:
> 
>   * Reworked entirely!
> 
> Ezequiel Garcia (7):
>   watchdog: orion: Introduce a SoC-specific RSTOUT mapping
>   watchdog: orion: Introduce per-SoC stop() function
>   watchdog: orion: Introduce per-SoC enabled() function
>   watchdog: orion: Add Armada 375/380 SoC support
>   ARM: mvebu: Enable Armada 375 watchdog in the devicetree
>   ARM: mvebu: Enable Armada 380/385 watchdog in the devicetree
>   ARM: mvebu: Add A375/A380 watchdog binding documentation
> 
>  .../devicetree/bindings/watchdog/marvel.txt        |   7 +
>  arch/arm/boot/dts/armada-375.dtsi                  |   6 +
>  arch/arm/boot/dts/armada-38x.dtsi                  |   7 +
>  drivers/watchdog/orion_wdt.c                       | 167 +++++++++++++++++++--
>  4 files changed, 177 insertions(+), 10 deletions(-)

>From a cursory look, this is a big improvement.  Just one small note:  I
almost didn't see this, since I wasn't in the Cc.  No need to resend, I
bounced it around to the right folders so I can track it.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
