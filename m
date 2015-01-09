From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 0/2] devicetree: document ARM bindings for QEMU's
 Firmware Config interface
Date: Fri, 9 Jan 2015 11:36:36 +0000
Message-ID: <20150109113635.GA12942@leverpostej>
References: <1420652574-5897-1-git-send-email-lersek@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1420652574-5897-1-git-send-email-lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <pbonzini-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "agraf-l3A5Bk7waGM@public.gmane.org" <agraf-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 07, 2015 at 05:42:52PM +0000, Laszlo Ersek wrote:
> Relative to v4, patch #1 is left unchanged.
> 
> The two-character change in patch #2 is documented in its notes section.
> 
> Thanks & sorry about the many rounds!

No worries, thanks for handling all the feedback.

Both patches look fine to me:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

(no need to resend, I'm sure the tag can be applied when the patches get
picked up).

Thanks,
Mark.

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
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
