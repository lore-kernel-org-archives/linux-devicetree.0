From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: imx6sx-sdb: Convert from fbdev to drm
 bindings
Date: Thu, 21 Dec 2017 16:22:57 +0800
Message-ID: <20171221082256.GN23230@dragon>
References: <1512573319-6624-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1512573319-6624-1-git-send-email-marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 06, 2017 at 01:15:17PM -0200, Marco Franchi wrote:
> It is preferred to use the panel compatible string rather than passing
> the LCD timing in the device tree.
> 
> So pass the "sii,43wvf1g" compatible string, which describes the parallel
> LCD.
> 
> Also pass the 'backlight' property as described in
> Documentation/devicetree/bindings/display/panel/simple-panel.txt
> 
> Signed-off-by: Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied all, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
