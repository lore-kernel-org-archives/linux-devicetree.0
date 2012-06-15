From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4] usb: chipidea: permit driver bindings pass phy pointer
Date: Fri, 15 Jun 2012 10:46:26 +0800
Message-ID: <20120615024625.GA26563@b20223-02.ap.freescale.net>
References: <1337912665-16615-3-git-send-email-richard.zhao@freescale.com>
 <1339159026-15837-1-git-send-email-richard.zhao@freescale.com>
 <20120612231438.GA6177@kroah.com>
 <8762au8h46.fsf@ashishki-desk.ger.corp.intel.com>
 <20120614154624.GF17140@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120614154624.GF17140-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 14, 2012 at 08:46:24AM -0700, Greg KH wrote:
> On Thu, Jun 14, 2012 at 10:52:57AM +0300, Alexander Shishkin wrote:
> > Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> writes:
> > 
> > > On Fri, Jun 08, 2012 at 08:37:06PM +0800, Richard Zhao wrote:
> > >> Sometimes, the driver bindings may know what phy they use.
> > >> For example, when using device tree, the usb controller may have a
> > >> phandler pointing to usb phy.
> > >> 
> > >> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > >> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> > >> Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > >> ---
> > >> Changes since laster version:
> > >> - hcd transceiver renamed to phy
> > >
> > > Ick, I see patches all over this thread, and other threads, and I have
> > > no idea what to apply anywhere...
> > >
> > > So, consider all chipidea patches dropped from my queue now, can you
> > > please resend them to me, with the accumulated acks and reviewed-by
> > > line, so that I can queue them up?
> > 
> > So will you pick these patches to your tree or should I apply them to
> > mine or what is the plan? I kind of have a tree [1] for chipidea stuff
> > where I have been collecting patches, to send a pull request to you for
> > 3.6.
> 
> I do not accept pull requests for this code, sorry, I need patches in
> email.  You and Richard work it out how you are going to handle this and
> then, send me patches that you both agree on.
So, Alex, Could you send out patch you queued? And I'll send out v6
patch series which depends on that. Is it ok for driver part?

For arm platform part, it may need further discussion.

Thanks
Richard
> 
> thanks,
> 
> greg k-h
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
