From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3 0/2] dmaengine: Support for IMG MDC
Date: Tue, 27 Jan 2015 10:00:12 +0000
Message-ID: <CAL1qeaEF_J_VXvbF_VCPgacGGrbqagGALUm1m=T_yVqV7RooUg@mail.gmail.com>
References: <1418338757-10022-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418338757-10022-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Thu, Dec 11, 2014 at 10:59 PM, Andrew Bresticker
<abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This series adds support for the IMG Multi-threaded DMA Controller (MDC)
> which is found on IMG SoCs.  Currently this driver only supports the
> variant found on the MIPS-based Pistachio SoC.
>
> The MDC supports slave and memory-to-memory transfers on up to 32 channels.
> Requests from channels are handled by MDC threads.  Thread assignments are
> per-channel and are specified in the device-tree.
>
> Tested on a platform based on the Pistachio SoC with additional patches.
> Support for Pistachio will be submitted later.  Slave DMA was tested
> with the recently submitted IMG SPFI driver [1] and memory-to-memory
> DMA was tested with the dmatest module.
>
> Based on Vinod's slave-dma/topic/slave_caps_device_control_fix.

Any more comments on this series?  I'd like to get this in for 3.20 if possible.

Thanks!
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
