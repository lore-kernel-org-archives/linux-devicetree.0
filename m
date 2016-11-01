From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v8 2/3] ARM: davinci: da8xx: add usb phy clocks
Date: Tue, 1 Nov 2016 15:27:26 +0530
Message-ID: <73e832b5-fbf1-63be-31ed-68a3c5d59282@ti.com>
References: <1477946841-16126-1-git-send-email-david@lechnology.com>
 <1477946841-16126-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477946841-16126-3-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>
Cc: Axel Haslam <ahaslam@baylibre.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 01 November 2016 02:17 AM, David Lechner wrote:
> Up to this point, the USB phy clock configuration was handled manually in
> the board files and in the usb drivers. This adds proper clocks so that
> the usb drivers can use clk_get and clk_enable and not have to worry about
> the details. Also, the related code is removed from the board files and
> replaced with the new clock registration functions.
> 
> This also removes the #if IS_ENABLED(CONFIG_USB_MUSB_HDRC) around the musb
> declaration and renames the musb platform device so that we can reference
> it from the usb20 clock even if the musb device is not used.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>

Applied to v4.10/soc

Thanks,
Sekhar
