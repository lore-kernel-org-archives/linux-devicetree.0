From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: dts: phy3250: add SD fixed regulator
Date: Sat, 19 Dec 2015 23:48:48 +0000
Message-ID: <20151219234848.GT8644@n2100.arm.linux.org.uk>
References: <1450567932-22994-1-git-send-email-vz@mleia.com>
 <1450567932-22994-3-git-send-email-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450567932-22994-3-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 20, 2015 at 01:32:11AM +0200, Vladimir Zapolskiy wrote:
> @@ -162,6 +171,7 @@
>  				cd-gpios = <&gpio 3 1 0>;
>  				cd-inverted;
>  				bus-width = <4>;
> +				vqmmc-supply = <&sd_reg>;

This looks wrong.  ios->power_mode controls the _card_ power (which is
vmmc-supply), not the signalling power (which is vqmmc-supply):

- vmmc-supply            : phandle to the regulator device tree node, mentioned
                           as the VCC/VDD supply in the eMMC/SD specs.

- vqmmc-supply           : phandle to the regulator device tree node, mentioned
                           as the VCCQ/VDD_IO supply in the eMMC/SD specs.


-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
