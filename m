From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v9 2/2] phy: Add driver for mixel mipi dphy found on NXP's
 i.MX8 SoCs
Date: Thu, 2 May 2019 17:36:25 +0200
Message-ID: <4ce62b78-64ac-ca84-733f-bc4d10a67c54@suse.de>
References: <cover.1556633413.git.agx@sigxcpu.org>
 <b999b07673e59c676d2e43a786b635beb056e9bf.1556633413.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b999b07673e59c676d2e43a786b635beb056e9bf.1556633413.git.agx@sigxcpu.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, Johan Hovold <johan@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Li Jun <jun.li@nxp.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.c>
List-Id: devicetree@vger.kernel.org

Am 30.04.19 um 16:40 schrieb Guido Günther:
> This adds support for the Mixel DPHY as found on i.MX8 CPUs but since
> this is an IP core it will likely be found on others in the future. So
> instead of adding this to the nwl host driver make it a generic PHY
> driver.
> 
> The driver supports the i.MX8MQ. Support for i.MX8QM and i.MX8QXP can be
> added once the necessary system controller bits are in via
> mixel_dphy_devdata.
> 
> Co-authored-by: Robert Chiras <robert.chiras@nxp.com>

This should be Co-developed-by and is lacking a Signed-off-by from that
author. Robert, can you please provide one?

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> Signed-off-by: Guido Günther <agx@sigxcpu.org>
Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
