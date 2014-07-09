From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: keystone: enable mdio support
Date: Wed, 9 Jul 2014 10:24:45 -0400
Message-ID: <53BD50AD.80704@ti.com>
References: <1404911660-10047-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404911660-10047-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 09 July 2014 09:14 AM, Strashko, Grygorii wrote:
> Add DT definitions for Keystone 2 MDIO module and Ethernet PHYs for Keystone
> EVMK2HX evm. And enable MDIO support for Keystone 2 SoCs.
> 
> Grygorii Strashko (3):
>   ARM: dts: keystone: add mdio devices entries
>   ARM: dts: keystone-evm: add 1g ethernet phys nodes
>   ARM: keystone_defconfig: enable mdio and marvell eth phys
> 
Series looks good. I will merge it when the driver changes gets
merged. Please ping me just in case I forget about it.

Thanks !!

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
