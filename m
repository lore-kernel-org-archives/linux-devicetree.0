From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCHv5][ 1/5] fbdev: Add the lacking FB_SYNC_* for matching
	the DISPLAY_FLAGS_*
Date: Fri, 10 Jan 2014 12:46:53 +0000
Message-ID: <20140110124653.GA15937@n2100.arm.linux.org.uk>
References: <1383915693-9422-1-git-send-email-denis@eukrea.com> <52CFE994.8070701@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CFE994.8070701-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 10, 2014 at 02:37:40PM +0200, Tomi Valkeinen wrote:
> I don't think this is better than the previous version where
> FB_SYNC_DE_HIGH_ACT and FB_SYNC_PIXDAT_HIGH_ACT were in
> include/uapi/linux/fb.h. Now those flag defines are not visible to the
> userspace, but the actual flags are still visible from the var->sync field.
> 
> It's true what Russell replied to the previous version, that the
> userspace has no idea how to handle those new flags. But then again, for
> LCDs, the userspace has no idea how to handle, say, hsync polarity either.
> 
> In any case, splitting the FB_SYNC_ defines into uapi and
> kernel-internal header files, but still giving the kernel-internal
> values to userspace is surely wrong.

The difference between the sync states and these other flags is that
the sync states are part of the mode definition - as per the CEA-861
documentation.

However, that does not extend to LCD panels, which generally need to
have one set of timings, with the various control signals at certain
polarities - and those control signal polarities are a property of
the panel itself, not of the displayed mode.  So, if you know that
you have LCD panel X, and it needs control signals with a certain
polarity, that is how you configure the hardware _irrespective_ of
what userspace says that the sync states should be.

The sync states specified by userspace should of course be used for
the sync pulses being sent to a VGA display or HDMI sink.

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
