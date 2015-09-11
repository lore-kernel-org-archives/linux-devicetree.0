From: Martin Sperl <martin-d5rIkyn9cnPYtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: bcm2835: Add a driver for the auxiliary peripheral clock gates.
Date: Fri, 11 Sep 2015 12:24:50 +0200
Message-ID: <D051D944-F10B-460F-AF10-8C177A3A7E3D@sperl.org>
References: <1441923750-19404-1-git-send-email-eric@anholt.net> <1441923750-19404-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441923750-19404-3-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On 11.09.2015, at 00:22, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> 
> There are a pair of SPI masters and a mini UART that were last minute
> additions.  As a result, they didn't get integrated in the same way as
> the other gates off of the VPU clock in CPRMAN.
> 
> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ---

Tested with the spi-bcm2835aux driver and it works perfectly.
I will now post the latest incarnation of the driver for inclusion.

I have also tested with the uart1 and it works in principle.

Note that there is one issue (as mentioned elsewhere) with uart1:
the 8250 serial driver has a (hardcoded) internal clock divider 16,
while the hardware has an internal divider of 8.

This results in baud rates that are a factor of 2 higher than requested.

Tested-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
