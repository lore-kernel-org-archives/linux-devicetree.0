From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC 1/7] platform: add a device node
Date: Sat, 9 Feb 2013 17:02:46 -0800
Message-ID: <20130210010246.GA1455@kroah.com>
References: <1360442671-15216-1-git-send-email-javier.martinez@collabora.co.uk>
 <1360442671-15216-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1360442671-15216-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-omap-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Tony Lindgren <tony@atomide.com>, =?iso-8859-1?Q?Beno=EEt?= Cousson <b-cousson@ti.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Enric Balletbo i Serra <eballetbo@gmail.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 09, 2013 at 09:44:25PM +0100, Javier Martinez Canillas wrote:
> When using Device Trees, it is necessary to associate a
> device node with a platform device.
> 
> Usually this device node has to used in the device probe
> function (e.g: to initizalize the pinctrl pads assocaited
> with the device).
> 
> So, platform code needs to pass a device node as a platform
> device info to the platform device registration function.

Really?  We don't already have enough other pointers in the platform
device structure that we need another one?

I don't buy it, sorry.  Any reason you didn't run this by Grant as well?

greg k-h
