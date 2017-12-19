From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add minimal device tree for compute model 3
Date: Tue, 19 Dec 2017 18:16:09 +0100 (CET)
Message-ID: <391028930.257226.1513703769801@email.1und1.de>
References: <20171124121813.11318-1-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171124121813.11318-1-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

> kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org hat am 24. November 2017 um 13:18 geschrieben:
> 
> 
> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
> 
> Add a minimal working device tree for the compute model 3
> for both arm and arm64.
> 

just a note before you send a V2. Recently i looked at the CM datasheet (revision 1.0) and noticed on the block diagram (page 8) that the CM3 eMMC I/O voltage is fixed at 1.8 Volt (doesn't apply to CM3 lite). Providing a fixed regulator for vmmc/vqmmc-supply [1] would give the MMC core the chance to figure out the right voltage.

[1] - http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/mmc/mmc.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
