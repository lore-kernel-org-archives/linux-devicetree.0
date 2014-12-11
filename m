From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v5 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY
Date: Wed, 10 Dec 2014 22:12:02 -0800
Message-ID: <1418278322.18092.30.camel@perches.com>
References: <1418208371-18851-1-git-send-email-lyz@rock-chips.com>
	 <1418208371-18851-2-git-send-email-lyz@rock-chips.com>
	 <5489338C.1030109@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5489338C.1030109@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yunzhi Li <lyz@rock-chips.com>, heiko@sntech.de, jwerner@chromium.org, dianders@chromium.org, olof@lixom.net, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-12-11 at 11:32 +0530, Kishon Vijay Abraham I wrote:
> On Wednesday 10 December 2014 04:16 PM, Yunzhi Li wrote:
> > diff --git a/drivers/phy/phy-rockchip-usb.c b/drivers/phy/phy-rockchip-usb.c
[]
> > +/*
> > + * The higher 16-bit of this register is used for write protection
> > + * only if BIT(13 + 16) set to 1 the BIT(13) can be written.
> > + */
> > +#define SIDDQ_MSK		BIT(13 + 16)

huh?

This #define looks _very_ odd.

Is this supposed to be a single bit 29 or
some range?
