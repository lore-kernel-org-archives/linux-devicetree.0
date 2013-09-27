From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32
	Cortex-M3 SoCs
Date: Fri, 27 Sep 2013 22:55:23 +0100
Message-ID: <20130927215523.GO12758@n2100.arm.linux.org.uk>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de> <201309172245.25367.arnd@arndb.de> <20130926094251.GK16106@pengutronix.de> <201309272344.01386.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201309272344.01386.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 11:44:01PM +0200, Arnd Bergmann wrote:
> * Do you need any other patches (unrelated to EFM32) to run NOMMU on a
> recent kernel? When I last tried, I could not get any NOMMU build to work
> at all.

My Oki platform builds fine.  The core noMMU stuff seems fine.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
