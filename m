From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 1/3] devicetree: bindings: pinctrl: Add binding for
 ti,da850-pupd
Date: Wed, 23 Nov 2016 16:31:51 +0530
Message-ID: <33ddafab-9704-d21c-ea86-22b9b62553b8@ti.com>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
 <1479871767-20160-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1479871767-20160-2-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 23 November 2016 08:59 AM, David Lechner wrote:
> Device-tree bindings for TI DA8XX/OMAP-L138/AM18XX pullup/pulldown

s/DA8XX/DA850. It looks like this support is absent from DA830.

> pinconf controller.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Thanks,
Sekhar
