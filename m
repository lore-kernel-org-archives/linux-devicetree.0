From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 15:15:09 +0000
Message-ID: <20110318151508.GC677@opensource.wolfsonmicro.com>
References: <20110311165642.GA9996@kroah.com>
 <201103172333.01474.arnd@arndb.de>
 <4D82979B.2050003@linaro.org>
 <201103181600.09877.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201103181600.09877.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2011 at 04:00:09PM +0100, Arnd Bergmann wrote:
> On Friday 18 March 2011, Andy Green wrote:

> > What's the plan for leveraging that level of generality on "dynamically 
> > probed devices"?  I mean I know what I want to use this for and the 
> > platform_data scheme covers all the soldered-on-the-board cases fine.

> Isn't there also a device tree based OMAP tree that can boot on
> Panda and is just waiting to get merged?

Did the stuff with multiple interrupt controllers get resolved?  That's
pretty important for practical use.  There have been quite a few
iterations of the device tree patches for ARM over the last release but
the iterations I looked at all seemed to be bugfix type stuff.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
