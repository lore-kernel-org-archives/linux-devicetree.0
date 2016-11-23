From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 0/3] TI DA850/OMAP-L138/AM18x pinconf
Date: Wed, 23 Nov 2016 16:47:52 +0530
Message-ID: <8c960321-708d-5e0d-2dbc-fb1ac5272bbc@ti.com>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1479871767-20160-1-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 23 November 2016 08:59 AM, David Lechner wrote:
> This series adds a new driver and DT bindings for TI DA850/OMAP-L138/AM18x
> pinconf (bias pullup/pulldown).
> 
> The motivation for this series is LEGO MINDSTORMS EV3 support. It needs most,
> if not all, internal pullup/down resistors disabled in order to work correctly.

This looks really neat to my non-pinconf trained eyes. I have sent some
minor comments. But apart from that:

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

3/3 should go through my tree. If the driver patches are going to get
queued for v4.10, I can queue the DTS portion through my tree.

Thanks,
Sekhar
