From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
Date: Tue, 13 Aug 2019 10:08:44 +0200
Message-ID: <CAK8P3a3Vrd+sttJrQwD-jA9p_egG4x-hc41eGK8H-_aVm-uoYw@mail.gmail.com>
References: <cover.1565367567.git.agx@sigxcpu.org> <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Lee Jones <lee.jones@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 9, 2019 at 6:24 PM Guido Günther <agx@sigxcpu.org> wrote:
>
> This adds all the gpr registers and the define needed for selecting
> the input source in the imx-nwl drm bridge.
>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> +
> +#define IOMUXC_GPR0    0x00
> +#define IOMUXC_GPR1    0x04
> +#define IOMUXC_GPR2    0x08
> +#define IOMUXC_GPR3    0x0c
> +#define IOMUXC_GPR4    0x10
> +#define IOMUXC_GPR5    0x14
> +#define IOMUXC_GPR6    0x18
> +#define IOMUXC_GPR7    0x1c
(more of the same)

huh?

> +/* i.MX8Mq iomux gpr register field defines */
> +#define IMX8MQ_GPR13_MIPI_MUX_SEL              BIT(2)

I think this define should probably be local to the pinctrl driver, to
ensure that no other drivers fiddle with the registers manually.

     Arnd
