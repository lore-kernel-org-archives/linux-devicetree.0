From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/6] arm: mvebu: Add support for USB host controllers
 in Armada 370/XP
Date: Tue, 15 Jan 2013 07:49:45 -0300
Message-ID: <50F53449.8090001@free-electrons.com>
References: <1358243670-11935-1-git-send-email-ezequiel.garcia@free-electrons.com> <50F52E1F.8010702@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50F52E1F.8010702-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 01/15/2013 07:23 AM, Florian Fainelli wrote:
> Le 01/15/13 10:54, Ezequiel Garcia a =C3=A9crit :
>> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconf=
ig
>> index 440b13e..5e4fcde 100644
>> --- a/arch/arm/mach-mvebu/Kconfig
>> +++ b/arch/arm/mach-mvebu/Kconfig
>> @@ -24,6 +24,7 @@ config MACH_ARMADA_370_XP
>>       select HAVE_SMP
>>       select CACHE_L2X0
>>       select CPU_PJ4B
>> +    select USB_ARCH_HAS_EHCI if USB_SUPPORT
>=20
> I do not think this is actually required because ARCH_MVEBU selects P=
LAT_ORION and in drivers/usb/host/Kconfig, USB_ARCH_HAS_EHCI is default=
 y if PLAT_ORION. Having USB_ARCH_HAS_EHCI without USB_SUPPORT enabled =
is pretty harmless.

Yes, you're right, this is not needed.

Nice catch and thanks for the review,

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
