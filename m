From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] USB: misc: Add USB3503 High-Speed Hub Controller
Date: Sun, 30 Dec 2012 19:22:00 -0800
Message-ID: <20121231032200.GA5769@kroah.com>
References: <1356922268-13098-1-git-send-email-tobetter@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1356922268-13098-1-git-send-email-tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongjin Kim <tobetter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, =?iso-8859-1?Q?Ren=E9_B=FCrgel?= <rene.buergel-h7yWMHjYvuCzQB+pC5nmwQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 31, 2012 at 11:50:54AM +0900, Dongjin Kim wrote:
> This patch adds new driver of SMSC USB3503 USB 2.0 hub controller with HSIC
> upstream connectivity and three USB 2.0 downstream ports. The specification
> can be found from 'http://www.smsc.com/index.php?tid=295&pid=325'.
> 
> The current version have been tested very basic features switching the modes,
> HUB-MODE and STANDBY-MODE.

What causes the modes to be switched?  From reading the driver, that
only seems possible to do at boot/load time when the driver reads the
platform data, right?  After that, nothing happens to the device from
what I can tell.

Is something going to cause the state of the device to change in the
future?

> +		hub->mode = mode;
> +		dev_info(&i2c->dev, "switched to HUB mode\n");

Can you please switch all of the dev_info() calls to dev_dbg()?  There's
no need to tell the world what is going on in this driver, no one really
cares.  And if they do, they can dynamically enable debugging and get
the information then :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
