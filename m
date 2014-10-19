From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] misc: Add Wi2Wi w2sc0004 gps driver
Date: Sun, 19 Oct 2014 21:51:27 +0200
Message-ID: <9266107.dnSTmzxRsf@wuerfel>
References: <1413491183-15018-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413491183-15018-1-git-send-email-marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 16 October 2014 22:26:22 Marek Belisko wrote:
> This is a driver for the Wi2Wi GPS modules connected through an UART.
> The tricky part is that the module is turned on or off by an impulse
> on the control line - but it is only possible to get the real state by monitoring
> the UART RX input. Since the kernel can't know in which status the module
> is brought e.g. by a boot loader or after suspend, we need some logic to handle
> this.
> 
> The driver allows two different methods to enable (and power up) GPS:
> a) through rfkill
> b) as a GPIO
> 
> The GPIO enable can be plumbed to other drivers that expect to be able to control
> a GPIO. On the GTA04 board this is the DTR-gpio of the connected UART so that
> opening the UART device enables the receiver and closing it shuts the receiver down.
> 
> Original implementation by Neil Brown, fixes + DT bindings by H. Nikolaus Schaller

I'm not sure if this is a good way to model the device. You say that it's
connected to a UART, but the code itself has no reference to the tty layer
at all. I assume the actual driver is in user space and it would open the
UART and this control device as separate instances handles and then try
to coordinate them. Is that right?

What is the protocol for the GPS driver itself? Is it standardized?
Would it help to have a TTY line discipline for the GPS mode instead
so the power management and startup could be integrated into the serial
port management instead?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
