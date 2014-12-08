From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V2 2/2] dmaengine: Add driver for IMG MDC
Date: Sun, 7 Dec 2014 22:14:05 -0800
Message-ID: <CAL1qeaFDZV2FiuHqRAzsaYUmoV72Kaq8o0di7CueUrN6qzrT+w@mail.gmail.com>
References: <1416002384-3525-1-git-send-email-abrestic@chromium.org>
	<1416002384-3525-3-git-send-email-abrestic@chromium.org>
	<20141205173553.GS3411@intel.com>
	<CAL1qeaE+7L2p=HxPBasQYLVPD0H2qBAd439Fn_z3Fza9Y3+0eA@mail.gmail.com>
	<20141207114829.GX3411@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141207114829.GX3411-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 7, 2014 at 3:48 AM, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Dec 05, 2014 at 10:30:53AM -0800, Andrew Bresticker wrote:
>> After adding a macro for setting the WIDTH_{R,W} fields it seems fine
>> to me.  Is there something else you had in mind?
> I think whole of this might be a macro :)
>
>
>> > and this depends on dma_slave_config being set, which shouldn't be the case
>> > for memcpy

> okay looking back yes it depends on bus_width. But how is bus_width set, i
> thought the dma_slave_config will set that?

The MDC's memory bus width is read from a HW register and set in probe().
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
