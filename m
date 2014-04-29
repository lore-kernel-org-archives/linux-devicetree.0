From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 01/11] drivers: reset: TI: SoC reset controller support.
Date: Tue, 29 Apr 2014 22:36:33 +0200
Message-ID: <6639369.9mIUuXImgB@wuerfel>
References: <1398802790-29287-1-git-send-email-dmurphy@ti.com> <1398802790-29287-2-git-send-email-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1398802790-29287-2-git-send-email-dmurphy@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Dan Murphy <dmurphy@ti.com>, linux-omap@vger.kernel.org, tony@atomide.com, devicetree@vger.kernel.org, t-kristo@ti.com, s-anna@ti.com, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tuesday 29 April 2014 15:19:40 Dan Murphy wrote:
> +#ifndef _RESET_TI_H_
> +#define _RESET_TI_H_
> +
> +#ifdef CONFIG_RESET_TI
> +void ti_dt_reset_init(void);
> +#else
> +static inline void ti_dt_reset_init(void){ return; };
> +#endif

Why can't this be a regular platform device driver that gets
initialized through an initcall rather than get called from
platform code?

	Arnd
