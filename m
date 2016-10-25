From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH/RFT v2 06/17] ARM: davinci: da8xx: Fix some redefined
 symbol warnings
Date: Tue, 25 Oct 2016 15:33:48 +0530
Message-ID: <9fa01842-cf8e-87e9-75ce-5d4b2841fdfe@ti.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-7-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024164634.4330-7-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ahaslam@baylibre.com, gregkh@linuxfoundation.org, johan@kernel.org, robh+dt@kernel.org, stern@rowland.harvard.edu, khilman@baylibre.com, sshtylyov@ru.mvista.com, david@lechnology.com, manjunath.goudar@linaro.org, broonie@kernel.org, abailon@baylibre.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 24 October 2016 10:16 PM, ahaslam@baylibre.com wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> Some macro for DA8xx CFGCHIP are defined in usb-davinci.h,
> but da8xx-cfgchip.h intend to replace them.
> The usb-da8xx.c is using both headers, causing redefined symbol warnings.
> Remove the old macros.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>

This is a v4.9-rc bug fix. Can you please post it as a separate patch
for Greg to pick up?

You can add:

Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
