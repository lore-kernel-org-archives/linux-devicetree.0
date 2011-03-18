From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: RFC: Platform data for onboard USB assets
Date: Fri, 18 Mar 2011 23:25:53 +0000
Message-ID: <20110318232553.GA11422@opensource.wolfsonmicro.com>
References: <20110311165642.GA9996@kroah.com> <201103181600.09877.arnd@arndb.de> <4D839BCD.6030202@linaro.org> <201103182106.13888.arnd@arndb.de> <4D83CF8C.3020605@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D83CF8C.3020605-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 18, 2011 at 09:33:00PM +0000, Andy Green wrote:

> Well: Greg was also reduced to explaining that device renaming in  
> userland was decided "a long time ago".  It's not argumentation, it is  
> an appeal to an alleged tradition.

The story with device renaming is fairly simple - nobody could agree on
what the ideal names should be and different userlands ended up wanting
different things so rather than try to keep everyone happy the kernel
picked the simplest policy possible and let userland override it to its
heart's content.

> You think that striving away to create this Device Tree description of a  
> specific board and maintaining it in a bootloader is LESS work somehow  
> that registering platform devices in an array in the board definition  
> file?  I think not.

It's more the fact that it can be distributed separately to the kernel
which reduces the pressure to mainline the basic board description stuff
for ongoing maintinance.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
