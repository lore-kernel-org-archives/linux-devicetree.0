From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 06/10] Documentation: Add device tree binding for
 Goldfish FB driver
Date: Thu, 29 Jun 2017 18:12:40 -0500
Message-ID: <CAL_Jsq+m-g__T34W2-7ddAF9ehH1woT3WfuxuDnHQMfzrg86Hg@mail.gmail.com>
References: <1498664922-28493-1-git-send-email-aleksandar.markovic@rt-rk.com> <1498664922-28493-7-git-send-email-aleksandar.markovic@rt-rk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498664922-28493-7-git-send-email-aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Cc: Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Miodrag Dinic <miodrag.dinic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Goran Ferenc <goran.ferenc-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Leung <douglas.leung-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Petar Jovanovic <petar.jovanovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Raghu Gandham <raghu.gandham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 10:46 AM, Aleksandar Markovic
<aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org> wrote:
> From: Aleksandar Markovic <aleksandar.markovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> Add documentation for DT binding of Goldfish FB driver. The compatible
> string used by OS for binding the driver is "google,goldfish-fb".
>
> Signed-off-by: Miodrag Dinic <miodrag.dinic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Goran Ferenc <goran.ferenc-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Aleksandar Markovic <aleksandar.markovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/goldfish/google,goldfish-fb.txt           | 18 ++++++++++++++++++

bindings/display/

I don't know that this should even go upstream. There's no upstream
qemu support for goldfish-fb. Maybe this is a minor driver change, but
FB drivers are being replaced with DRM drivers. And the time for AOSP
supporting framebuffer drivers is limited I think with HWC2 and
explicit fence support in DRM.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
