From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] of/platform: Use platform_device interface
Date: Thu, 23 Apr 2015 15:49:59 +0200
Message-ID: <CAPybu_1wn-XaySHZ4Bhu9ZwLpetmcGm7N8Qm59O09f=E-2bbCQ@mail.gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
 <1429719261-18024-5-git-send-email-ricardo.ribalda@gmail.com>
 <CAL_JsqKYkNyfY+4RPY=FD1=wBxc2EJXaSsJ8D+0T84JK_65E4Q@mail.gmail.com> <CAPybu_3Ej2ecFDTiJVL9TfE=ZLFN2wLKE_nFL2WjMQtk+4LO_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_3Ej2ecFDTiJVL9TfE=ZLFN2wLKE_nFL2WjMQtk+4LO_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jakub Sitnicki <jsitnicki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Travis <travis-sJ/iWh9BUns@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob

On Thu, Apr 23, 2015 at 9:28 AM, Ricardo Ribalda Delgado
<ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> I think it can also use platform_device_add. I will prepare a patch to
> finally remove of_device_add()

I will post right away an updated version of this patchset, and then I
will prepare another one to remove of_device_add() completely. I
already have two patches, but I have to figure out a proper way to
test it.

Thanks!


-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
