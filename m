From: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>
Subject: Re: [PATCH v4 0/5] mfd: dt: Add bindings for the Aspeed MFDs
Date: Thu, 22 Dec 2016 15:47:15 -0600
Message-ID: <4e69b379-299f-ebf3-3a61-9ac1bcaba7b3@acm.org>
References: <20161220071535.27542-1-andrew@aj.id.au>
Reply-To: minyard-HInyCGIudOg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161220071535.27542-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

It looks like this is ready.  Should I take this in the IPMI tree, or is 
there a better tree for it?

-corey

On 12/20/2016 01:15 AM, Andrew Jeffery wrote:
> Hi Lee,
>
> Here's v4 of the Aspeed LPC MFD devicetree bindings series. v3 can be found at:
>
>    https://lkml.org/lkml/2016/12/5/835
>
> Changes since v3:
>
> * Based on Arnd's argument[1], drop the addition of the mfd/syscon bindings
>    directory as well as the the last patch in v3, which moved a number of
>    existing bindings. Eventually the Aspeed display controller will have a
>    device-specific driver so it doesn't belong there either.
>
> * Add a compatible string for the AST2400 in the LPC Host Controller bindings
>    as requested by Joel and slightly tweak the reg description for Rob.
>
> [1] https://lkml.org/lkml/2016/12/13/202
>
> Andrew Jeffery (5):
>    mfd: dt: Fix "indicates" typo in mfd bindings document
>    mfd: dt: ranges, #address-cells and #size-cells as optional properties
>    mfd: dt: Add Aspeed Low Pin Count Controller bindings
>    mfd: dt: Add bindings for the Aspeed LPC Host Controller (LHC)
>    mfd: dt: Add bindings for the Aspeed SoC Display Controller (GFX)
>
>   .../devicetree/bindings/mfd/aspeed-gfx.txt         |  17 +++
>   .../devicetree/bindings/mfd/aspeed-lpc.txt         | 137 +++++++++++++++++++++
>   Documentation/devicetree/bindings/mfd/mfd.txt      |  12 +-
>   3 files changed, 165 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
>   create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
