From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] usb: host: Allow to build ehci orion with mvebu SoCs
Date: Wed, 08 Mar 2017 18:24:15 +0100
Message-ID: <87o9xblm0w.fsf@free-electrons.com>
References: <20170308162423.25553-1-gregory.clement@free-electrons.com>
        <20170308162423.25553-3-gregory.clement@free-electrons.com>
        <20170308170136.GC32355@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170308170136.GC32355-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Wed,
        8 Mar 2017 18:01:36 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,
 
 On mer., mars 08 2017, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Wed, Mar 08, 2017 at 05:24:22PM +0100, Gregory CLEMENT wrote:
>> The mvebu ARM64 SoCs no more select PLAT_ORION but some of them as the
>> Armada 37xx use the EHCI orion controller. This patch allow to build
>> the driver when ARCH_MVEBU is selected.
>
> The mvebu ARM64 SoCs no longer selects PLAT_ORION.  However Armada
> 37xx use the Orion EHCI controller. This patch allows the Orion EHCI
> driver to be built when ARCH_MVEBU is selected.

Thanks for this enhancement!

>
>> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  drivers/usb/host/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>> index 407d947b34ea..870c42d89298 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -188,7 +188,7 @@ config USB_EHCI_HCD_OMAP
>>  
>>  config USB_EHCI_HCD_ORION
>>  	tristate  "Support for Marvell EBU on-chip EHCI USB controller"
>> -	depends on USB_EHCI_HCD && PLAT_ORION
>> +	depends on USB_EHCI_HCD && PLAT_ORION || ARCH_MVEBU
>
> I don't know the Kconfig language too well. Should this be:
>
>> +	depends on USB_EHCI_HCD && (PLAT_ORION || ARCH_MVEBU)

Your version seems better.

Thanks,

Gregory

>
>   Andrew
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
