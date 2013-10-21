From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something better?
Date: Mon, 21 Oct 2013 21:09:32 +0100
Message-ID: <526589FC.9050805@wwwdotorg.org>
References: <52644A9E.3060007@wwwdotorg.org> <20131020231134.GR25034@n2100.arm.linux.org.uk> <20131021083242.GB30088@pengutronix.de> <20131021084854.GV25034@n2100.arm.linux.org.uk> <20131021092730.GF30088@pengutronix.de> <20131021095757.GY25034@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131021095757.GY25034-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/21/2013 10:57 AM, Russell King - ARM Linux wrote:
> On Mon, Oct 21, 2013 at 11:27:30AM +0200, Sascha Hauer wrote:
>> If you have a better vision how imx-drm can be implemented without
>> getting crazy I'd love to hear about it. Please also think about the two
>> IPUs the i.MX6 has, the single one on i.MX5, parallel displays, HDMI
>> displays, LVDS displays, VGA encoder on i.MX53, external I2C slave
>> encoders,...
> 
> Well, the multi-driver solution is just too fragile: the problem
> with it is you can never be sure when all the drivers have definitely
> finished initialising.  This problem is made much worse should one of
> them use deferred probing.

ASoC has a very similar structure; e.g. an I2S controller and DMA
controller within the SoC, an external audio CODEC, and an I2C (or SPI?)
controller to communicate with the CODEC, all make up a "sound card".
ASoC solves this by having a "sound card" device to represent the
aggregation. This translates into a DT node for the "sound card". That
node is slightly virtual in that in some ways it doesn't really
represent specific HW on the board. Yet, in other ways it really does;
at the very least it represents the PCB wiring between all those
different components that it aggregates and the intent of the existence
of all those components in HW to create a sound output feature. Perhaps
something similar can be done for DRM?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
