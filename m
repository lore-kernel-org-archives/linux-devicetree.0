From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/3] mmc: add support for power-on sequencing through DT
Date: Mon, 20 Jan 2014 17:14:04 -0200
Message-ID: <CAOMZO5A=tdzq8SW7P-D_Lxd6Ptjqkk+bKn29T2ggOZar=r4X+A@mail.gmail.com>
References: <1390190215-22700-1-git-send-email-olof@lixom.net>
	<1390190215-22700-2-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1390190215-22700-2-git-send-email-olof@lixom.net>
Sender: linux-mmc-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-mmc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, ijc+devicetree@hellion.org.ok, Kumar Gala <galak@codeaurora.org>, chris@printf.net
List-Id: devicetree@vger.kernel.org

On Mon, Jan 20, 2014 at 1:56 AM, Olof Johansson <olof@lixom.net> wrote:

> +Card power and reset control:
> +The following properties can be specified for cases where the MMC
> +peripheral needs additional reset, regulator and clock lines. It is for
> +example common for WiFi/BT adapters to have these separate from the main
> +MMC bus:
> +  - card-reset-gpios: Specify GPIOs for card reset (reset active low)

Wouldn't it be better not to assume that the card reset is always
active low and read the GPIO_ACTIVE_xxx flags instead?

Regards,

Fabio Estevam
