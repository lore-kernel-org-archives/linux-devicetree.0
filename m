From: Miodrag Dinic <Miodrag.Dinic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 06/10] Documentation: Add device tree binding for
 Goldfish FB driver
Date: Thu, 6 Jul 2017 13:23:10 +0000
Message-ID: <232DDC0A2B605E4F9E85F6904417885F015D929D32@BADAG02.ba.imgtec.org>
References: <1498664922-28493-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1498664922-28493-7-git-send-email-aleksandar.markovic@rt-rk.com>,<CAL_Jsq+m-g__T34W2-7ddAF9ehH1woT3WfuxuDnHQMfzrg86Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+m-g__T34W2-7ddAF9ehH1woT3WfuxuDnHQMfzrg86Hg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Cc: Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Aleksandar Markovic <Aleksandar.Markovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Goran Ferenc <Goran.Ferenc-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Douglas Leung <Douglas.Leung-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Paul Burton <Paul.Burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Petar Jovanovic <Petar.Jovanovic-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Raghu Gandham <Raghu.Gandham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "jinqian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <jinqian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "lfy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <lfy-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Bo Hu <bohu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

cc-ing Arve Hjønnevåg who originally upstreamed Goldfish FB driver
cc-ing Jin Quian, Bo Hu & Lingfeng Yang from Google

Hi Rob,

Thanks for taking the time to review the patches

> I don't know that this should even go upstream. There's no upstream
> qemu support for goldfish-fb. Maybe this is a minor driver change, but
> FB drivers are being replaced with DRM drivers. And the time for AOSP
> supporting framebuffer drivers is limited I think with HWC2 and
> explicit fence support in DRM.

Goldfish FB is actively used by all supported architectures in Android (Intel/ARM/MIPS)
and is part of Android emulator project and so far, there have been no limitations in
AOSP for using it.

We have already tested this particular version of the driver for MIPS
Ranchu virtual platform (introduced in this series) which is DT based and
therefore we needed to integrate device tree support for this driver.

> bindings/display/

Did you mean to use this location instead of "bindings/goldfish/"?

Kind regards,
Miodrag
________________________________________
From: Rob Herring [robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
Sent: Friday, June 30, 2017 1:12 AM
To: Aleksandar Markovic
Cc: Linux-MIPS; Aleksandar Markovic; Miodrag Dinic; Goran Ferenc; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Douglas Leung; James Hogan; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Mark Rutland; Paul Burton; Petar Jovanovic; Raghu Gandham
Subject: Re: [PATCH v2 06/10] Documentation: Add device tree binding for Goldfish FB driver

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
