From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 2/8] ARM: sunxi: Split out the various
 machines into separate files
Date: Wed, 23 Apr 2014 14:33:50 +0200
Message-ID: <201404231433.51129.arnd@arndb.de>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com> <1397724379-15398-3-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: Text/Plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBOPG32NAKGQEIN22S3Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1397724379-15398-3-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 17 April 2014, Maxime Ripard wrote:
> This will allow to add per-SoC hooks more easily.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/mach-sunxi/Makefile  |   6 +-
>  arch/arm/mach-sunxi/restart.c | 104 +++++++++++++++++++++++++++
>  arch/arm/mach-sunxi/restart.h |  20 ++++++
>  arch/arm/mach-sunxi/sun4i.c   |  36 ++++++++++
>  arch/arm/mach-sunxi/sun5i.c   |  37 ++++++++++
>  arch/arm/mach-sunxi/sun6i.c   |  49 +++++++++++++
>  arch/arm/mach-sunxi/sun7i.c   |  36 ++++++++++
>  arch/arm/mach-sunxi/sunxi.c   | 164 ------------------------------------------
>  8 files changed, 287 insertions(+), 165 deletions(-)

This doesn't look like a move in the right direction, and I don't see
the connection with the DMA driver.

> diff --git a/arch/arm/mach-sunxi/restart.c b/arch/arm/mach-sunxi/restart.c
> new file mode 100644
> index 000000000000..3b89727ee943
> --- /dev/null
> +++ b/arch/arm/mach-sunxi/restart.c

Splitting out the restart code is good, but please complete this by
moving it into a driver directory. My preferred location would be
within the watchdog driver, since it's really the same registers.
You can turn on the watchdog driver as built-in in the defconfig.
While it's not ideal that you can end up without a restart function
if the driver does not get loaded, I would still prefer that over
having the driver in the mach-sunxi directory.

An alternative would be to move the restart code into
drivers/power/reset.

> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> deleted file mode 100644
> index 460b5a4962ef..000000000000
> --- a/arch/arm/mach-sunxi/sunxi.c

Instead of splitting up this file, I think it would be better to
reduce the number of special hacks required per machine. Note that
for arm64 we require platforms not to have any code outside of
the drivers directory, and I'd like to get to the same situation
for much of arch/arm/mach-* as well.

	Arnd
