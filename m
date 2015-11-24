From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH (v2) 7/10] watchdog: bcm63xx_wdt: Add get_timeleft function
Date: Tue, 24 Nov 2015 14:43:32 -0800
Message-ID: <5654E814.6030807@gmail.com>
References: <5650BFD6.5030700@simon.arlott.org.uk>    <5650C08C.6090300@simon.arlott.org.uk> <5650E2FA.6090408@roeck-us.net>    <5650E5BB.6020404@simon.arlott.org.uk> <56512937.6030903@roeck-us.net>    <5651CB13.4090704@simon.arlott.org.uk>    <5651CC90.7090402@simon.arlott.org.uk> <a1461a17c94353f38316d2c6ae04d6b77c91bfd4@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a1461a17c94353f38316d2c6ae04d6b77c91bfd4-dyyJQ+qCPjsfFgGGEbPnq5KvX+y0N6jJ2mWzQvkZbzCn6nfhxgf73RdaaeUjXGGo@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/11/15 14:15, Simon Arlott wrote:
> Return the remaining time from the hardware control register.
> 
> Warn when the device is registered if the hardware watchdog is currently
> running and report the remaining time left.
> 
> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>

Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

At some point, we should probably consider merging bcm63xx_wdt with
bcm7038_wdt which are nearly 100% identical pieces of hardware (coming
from the same design group originally).
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
