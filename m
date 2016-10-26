From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 1/5] ARM: davinci: da8xx: add usb phy clocks
Date: Wed, 26 Oct 2016 13:29:39 +0530
Message-ID: <6bcc1ac1-446c-6191-1c63-e37ccfaf9556@ti.com>
References: <1477451211-31979-1-git-send-email-david@lechnology.com>
 <1477451211-31979-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477451211-31979-2-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Axel Haslam <ahaslam@baylibre.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 26 October 2016 08:36 AM, David Lechner wrote:
> Up to this point, the USB phy clock configuration was handled manually in
> the board files and in the usb drivers. This adds proper clocks so that
> the usb drivers can use clk_get and clk_enable and not have to worry about
> the details. Also, the related code is removed from the board files and
> replaced with the new clock registration functions.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> ---
> 
> I have added "ARM: davinci: da8xx: Enable the usb20 "per" clk on phy_clk_enable"
> from Axel Haslam to this patch.
> 
> In the review of Axel's patch, Sekhar said:
> 
>> We should not be using a NULL device pointer here. Can you pass the musb
>> device pointer available in the same file? Also, da850_clks[] in da850.c
>> needs to be fixed to add the matching device name.
> 
> However, the musb device may not be registered. The usb20_clk can be used to
> supply a 48MHz clock to USB 1.1 (ohci) without using the musb device. So, I am
> inclined to leave this as NULL.

But clock look-up has nothing to do with device being registered AFAICT.
It is used to identify the clock consumer. Passing NULL there means the
clock is not associated with any device. Which is not correct as we are
specifically looking at MUSB module clock.

Thanks,
Sekhar
