From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch v3 resend] Documentation: dt-bindings: aspeed-pwm-tacho
 cooling device.
Date: Thu, 10 Aug 2017 12:11:42 -0500
Message-ID: <20170810171142.zwlnagp7c52p4r5e@rob-hp-laptop>
References: <20170803084650.22298-1-c_mykolak@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170803084650.22298-1-c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Ohad Oz <ohado-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 11:46:50AM +0300, Mykola Kostenok wrote:
> It's add support for cooling device creation to
> aspeed-pwm-tacho.
> Cooling device could be bound to a thermal zone
> for the thermal control.
> 
> v1 -> v2:
>  - Fix commit message.
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
> 
> Signed-off-by: Mykola Kostenok <c_mykolak-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
