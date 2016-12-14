From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH linux v1 0/4] Seven segment display support
Date: Wed, 14 Dec 2016 13:45:30 +0100
Message-ID: <20161214134530.2bd54a4e@free-electrons.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Tue, 13 Dec 2016 23:55:00 -0800, Jaghathiswari Rankappagounder
Natarajan wrote:

> Documentation for the binding which provides an interface for adding clock,
> data and clear signal GPIO lines to control seven segment display.
> 
> The platform device driver provides an API for displaying on two 7-segment
> displays, and implements the required bit-banging. The hardware assumed is
> 74HC164 wired to two 7-segment displays.
> 
> The character device driver implements the user-space API for letting a user
> write to two 7-segment displays including any conversion methods necessary
> to map the user input to two 7-segment displays.
> 
> Adding clock, data and clear signal GPIO lines in the devicetree to control
> seven segment display on zaius platform.
> 
> The platform driver matches on the device tree node; the platform driver also
> initializes the character device.
> 
> Tested that the seven segment display works properly by writing to the
> character device file on a EVB AST2500 board which also has 74HC164 wired
> to two 7-segment displays.

FWIW, I proposed a driver for seven segment displays back in 2013:

   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139986.html

And the feedback from Greg KH was: we don't need a driver for that, do
it from userspace. See:

   http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/139992.html

So: good luck :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
