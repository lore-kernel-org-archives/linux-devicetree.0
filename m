From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: dts: phy3250: add SD fixed regulator
Date: Sun, 20 Dec 2015 04:14:19 +0200
Message-ID: <56760EFB.9070406@mleia.com>
References: <1450567932-22994-1-git-send-email-vz@mleia.com> <1450567932-22994-3-git-send-email-vz@mleia.com> <20151219234848.GT8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151219234848.GT8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20.12.2015 01:48, Russell King - ARM Linux wrote:
> On Sun, Dec 20, 2015 at 01:32:11AM +0200, Vladimir Zapolskiy wrote:
>> @@ -162,6 +171,7 @@
>>  				cd-gpios = <&gpio 3 1 0>;
>>  				cd-inverted;
>>  				bus-width = <4>;
>> +				vqmmc-supply = <&sd_reg>;
> 
> This looks wrong.  ios->power_mode controls the _card_ power (which is
> vmmc-supply), not the signalling power (which is vqmmc-supply):

>From drivers/mmc/host/mmci.c mmci_set_ios() manages both regulators,
mmc->supply.vmmc is changed on MMC_POWER_OFF and MMC_POWER_UP,
mmc->supply.vqmmc is changed on MMC_POWER_OFF and MMC_POWER_ON.

But I agree that vmmc-supply is the right choice here, GPIO regulator
controls an SD card power here, thanks for the finding.

> - vmmc-supply            : phandle to the regulator device tree node, mentioned
>                            as the VCC/VDD supply in the eMMC/SD specs.
> 
> - vqmmc-supply           : phandle to the regulator device tree node, mentioned
>                            as the VCCQ/VDD_IO supply in the eMMC/SD specs.
> 
> 

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
