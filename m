From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH 3/4] drivers: soc: sunxi: add support for
 remapping func value to reg value
Date: Mon, 14 Aug 2017 17:46:58 +0800
Message-ID: <CAGb2v64ryu76PcKZtaeC0g7C=02hy9os80X3wTyRkyNEFZ0QZA@mail.gmail.com>
References: <20170809085627.32687-1-icenowy@aosc.io> <20170809085627.32687-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170809085627.32687-4-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 9, 2017 at 4:56 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> On some Allwinner SoCs, sometimes the value needed to write into the
> register to claim SRAM is not equal to the value specified in the
> device tree.
>
> We now defines 0 as "CPU" and 1 as "Device", however, for VE SRAM, the
> register needs to be written 0x7FFFFFFF to claim it to VE, and for
> Allwinner A64's SRAM C the needed register value to claim it to DE2 is
> 0, and the value that enables CPU's access to the SRAM is 1.

The device tree binding defines 0 as "mapped to CPU" and 1 as "mapped
to X device". This matches the value written to the configuration
register for the SRAM blocks currently supported. However, the not yet
supported VE SRAM block is claimed for the device by writing 0x7fffffff,
which is vastly different from the other blocks. On the A64, SRAM C is
claimed by the device by writing a 0, which is the opposite of the current
design.

>
> Add a value remapping in sunxi_sram_func structure, and let the
> sunxi_sram_of_parse function set the remapped register value.

Add:

This allows us to keep the convention currently used in the device tree
binding.

> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Some amendments to the commit message above. Code looks good.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
