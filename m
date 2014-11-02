From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 0/2] ARM: dts: rockchip: EMAC Rockchip for RK3066 SoCs and MarsBoard RK3066
Date: Sun, 02 Nov 2014 13:31:05 +0100
Message-ID: <1789689.o50HfIjl2u@diego>
References: <1414923601-29504-1-git-send-email-romain.perier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414923601-29504-1-git-send-email-romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 2. November 2014, 10:19:59 schrieb Romain Perier:
> This patches serie adds EMAC Rockchip support for RK3066 SoCs and defines an
> initial devicetree source for MarsBoard RK3066.
> 
> changes since v2:
> 	- Squashed patch 1,2 and 4 together (this is the the second patch)
> 	- Add dual-licensing for rk3066a-marsboard.dts
> 	- Renamed regulator "vaux33_reg" to "vcc_rmii" as it is written in the
> 	  schematic
> 
> changes since v1:
> 	- Replaced hoayuelectronics by hoayu as suggested by the vendor-prefix doc
> in dt-bindings
> 
> Romain Perier (2):
>   ARM: dts: rockchip: Add EMAC Rockchip for RK3066 SoCs
>   ARM: dts: rockchip: Add devicetree source for MarsBoard RK3066

applied to my dts branch for 3.19, with two small changes:

- remove FSF address in license header, per checkpatch warning
[I guess the sunxi header I copied it from also contained the address]
- rename vcc_sd0: fixed-regulator to vcc_sd0: sdmmc-regulator to prevent future 
naming conflicts with more fixed regulators
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
