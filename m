From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] of: of_reserved_mem: Ensure cma reserved region not
 cross the low/high memory
Date: Wed, 14 Dec 2016 14:45:19 -0600
Message-ID: <CAL_JsqLHh96D0VULuYfYC1P5K_Bbz6iRjizuYP3Mb6bdERbDnA@mail.gmail.com>
References: <1479901021-25064-1-git-send-email-jason.hui.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479901021-25064-1-git-send-email-jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laura Abbott <labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 23, 2016 at 5:37 AM, Jason Liu <jason.hui.liu-3arQi8VN3Tc@public.gmane.org> wrote:
> Need ensure the cma reserved region not cross the low/high memory boundary
> when using the dynamic allocation methond through device-tree, otherwise,
> kernel will fail to boot up when cma reserved region cross how/high mem.

The kernel command line code setting CMA already deals with this. Why
don't we just call the CMA code (cma_declare_contiguous) to deal with
this?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
