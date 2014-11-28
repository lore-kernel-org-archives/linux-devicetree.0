From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [kernel PATCH] devicetree: document ARM bindings for QEMU's Firmware Config interface
Date: Fri, 28 Nov 2014 13:59:43 +0100
Message-ID: <4081425.dh6XptxTnn@wuerfel>
References: <1417177604-21194-1-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417177604-21194-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 28 November 2014 13:26:44 Laszlo Ersek wrote:
> +Example:
> +
> +/ {
> +       #size-cells = <0x2>;
> +       #address-cells = <0x2>;
> +
> +       fw-cfg@9020000 {
> +               reg = <0x0 0x9020000 0x0 0x2 0x0 0x9020002 0x0 0x1>;
> +               compatible = "fw-cfg,mmio";
> +       };
> +};
> 

"fw-cfg" is not a valid vendor string. Are you emulating an actual piece
of hardware here or is this something that comes from qemu?
How about using "qemu,fwcfg" as the compatible string, and documenting
"qemu" as an official vendor string in Documentation/devicetree/bindings/vendor-prefixes.txt

We don't normally list contiguous registers separately. Maybe just round
up to one page and make the register property

	reg = <0x0 0x9020000 0x0 0x1000>;

Finally, isn't there also an interrupt associated with this virtual device?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
