From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fdt: fix extend of cmd line
Date: Tue, 19 Apr 2016 16:30:59 -0500
Message-ID: <CAL_JsqLKjMaHc8NCrDtCucRdJBk0qWp7uZxvRioSsQGfrwcBRA@mail.gmail.com>
References: <1460541136-18385-1-git-send-email-muvarov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460541136-18385-1-git-send-email-muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Max Uvarov <muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 4:52 AM, Max Uvarov <muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On arm CONFIG_CMDLINE_EXTEND does not append build-in
> cmdline in kernel to U-boot parameters. Fix it here.
> Theoretically this patch should repair kdump work where
> it adds elfcorehdr= and memmap additional parameters
> to second kernel.
>
> Signed-off-by: Max Uvarov <muvarov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks. There was some work to standardize these config
options across architectures, but it seems that stalled.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
