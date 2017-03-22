From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 2/4] arm64: dts: rockchip: add Gru/Kevin DTS
Date: Wed, 22 Mar 2017 10:57:40 -0700
Message-ID: <20170322175739.GB98450@google.com>
References: <20170320235344.126298-1-briannorris@chromium.org>
 <20170320235344.126298-3-briannorris@chromium.org>
 <2390473.XAgkTqANPY@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2390473.XAgkTqANPY@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 12:59:37PM +0100, Heiko Stuebner wrote:
> Am Montag, 20. März 2017, 16:53:42 CET schrieb Brian Norris:
> > Kevin is part of a family of boards called Gru. As best as possible, the
> > properties shared by the Gru family are placed in rk3399-gru.dtsi, while
> > Kevin-specific bits are in rk3399-gru-kevin.dts. This does not add full
> > support for the base Gru board.
> > 
> > Working and tested (to some extent):
> >  * EC support -- including keyboard, battery, PWM, and probably more
> >  * UART / console
> >  * Thermal
> >  * Touchscreen
> >  * Touchpad
> >  * Digitizer (regulator still WIP)
> >  * PCIe / Wifi
> >  * Bluetooth / Webcam
> >  * SD card
> >  * eMMC
> >  * USB2 on TypeC
> >    - This works much of the time, but USB3 devices may or may not detect
> >      properly. Waiting on proper extcon support for USB3 over TypeC.
> >    - Depends on XHCI/DWC3 fixes for ARM64 that still haven't landed
> >  * Backlight
> > 
> > Not working:
> >  * CPUFreq -- relies on special OVP support for our PWM regulator
> >    circuits
> >  * EC / extcon support -- and with it, USB3/TypeC/DP
> >  * DRM -- won't even build on ARM64, so all display, eDP, etc. is not
> >    enabled
> > 
> > Not tested:
> >  * Audio
> > 
> > Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> applied for 4.12 with Enric's Tested-tag after some reordering of nodes/
> properties.

I realize I didn't catch 100% of the comments you wanted dropped. Thanks
for cleaning it.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
