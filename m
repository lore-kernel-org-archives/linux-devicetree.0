From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH/RFT v2 02/17] ARM: davinci: da8xx: Add CFGCHIP syscon
 platform declaration.
Date: Tue, 25 Oct 2016 13:40:59 +0530
Message-ID: <7f9efe9d-0912-e10a-3e45-24c5d2b455ab@ti.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-3-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024164634.4330-3-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ahaslam@baylibre.com, gregkh@linuxfoundation.org, johan@kernel.org, robh+dt@kernel.org, stern@rowland.harvard.edu, khilman@baylibre.com, sshtylyov@ru.mvista.com, david@lechnology.com, manjunath.goudar@linaro.org, broonie@kernel.org, abailon@baylibre.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 24 October 2016 10:16 PM, ahaslam@baylibre.com wrote:
> From: David Lechner <david@lechnology.com>
> 
> The CFGCHIP registers are used by a number of devices, so using a syscon
> device to share them. The first consumer of this will by the phy-da8xx-usb
> driver.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> [Axel: minor fix: change id to -1]

Can you please clarify this change? There could be other syscon devices
on the chip for other common registers. Why use the singular device-id?

> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>

Thanks,
Sekhar
