From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [kernel PATCH v2 0/2] devicetree: document ARM bindings for
 QEMU's Firmware Config interface
Date: Thu, 4 Dec 2014 10:35:36 +0000
Message-ID: <CAFEAcA-jXHCbi3o6h6fSu37WRB4684YTiAPUpoR9mU2iXc4EUQ@mail.gmail.com>
References: <1417366282-13527-1-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417366282-13527-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30 November 2014 at 16:51, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> V2 seeks to address comments raised in the v1 review. Changes are broken
> out per patch, as git notes.
>
> Thanks
> Laszlo
>
> Laszlo Ersek (2):
>   devicetree: document the "qemu" and "virtio" vendor prefixes
>   devicetree: document ARM bindings for QEMU's Firmware Config interface
>
>  Documentation/devicetree/bindings/arm/fw-cfg.txt   | 57 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  2 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt

If the device tree folks are happy with this binding then it
works for me on the QEMU side.

Acked-by: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
