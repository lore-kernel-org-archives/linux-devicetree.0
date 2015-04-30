From: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: vexpress: Add unified-cache Device Tree property
Date: Thu, 30 Apr 2015 15:30:11 +0200
Message-ID: <20150430133011.GE15254@pengutronix.de>
References: <5509437E.6060806@arm.com>
 <1426671298-2012-1-git-send-email-r.schwebel@pengutronix.de>
 <20150429191228.GO15254@pengutronix.de>
 <20150430110853.GN7440@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150430110853.GN7440-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Liviu,

On Thu, Apr 30, 2015 at 12:08:53PM +0100, Liviu Dudau wrote:
> Sorry Robert, this fell through the cracks. VExpress gets very few
> patches in general and we're new to this :(

Thanks for the help!

I still see these errors with 4.1-rc1:

[    0.000000] L2C: platform modifies aux control register: 0x02020000 -> 0x02420000
[    0.000000] L2C: DT/platform modifies aux control register: 0x02020000 -> 0x02420000
[    0.268626] platform 10000000.sysreg: Error -2 creating of_node link
[    0.271997] platform basic-mmio-gpio.1.auto: Error -2 creating of_node link
[    0.272266] platform basic-mmio-gpio.2.auto: Error -2 creating of_node link
[    0.272681] platform basic-mmio-gpio.3.auto: Error -2 creating of_node link
[    0.426298] of_amba_device_create(): amba_device_add() failed (-19) for /memory-controller@100e0000
[    0.426799] of_amba_device_create(): amba_device_add() failed (-19) for /memory-controller@100e1000
[    0.427099] of_amba_device_create(): amba_device_add() failed (-19) for /watchdog@100e5000
[    0.433206] of_amba_device_create(): amba_device_add() failed (-19) for /smb/motherboard/iofpga@7,00000000/sysctl@01000
[    0.438165] of_amba_device_create(): amba_device_add() failed (-19) for /smb/motherboard/iofpga@7,00000000/wdt@0f000

Do you have an idea what might go wrong?

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
