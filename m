From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH/RFT v2 07/17] ARM: davinci: da8xx: Enable the usb20 "per"
 clk on phy_clk_enable
Date: Mon, 24 Oct 2016 21:53:00 -0500
Message-ID: <c2d31f5a-32c6-5e93-2d3d-d6ef75b697fc@lechnology.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-8-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024164634.4330-8-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ahaslam@baylibre.com, gregkh@linuxfoundation.org, johan@kernel.org, robh+dt@kernel.org, nsekhar@ti.com, stern@rowland.harvard.edu, khilman@baylibre.com, sshtylyov@ru.mvista.com, manjunath.goudar@linaro.org, broonie@kernel.org, abailon@baylibre.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 10/24/2016 11:46 AM, ahaslam@baylibre.com wrote:
> From: Axel Haslam <ahaslam@baylibre.com>
>
> While probing ochi phy with usb20 phy as a parent clock for usb11_phy,
> the usb20_phy clock enable would time out. This is because the usb20
> module clock needs to enabled while trying to lock the usb20_phy PLL.
>
> Call clk enable and get for the usb20 peripheral before trying to
> enable the phy PLL.
>
> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> ---


This patch can be combined with "ARM: davinci: da8xx: add usb phy 
clocks" since that patch has not been merged yet.

If you like, I can resubmit my patches from this series along with the 
changes from this patch.
