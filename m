From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/6] ARM: dts: Add PHYTEC phyCORE-i.MX 6 and
 phyBOARD-Mira carrier board support
Date: Fri, 2 Feb 2018 14:06:54 +0800
Message-ID: <20180202060653.GK20833@dragon>
References: <1515514200-9801-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515514200-9801-1-git-send-email-s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 09, 2018 at 05:09:54PM +0100, Stefan Riedmueller wrote:
> Changes since v4:
> - Rearranged &m25p80 node in dts files to fit alphabetical order
> - Fixed a parenthesis for uniformity in mira dtsi
> 
> Christian Hemp (2):
>   ARM: dts: imx6: Add support for phyBOARD-Mira i.MX 6Quad/Dual RDK
>   ARM: dts: imx6: Add support for phyBOARD-Mira i.MX 6 DualLight/Solo
>     RDK
> 
> Enrico Scholz (1):
>   ARM: dts: imx6: Add support for phyBOARD-Mira with i.MX 6QuadPlus
> 
> Stefan Riedmueller (3):
>   ARM: dts: imx6: Add initial support for phyCORE-i.MX 6 SOM
>   ARM: dts: imx6: Add initial support for phyBOARD-Mira

Okay, I replaced v4 with this v5.

>   ARM: imx_v6_v7_defconfig: Enable Dialog Semiconductor DA9062 driver

This one still doesn't apply to imx/defconfig.  Please rebase and
resend.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
