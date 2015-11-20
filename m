From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 1/3] Documentation: dt-bindings: add async_irq to msm_hsusb
Date: Sat, 21 Nov 2015 00:22:46 +0100
Message-ID: <5200286.dcPK8pnl2Z@wuerfel>
References: <1448061641-31672-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1448061641-31672-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, balbi@ti.com, Bjorn.Andersson@sonymobile.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tbird20d@gmail.com
List-Id: devicetree@vger.kernel.org

On Friday 20 November 2015 15:20:39 Tim Bird wrote:
> +- interrupt-names: Should contain the following:
> +  "core"        USB core interrupt
> +  "async"       Asynchronous interrupt to wake up from low power mode
> +                (optional)
>  
>  - clocks:       A list of phandle + clock-specifier pairs for the
>                  clocks listed in clock-names
> @@ -89,7 +94,8 @@ Example HSUSB OTG controller device node:
>      usb@f9a55000 {
>          compatible = "qcom,usb-otg-snps";
>          reg = <0xf9a55000 0x400>;
> -        interrupts = <0 134 0>;
> +        interrupts = <0 134 0>, <0 140 0>;
> +        interrupt-names = "core_irq", "async_irq";
>          dr_mode = "peripheral";
>  
> 

Now the example doesn't match the documentation any more.

	Arnd
