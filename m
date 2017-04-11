From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common panel properties
Date: Tue, 11 Apr 2017 08:12:34 +0300
Message-ID: <2098006.Rlj3CgHVZA@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CACvgo52dydV5fpcDDPnFaRN32uxoeitvazwPpxOs4wOqg0=45A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CACvgo52dydV5fpcDDPnFaRN32uxoeitvazwPpxOs4wOqg0=45A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, ML dri-devel <dri-devel@lists.freedesktop.org>, linux-renesas-soc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Emil,

On Sunday 09 Apr 2017 12:47:01 Emil Velikov wrote:
> Hi Laurent,
> 
> Pardon for reviving this old thread. I've noticed a couple of things
> which might want some attention.
> 
> On 19 November 2016 at 03:28, Laurent Pinchart wrote:
> > +
> > +- panel-timing: Most display panels are restricted to a single resolution
> > and +  require specific display timings. The panel-timing subnode
> > expresses those +  timings as specified in the timing subnode section of
> > the display timing +  bindings defined in
> > +  Documentation/devicetree/bindings/display/display-timing.txt.
> 
> Cannot find such a file in linux-next. Perhaps you meant
> Documentation/devicetree/bindings/display/panel/display-timing.txt?

Oops. My bad, I'll fix that. Thank you for noticing it.

> Documentation/devicetree/bindings/display/panel/panel.txt includes a
> "rotation" property, which we might want to fold here.

I believe that panel.txt and panel-common.txt were added concurrently. We 
should indeed merge the two.

-- 
Regards,

Laurent Pinchart
