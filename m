From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 0/2] devicetree: document ARM bindings for QEMU's
 Firmware Config interface
Date: Tue, 13 Jan 2015 14:04:55 -0600
Message-ID: <CAL_JsqJiQ7Cdz-onSOOR3ec0WB+zHzyPq=XyYJMan7KrJ=ZWyA@mail.gmail.com>
References: <1420652574-5897-1-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420652574-5897-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 7, 2015 at 11:42 AM, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Relative to v4, patch #1 is left unchanged.
>
> The two-character change in patch #2 is documented in its notes section.
>
> Thanks & sorry about the many rounds!
> Laszlo
>
> Laszlo Ersek (2):
>   devicetree: document the "qemu" and "virtio" vendor prefixes
>   devicetree: document ARM bindings for QEMU's Firmware Config interface

Both applied for 3.20. Thanks.

>
>  Documentation/devicetree/bindings/arm/fw-cfg.txt   | 72 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  2 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt
>
> --
> 1.8.3.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
