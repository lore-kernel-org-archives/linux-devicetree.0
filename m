From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] Documentation: dt-bindings: add async_irq to msm_hsusb
Date: Fri, 20 Nov 2015 23:44:12 +0100
Message-ID: <4290863.YBd8t0x8i6@wuerfel>
References: <1448059038-6179-1-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1448059038-6179-1-git-send-email-tim.bird@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>
Cc: Peter.Chen@freescale.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, balbi@ti.com, Bjorn.Andersson@sonymobile.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tbird20d@gmail.com
List-Id: devicetree@vger.kernel.org

On Friday 20 November 2015 14:37:16 Tim Bird wrote:
> +- interrupt-names: Should contain the following:
> +  "core_irq"    USB core interrupt
> +  "async_irq"   Asynchronous interrupt to wake up from low power mode
> +                (optional)
>  
> 

Sorry for the bike-shedding but how about just naming them "core" and "async"?

The redundant "_irq" postfix seems a little redundant.

	Arnd
