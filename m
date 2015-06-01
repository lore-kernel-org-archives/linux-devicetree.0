From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add support for I2C and related devices to TI-NSPIRE platform
Date: Mon, 01 Jun 2015 17:51:31 +0200
Message-ID: <1838480.tt9zIv1PRB@wuerfel>
References: <1433065442-92750-1-git-send-email-dt.tangr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433065442-92750-1-git-send-email-dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Tang <dt.tangr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 31 May 2015 19:44:02 Daniel Tang wrote:
> +
> +                               touchpad@20 {
> +                                       compatible = "synaptics_i2c";
> +                                       reg = <0x20>;
> +                               };
>                         };

While this works, "synaptics_i2c" is not a well-formed DT compatible string,
we should do it right.

Please submit three patches:

a) one patch add "syna" as the vendor string in
   Documentation/devicetree/bindings/vendor-prefixes.txt
   As this is a publicly traded company, we use the stock ticker
   symbol by convention. Cc the patch to devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
   for review, but I can merge it along with the dts patch if nobody
   else does

b) a patch to add an of_device_id match table to
   drivers/input/mouse/synaptics_i2c.c, with the proper name of the
   device. Ideally, this would be the full name of the component that
   is used here, something like "syna,abc12345-touchscreen". If you
   have no way of finding out the real name, "syna,i2c-touchscreen"
   will have to suffice.

c) This patch, with the correct string used for compatible.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
