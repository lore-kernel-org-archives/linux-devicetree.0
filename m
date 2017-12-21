From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v3 3/3] drm/tinydrm: add driver for ST7735R panels
Date: Thu, 21 Dec 2017 13:35:14 -0600
Message-ID: <2f63be06-f9b2-2103-888c-e3f49c40fe82@lechnology.com>
References: <1513884233-31540-1-git-send-email-david@lechnology.com>
 <1513884233-31540-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513884233-31540-4-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/21/2017 01:23 PM, David Lechner wrote:
> This adds a new driver for Sitronix ST7735R display panels.
> 
> This has been tested using an Adafruit 1.8" TFT.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---

<snip>

> +	mipi_dbi_command(mipi, ST7735R_GAMCTRP1, 0x0f, 0x1a, 0x0f, 0x18, 0x2f,
> +			 0x28, 0x20, 0x22, 0x1f, 0x1b, 0x23, 0x37, 0x00, 0x07,
> +			 0x02, 0x10);
> +	mipi_dbi_command(mipi, ST7735R_GAMCTRN1, 0x0f, 0x1b, 0x0f, 0x17, 0x33,
> +			 0x2c, 0x29, 0x2e, 0x30, 0x30, 0x39, 0x3f, 0x00, 0x07,
> +			 0x03, 0x10);
By the way, how do you know what is the "right" gamma curve? I think I 
copied this from the generic st7735r driver in fbtft, but I noticed that 
there is also a different curve for the Adafruit 1.8" display in fbtft. 
I'm wondering if I should have used that one instead. I can't really 
tell a difference looking at the display.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
