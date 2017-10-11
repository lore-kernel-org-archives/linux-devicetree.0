From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: stratix10: enable gpio and leds
Date: Wed, 11 Oct 2017 03:18:54 -0500
Message-ID: <e180a731-c7b3-5900-36c1-5943a7b11386@kernel.org>
References: <20171010212538.3331-1-atull@kernel.org>
 <20171010212538.3331-2-atull@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171010212538.3331-2-atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/10/2017 04:25 PM, Alan Tull wrote:
> Enable gpio and leds for socdk OOBE daughtercard.
> 
> pushbutton PB_SW0 = gpio1.io4
> pushbutton PB_SW1 = gpio1.io5
> LED HPS_LED0      = gpio1.io20
> LED HPS_LED1      = gpio1.io19
> LED HPS_LED2      = gpio1.io21
> 
> Signed-off-by: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  .../boot/dts/altera/socfpga_stratix10_socdk.dts    | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Both patches applied, thanks Alan!

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
