From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [kernel PATCH v2 2/2] devicetree: document ARM bindings for
 QEMU's Firmware Config interface
Date: Fri, 5 Dec 2014 18:57:57 +0000
Message-ID: <CAFEAcA_iY6qxiQO2oGJitZE6QTAwSsdzuF81q=N=Dt4QfjhpHQ@mail.gmail.com>
References: <1417366282-13527-1-git-send-email-lersek@redhat.com> <1417366282-13527-3-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417366282-13527-3-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: QEMU Developers <qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30 November 2014 at 16:51, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> +Example:
> +
> +/ {
> +       #size-cells = <0x2>;
> +       #address-cells = <0x2>;
> +
> +       fw-cfg@9020000 {
> +               compatible = "qemu,fw-cfg-mmio";
> +               reg = <0x0 0x9020000 0x0 0x1000>;
> +       };

I've just noticed that this example claims a register
region size of 0x1000. This seems wrong, because the
underlying device doesn't have a register range that
big. Surely this should be a size of 0x3 ?

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
