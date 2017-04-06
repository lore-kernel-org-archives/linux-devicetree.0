From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: Add support for phyCORE-RK3288 SoM
Date: Fri, 07 Apr 2017 00:21:43 +0200
Message-ID: <2316800.SYqXzj6arr@phil>
References: <1491483866-18368-1-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491483866-18368-1-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 6. April 2017, 15:04:24 CEST schrieb Wadim Egorov:
> The phyCORE-RK3288 is a SoM (System on Module) containing a RK3288 SoC.
> The module can be connected to different carrier boards.
> It can be also equipped with different RAM, SPI flash and eMMC variants.
> The Rapid Development Kit option is using the following setup:
> 
>   - 1 GB DDR3 RAM (2 Banks)
>   - 1x 4 KB EEPROM
>   - DP83867 Gigabit Ethernet PHY
>   - 16 MB SPI Flash
>   - 4 GB eMMC Flash
> 
> Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>

applied all 3 for 4.12 .

One minor change was making the touchscreen node name in patch2 read
	touchscreen@44

Same rationale as before, nodes should be named after the device-category


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
