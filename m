From: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: arizona: Add GPIO maintain state flag
Date: Tue, 11 Apr 2017 10:34:27 +0100
Message-ID: <1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
References: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
         <20170410201758.lobmtzxt2jgcwwvc@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410201758.lobmtzxt2jgcwwvc@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-04-10 at 15:17 -0500, Rob Herring wrote:
> On Fri, Apr 07, 2017 at 01:38:44PM +0100, Charles Keepax wrote:
> > The Arizona devices only maintain the state of output GPIOs whilst the
> > CODEC is active, this can cause issues if the CODEC suspends whilst
> > something is relying on the state of one of its GPIOs. However, in
> > many systems the CODEC GPIOs are used for audio related features
> > and thus the state of the GPIOs is unimportant whilst the CODEC is
> > suspended. Often keeping the CODEC resumed in such a system would
> > incur a power impact that is unacceptable.
> > 
> > Add a flag through the second cell of the GPIO specifier in device
> > tree, to allow the user to select whether a GPIO being configured as
> > an output should keep the CODEC resumed.
> 
> If the whole codec can't be suspended, why does this need to be per 
> GPIO? You could just have a single boolean property.
> 

Three reasons I can think of:

1) The GPIO binding already provides for passing extra information
through the binding ("Exact meaning of each specifier cell is controller
specific" as it says in the main gpio binding doc) so why add yet
another custom property to do it?

2) Doing it through the gpio means that if ultimately the child DT node
that is using it gets disabled (status="disabled") or that driver isn't
in use the codec will be able to go to sleep. That won't happen with a
brute-force "big lock".

3) The codec only has to be kept awake while any such GPIO is actually
in use. See (2)

> > 
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/arizona.txt | 5 ++++-
> >  include/dt-bindings/mfd/arizona.h                 | 3 +++
> >  2 files changed, 7 insertions(+), 1 deletion(-)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
