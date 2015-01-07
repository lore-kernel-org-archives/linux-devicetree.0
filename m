From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] devicetree: document ARM bindings for QEMU's
 Firmware Config interface
Date: Wed, 7 Jan 2015 09:43:31 -0600
Message-ID: <CAL_JsqL+ued8mZj_MONKf0j2MO0zmE+H=mahQC30aV8vki0mvQ@mail.gmail.com>
References: <1418849386-25857-1-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418849386-25857-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Paolo Bonzini <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 17, 2014 at 2:49 PM, Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> The qemu patchset has been turned upside down on qemu-devel during
> review (many thanks for that!); one outcome is that now both the
> selector and the data registers are big endian. This series has been
> updated accordingly.

I'm assuming this is now settled on the QEMU side and will apply.

Rob

>
> Thanks
> Laszlo
>
> Laszlo Ersek (2):
>   devicetree: document the "qemu" and "virtio" vendor prefixes
>   devicetree: document ARM bindings for QEMU's Firmware Config interface
>
>  Documentation/devicetree/bindings/arm/fw-cfg.txt   | 72 ++++++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  2 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/fw-cfg.txt
>
> --
> 1.8.3.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
