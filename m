From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Marvell PXA1928 USB support
Date: Tue, 9 Jun 2015 12:22:12 -0700
Message-ID: <20150609192212.GA4386@kroah.com>
References: <1432917526-9688-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432917526-9688-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 29, 2015 at 11:38:40AM -0500, Rob Herring wrote:
> This series adds USB PHYs and EHCI host drivers for the Marvell PXA1928
> SOC.
> 
> The OTG block is based on ChipIdea and works with the "chipidea,usb2"
> compatible driver as is just by adding the PHY driver. Yay! After more 
> testing it turns out the EHCI host is also based on ChipIdea too. So 
> this version uses the ChipIdea driver for both. A couple of fixes are 
> needed to make the ChipIdea driver work with the PXA1928 EHCI host.

Given that these crossed a number of different trees, I've just queued
them all up in mine, as they would eventually make their way to it
anyway.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
