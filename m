From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] powerpc: Make Book E watchdog reset type configurable
Date: Fri, 3 May 2013 06:46:10 -0700
Message-ID: <20130503134610.GA31037@roeck-us.net>
References: <1367505913-18970-1-git-send-email-dirk.eibach@gdsys.cc>
 <20130502161720.GA7797@roeck-us.net>
 <429ec64cf7c30a139db40eb20fd3e682@gdsys.cc>
 <20130503011741.GA23266@roeck-us.net>
 <7be2cb3417615ff206270a756c6422d6@gdsys.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7be2cb3417615ff206270a756c6422d6@gdsys.cc>
Sender: linux-kernel-owner@vger.kernel.org
To: Dirk Eibach <dirk.eibach@gdsys.cc>
Cc: linux-kernel@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2013 at 10:33:13AM +0200, Dirk Eibach wrote:
> Hi Guenter,
> 
> >>>>diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> >>>>index e89fc31..6048593 100644
> >>>>--- a/drivers/watchdog/Kconfig
> >>>>+++ b/drivers/watchdog/Kconfig
> >>>>@@ -1172,6 +1172,38 @@ config BOOKE_WDT_DEFAULT_TIMEOUT
> >>>>
> >>>>	  The value can be overridden by the wdt_period command-line
> >>>>parameter.
> >>>>
> >>>>+choice
> >>>>+	prompt "PowerPC Book-E Watchdog reset type"
> >>>>+	depends on BOOKE_WDT
> >>>>+	default BOOKE_WDT_RESET_CHIP
> >>>>+	help
> >>>>+	  Specify what kind of reset will be executed on watchdog
> >>>>timeout.
> >>>>+
> >>>Seems to me it would be much better to make this configurable via
> >>>platform data
> >>>and/or device tree.
> >>
> >>good catch. What do the device-tree gurus think to be a nice
> >>property name?
> 
> having a closer look, I realized booke_wdt is not device-tree based
> yet. Migrating it would come close to a rewrite, breaking
> compatibility for all current users. Sorry, this is way beyond the

Really ? I don't think making it a platform driver would be that hard,
or break anything.

> time I have for this project. So I suggest merging the change the
> way it is, as it is clearly an improvement.
> 
That will be up to Wim to decide.

Thanks,
Guenter
