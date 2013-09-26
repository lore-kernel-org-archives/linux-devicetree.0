From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] dts: socfpga: Add ethernet support on Altera's SOCFPGA
 platform
Date: Thu, 26 Sep 2013 17:21:21 -0600
Message-ID: <5244C171.2040705@wwwdotorg.org>
References: <1380057120-27108-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380057120-27108-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/24/2013 03:11 PM, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> The STMMAC Ethernet controller in SOCFPGA requires setting a register for
> the phy-mode that is outside of the ethernet IP. This register resides in
> the System Manager block. So we define a new DTS binding
> "altr,sysmgr-phy-mask". This binding's property is a bitmask that can be
> used to set the correct register bit.

> diff --git a/Documentation/devicetree/bindings/net/stmmac-altr-socfpga.txt b/Documentation/devicetree/bindings/net/stmmac-altr-socfpga.txt

> +* altr,sysmgr-phy-mask: This property contains the bitmask that is needed to
> +	set the appropriate register bits for the phy-mode in the System Manager.
> +	The value should be:
> +		-Ethernet Controller 1 (gmac0) = 0x3
> +		-Ethernet Controller 2 (gmac1) = 0xC

Wouldn't you need a phandle to the sysmgr node so that the driver could
be located, and a register number within its register block too? Or,
does sysmgr know which register to poke? If so, couldn't the API take
just a device index rather than a bitmask instead, and calculate the
mask itself?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
