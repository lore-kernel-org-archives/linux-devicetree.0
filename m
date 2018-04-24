From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v2 0/2] usb: dwc3: support clocks and resets for DWC3 core
Date: Mon, 23 Apr 2018 17:11:39 -0700
Message-ID: <31be9c49-7562-1c06-7bf9-bafaea2f1c16@codeaurora.org>
References: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524135818-14825-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

HI,


On 4/19/2018 4:03 AM, Masahiro Yamada wrote:
> In the current design of DWC3 driver,
> the DT typically becomes a nested structure like follows:
>
>   dwc3-glue {
>           compatible = "foo,dwc3";
>           ...
>
>           dwc3 {
>                   compatible = "snps,dwc3";
>                   ...
>           };
>   }
>
> The current DWC3 core (drivers/usb/dwc3/core.c) can not handle
> clocks / resets at all.
>
> The only solution we have now, is to put DWC3 core node under
> the glue layer node, then add clocks and resets there.
> Actually, dwc3-of-simple.c exists to handle clocks and resets.
>
> As always for digital circuits, DWC3 core IP itself needs clock input.
> This is specific to this IP.  So, supporting clocks and resets in
> dwc3/core.c makes sense.

Why can't dwc3-of-simple be used with this IP?
Adding core/reset handling in both core and glue drivers might
only add to confusion and I cant think of a reason why having a parent
node representing dwc3-of-simple glue would be any concern.
Or are you planning to remove dwc3-of-simple.c driver?

>
> In this version, the number of clocks (and names) is specific
> to this IP, with clock names taken from Synopsys datasheet.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
