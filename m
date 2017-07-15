From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch v1] Documentation: dt-bindings: aspeed-pwm-tacho cooling
 device.
Date: Fri, 14 Jul 2017 20:33:46 -0500
Message-ID: <20170715013346.fgqysvlu2prts7zn@rob-hp-laptop>
References: <20170711131827.64045-1-c_mykolak@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170711131827.64045-1-c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 04:18:27PM +0300, Mykola Kostenok wrote:
> This binding adds description for interface supporting
> aspeed-pwm-tacho driver cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control.

Bindings are for devices, not drivers.

 
> It adds extra level of hierarchy -  for tachometer channel
> with fan subnodes and pwm channels with pwm subnodes.

Why this binding was just added and now it is changing?

> 
> Signed-off-by: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 56 ++++++++++++++++++----
>  1 file changed, 47 insertions(+), 9 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
