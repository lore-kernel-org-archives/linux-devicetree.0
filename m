From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: rockchip: temporarily remove emmc hs200 speed from rk3288-veyron-speedy.
Date: Fri, 14 Oct 2016 16:18:06 +0200
Message-ID: <1556360.cZVpdmzNha@phil>
References: <87twd1vzc5.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87twd1vzc5.fsf-LkDtOWtB3X7R7s880joybQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vagrant Cascadian <vagrantc-LkDtOWtB3X7R7s880joybQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 27. September 2016, 13:53:46 CEST schrieb Vagrant Cascadian:
> This essentially mimics what was done with rk3288-veyron-minnie in
> commit 984926781122f034d5bc9962815d135b6c4a8e1d.
> 
> The eMMC of the speedy Chromebook also appears to need the same tuning
> workaround, as it frequently fails to recognize the eMMC without it.
> 
> Signed-off-by: Vagrant Cascadian <vagrantc-LkDtOWtB3X7R7s880joybQ@public.gmane.org>

applied as fix for 4.9.

Your mail client mangled that patch a lot (tabs etc), so it didn't apply 
cleanly. As it is a quite small one, I fixed that up myself, but please try to 
make your mail client send correct patches in the future or use git send-email 
:-)


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
