From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v7 2/7] mailbox: arm_mhu: add driver for ARM MHU
 controller
Date: Thu, 26 Mar 2015 11:49:55 +0000
Message-ID: <20150326114955.GE8656@n2100.arm.linux.org.uk>
References: <1425466367-30556-1-git-send-email-vincent.yang@socionext.com>
 <1425466884-30648-1-git-send-email-vincent.yang@socionext.com>
 <5513F0D9.5080807@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5513F0D9.5080807-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.cw.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vincent Yang <vincent.yang-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Tetsuya Nuriya <nuriya.tetsuya-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2015 at 11:43:21AM +0000, Sudeep Holla wrote:
> I tried using this driver and found that AMBA driver expects apb_clk
> without which probe fails. Though your example have it, it's not
> explicit from the binding. Also AMBA binding expects the primecell id in
> the binding.

That's optional:

Optional properties:

- arm,primecell-periphid : Value to override the h/w value with

It's only required when the hardware doesn't provide the correct value.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
