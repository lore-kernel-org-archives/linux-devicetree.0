From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Fri, 15 Jun 2012 23:34:07 +0800
Message-ID: <20120615153404.GM31565@S2101-09.ap.freescale.net>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
 <4FD8AD42.6010702@gmail.com>
 <20120613152841.GA23590@richard-laptop>
 <201206131800.38622.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201206131800.38622.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 13, 2012 at 06:00:38PM +0200, Marek Vasut wrote:
> Write a driver that does the GPIO setup in some generic way? Wasn't there 
> something about this stuff going on? Shawn, you had some comments /wrt the M28 
> DTS. This might be what you meant?
> 
No.  What Richard is looking for is a way to set/clear gpio, while
what I was commenting on M28 DTS is the way to configure a pin into
gpio mode.  In this series, Richard chose to use "hog" feature to
configure the pin into gpio mode, which means defining a pinctrl state
for pin controller node itself, then at pinctrl subsystem init time,
pinctrl core will configure these "hog" pins properly.

The "hog" method makes some sense for Richard's case, where the pin
has no clear device/driver owner, and when gpio_request call can not
configure the requested pin into gpio mode automatically yet.

-- 
Regards,
Shawn

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
