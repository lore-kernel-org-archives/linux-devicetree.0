From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/6] Shrinking DT memory usage
Date: Fri, 6 Oct 2017 19:24:42 -0400 (EDT)
Message-ID: <nycvar.YSQ.7.76.1710061902240.1834@knanqh.ubzr>
References: <20171005194422.26224-1-robh@kernel.org> <nycvar.YSQ.7.76.1710061726330.1834@knanqh.ubzr> <CAL_JsqLDhf2tx5PHAnY9X3ju42BayVmJ1KONoKFhhbSaxaKGHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLDhf2tx5PHAnY9X3ju42BayVmJ1KONoKFhhbSaxaKGHQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 6 Oct 2017, Rob Herring wrote:

> On Fri, Oct 6, 2017 at 4:30 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, 5 Oct 2017, Rob Herring wrote:
> >
> >> On kernels with a minimal config and a RAM target in the 100s of KB, DT
> >> is quite a hog of runtime memory usage. How much is dependent on how many
> >> nodes and properties in the DT which have a corresponding struct device_node
> >> and struct property in the kernel. Just skipping disabled nodes saves a
> >> lot by not creating the device_nodes in the first place[1], but there's
> >> more low hanging fruit by making some of the fields in struct property and
> >> struct device_node optional. With the changes here, the memory usage goes
> >> from 17KB to under 8KB on QEMU's ARM virt machine which is a relatively
> >> small DT.
> >
> > My test case went from 118072 bytes ddown to 21548 bytes with this
> > series.
> 
> Did that include the changes for FDT skipping status=disabled and to
> stop storing the full path of every node? With those 2 alone you said
> it dropped to 25K.

No -- that's with those 6 patches only.

Adding the other 2 patches on top and it is down to 11732 bytes.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
