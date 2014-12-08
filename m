From: One Thousand Gnomes <gnomes-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Mon, 8 Dec 2014 22:55:19 +0000
Message-ID: <20141208225519.64501d2d@lxorguk.ukuu.org.uk>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com>
	<1414007405-32186-3-git-send-email-atull@opensource.altera.com>
	<20141024105200.GA20775@amd>
	<CACxGe6sa=ysJAjx5TQZH5sKoas1PkoUUR4zT=Z35+uF6rrk-vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sa=ysJAjx5TQZH5sKoas1PkoUUR4zT=Z35+uF6rrk-vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ira Snyder <iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini <rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, kyle.teske-acOepvfBmUk@public.gmane.org, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Balbi, Felipe" <balbi-l0cyMroinI0@public.gmane.org>, Mauro Carvalho Chehab <m.chehab@samsun>
List-Id: devicetree@vger.kernel.org

On Sat, 6 Dec 2014 13:00:17 +0000
Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On Fri, Oct 24, 2014 at 11:52 AM, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> wrote:
> > Hi!
> >
> >> * /sys/class/fpga_manager/<fpga>/firmware
> >>   Name of FPGA image file to load using firmware class.
> >>   $ echo image.rbf > /sys/class/fpga_manager/<fpga>/firmware
> >
> > I .. still don't think this is good idea. What about namespaces?
> > The path corresponds to path in which namespace?
> 
> I don't understand your concern here. This allows userspace to name
> the FPGA bitstream that the kernel will use during request_firmware(),
> and it will show up as the $FIRMWARE value in the uevent file, but it
> is still the responsibility of userspace to choose what to load, and
> it can freely ignore the setting of $FIRMWARE if it needs to.

I think the entire model here is basically pedicated on a bogus
assumption that an FPGA is a one shot device. It's not. It's a fast
reloadable reusable device. A lot of work being done with FPGAs in
operating systems already involves basically task switching and
scheduling FPGAs as a shared resource pool. Trying to nail something
together with request_firmware is several years behind the curve.

>From userspace it needs to be a open, load, use, close type model, not a
static or semi-static pile of mappings.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
