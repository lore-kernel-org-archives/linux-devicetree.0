From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/5] da8xx USB PHY platform devices and clocks (was
 "da8xx UBS clocks")
Date: Fri, 19 Aug 2016 11:40:15 -0500
Message-ID: <CAOi56cU5zicwKmHh_QfNj8fg_7WXvmRC8SgGouzGiMSeFkkXNg@mail.gmail.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <57431E73.5030304@lechnology.com> <57458A0A.5010100@ti.com>
 <CAOi56cWCZioi=qU-iaLvCfh-EmbPh4pwwTJ5tDK+9qfv5+8WuQ@mail.gmail.com> <57B42FD3.50004@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57B42FD3.50004-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

David,

On Wed, Aug 17, 2016 at 4:35 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>
> Hi Kevin,
>
> On Saturday 13 August 2016 02:54 AM, Kevin Hilman wrote:
> > On Wed, May 25, 2016 at 6:18 AM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> >> On Monday 23 May 2016 08:44 PM, David Lechner wrote:
> >>> On 05/09/2016 06:46 PM, David Lechner wrote:
> >>>> v5 changes: renamed "usbphy" to "usb_phy" or "usb-phy" as appropriate
> >>>>
> >
> > [...]
> >
> >>>
> >>> What should I be doing to keep this moving along?
> >>
> >> We need the related driver changes to be applied first. I could then use
> >> an immutable branch to push the platform changes against.
> >>
> >> I did take a look at the patches and they look good to me. Except the
> >> one comment from Sergei which I just now indicated that I agree with.
> >
> > Just checking on the status of this.  I'm not seeing the driver
> > changes in mainline yet.
> >
> > Any update?
>
> phy driver is already merged which actually introduced a compilation error. The
> fix for it is currently queued in linux-phy -fixes and it should be merged in
> this -rc cycle.
> I think it would be better if David Lechner re-spins the series re-based on top
> of latest mainline kernel and then merged by Bin/Alan.

Does this work for you?

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
