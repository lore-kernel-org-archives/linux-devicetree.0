From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 0/5] Kirkwood DT Documentation
Date: Mon, 7 Apr 2014 12:59:42 -0400
Message-ID: <20140407165942.GH28334@titan.lakedaemon.net>
References: <1395492360-1865-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395492360-1865-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 22, 2014 at 01:45:55PM +0100, Andrew Lunn wrote:
> This patchset fixes up a number of issues found by checkpatch in the
> kirkwood DT files or binding Documentation. Vendor Prefixes are
> documented, missing prefixes are added, incorrect prefixes are
> corrected, and Kirkwood SoCs are documented.
> 
> Note that some of these patches contain UTF-8 characters, which the
> mailing lists sometime don't like. The patches can also be found in
> 
> https://github.com/lunn/linux.git v3.14-rc7-next-20140321-dt
> 
> which is based on linux-next tag next-20140321.
> 
> Andrew Lunn (5):
>   DT: Vendor: Add prefixes used by Kirkwood devices
>   DT: bindings: add missing Marvell Kirkwood SoC documentation
>   ARM: Kirkwood: Fix Atmel vendor prefix
>   DT: I2C: Add trivial bindings used by kirkwood boards
>   ARM: Kirkwood: DT: Add missing vendor prefix

Patches 3 and 5 five taken in to mvebu/dt-fixes-non-critical for v3.15.
Updated our for-next branch.

If all goes well, I'll send a pull request later in the week.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
