From: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Subject: Re: USB support for device tree
Date: Fri, 4 Nov 2011 08:43:56 -0700
Message-ID: <20111104154356.GA30439@kroah.com>
References: <4EB3A165.8060300@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EB3A165.8060300-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 04, 2011 at 01:55:09PM +0530, Pavan Kondeti wrote:
> Hi
> 
> I am working on adding USB device tree support for MSM platform.  One of
> our chip set has 2 hsusb cores. The first core is configured as otg and
> the other core is configured in host only mode (EHCI compliant). Are the
> below device node names Okay? Please suggest.

Why do you need to name the speed of the device and the host?  That
doesn't really matter if you plug a low-speed device into that super
speed host controller, right?

I'm not familiar with device tree naming conventions, but is this
something you do for network devices?  If not, I'd not recommend it for
USB controllers either.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
