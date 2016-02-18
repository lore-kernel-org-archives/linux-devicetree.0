From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-microsom.dtsi: avoid boot-time UHS
 warning
Date: Thu, 18 Feb 2016 21:35:39 +0800
Message-ID: <20160218133539.GW6756@tiger>
References: <E1aVMgw-0001wE-5w@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1aVMgw-0001wE-5w-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 15, 2016 at 05:12:06PM +0000, Russell King wrote:
> Avoid the following warning:
> 
> sdhci-esdhc-imx 2190000.usdhc: could not get ultra high speed state, work on normal mode
> 
> which occurs at boot each time the SDHCI interface for the Broadcom
> WiFi is probed.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Not sure why you resend, but I already applied the following series you
sent on Jan. 27 [1].

[PATCH 1/3] ARM: dts: imx6qdl-microsom.dtsi: avoid boot-time UHS warning
[PATCH 2/3] ARM: dts: imx6*-hummingboard: use proper gpio flags definitions
[PATCH 3/3] ARM: dts: imx6*-hummingboard: fix pcie reset GPIO specification

Shawn

[1] http://permalink.gmane.org/gmane.linux.drivers.devicetree/154097
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
