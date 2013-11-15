From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] rtc: rtc-ds1742: Add devicetree support
Date: Fri, 15 Nov 2013 11:31:06 +0000
Message-ID: <20131115113106.GG1709@e106331-lin.cambridge.arm.com>
References: <1384432362-26102-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384432362-26102-1-git-send-email-shc_work-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 14, 2013 at 12:32:42PM +0000, Alexander Shiyan wrote:
> This patch allows the driver to be enabled with devicetree.
> 
> Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/rtc/maxim,ds1742.txt | 14 ++++++++++++++
>  drivers/rtc/rtc-ds1742.c                               | 10 +++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
> new file mode 100644
> index 0000000..d2ddd71
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
> @@ -0,0 +1,14 @@
> +* Maxim (Dallas) DS1742/DS1743 Real Time Clock
> +
> +Register a Maxim DS1742-compatible RTC.

The driver registration has nothing to do with the binding.

Either add a brief description of the device or remove this line
entirely.

> +
> +Required properties:
> +- compatible: Should be "maxim,ds1742".

s/be/contain/

> +- reg: Physical base address of the RTC and length of memory
> +  mapped region.
> +
> +Example:
> +	rtc: rtc@10000000 {
> +		compatible = "maxim,ds1742";
> +		reg = <0x10000000 0x800>;
> +	};

Otherwise this binding looks fine to me, with those changes.

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
