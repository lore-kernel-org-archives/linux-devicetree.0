From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH/RFT v2 03/17] ARM: davinci: da8xx: Add USB PHY platform
 declaration
Date: Tue, 25 Oct 2016 14:48:05 +0530
Message-ID: <4129f1be-42f6-f182-c8a2-84befe01d298@ti.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-4-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024164634.4330-4-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ahaslam@baylibre.com, gregkh@linuxfoundation.org, johan@kernel.org, robh+dt@kernel.org, stern@rowland.harvard.edu, khilman@baylibre.com, sshtylyov@ru.mvista.com, david@lechnology.com, broonie@kernel.org, abailon@baylibre.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 24 October 2016 10:16 PM, ahaslam@baylibre.com wrote:
> +static struct platform_device da8xx_usb_phy = {
> +	.name		= "da8xx-usb-phy",
> +	.id		= 0,

There is a single phy control in the system for both 1.1 and 2.0 PHYs.
so this can be a singular device (id -1).

Thanks,
Sekhar
