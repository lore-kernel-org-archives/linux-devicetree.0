From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v2 2/3] fpga manager: framework core
Date: Thu, 18 Dec 2014 14:50:09 -0600
Message-ID: <alpine.DEB.2.02.1412181447160.25208@linuxheads99>
References: <1414007405-32186-1-git-send-email-atull@opensource.altera.com> <1414007405-32186-3-git-send-email-atull@opensource.altera.com> <20141024105200.GA20775@amd> <CACxGe6sa=ysJAjx5TQZH5sKoas1PkoUUR4zT=Z35+uF6rrk-vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sa=ysJAjx5TQZH5sKoas1PkoUUR4zT=Z35+uF6rrk-vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ira Snyder <iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini <rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, kyle.teske-acOepvfBmUk@public.gmane.org, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Balbi, Felipe" <balbi-l0cyMroinI0@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, David
List-Id: devicetree@vger.kernel.org

On Sat, 6 Dec 2014, Grant Likely wrote:

> >> +int fpga_mgr_write(struct fpga_manager *mgr, const char *buf, size_t count)
> >> +{
> >> +     int ret;
> >> +
> >> +     if (test_and_set_bit_lock(FPGA_MGR_BUSY, &mgr->flags))
> >> +             return -EBUSY;
> >> +
> >> +     dev_info(mgr->dev, "writing buffer to %s\n", mgr->name);
> >> +
> >> +     ret = __fpga_mgr_write(mgr, buf, count);
> >> +     clear_bit_unlock(FPGA_MGR_BUSY, &mgr->flags);
> >> +
> >> +     return ret;
> >> +}
> >> +EXPORT_SYMBOL_GPL(fpga_mgr_write);
> >
> > Is the EBUSY -- userspace please try again, but you don't know when to
> > try again -- right interface? I mean, normally kernel would wait, so
> > that userland does not have to poll?
> 
> Custom locking schemes are just wrong. A mutex is the right thing to
> do here and then an -EBUSY isn't required.
> 

I've changed it to a mutex in the next version.

> >
> >> +static ssize_t fpga_mgr_firmware_store(struct device *dev,
> >> +                                    struct device_attribute *attr,
> >> +                                    const char *buf, size_t count)
> >> +{
> >> +     struct fpga_manager *mgr = dev_get_drvdata(dev);
> >> +     unsigned int len;
> >> +     char image_name[NAME_MAX];
> 
> Hard coding a string length is a warning sign. That is the sort of
> thing that can memdup() or strdup() can handle.
> 

OK, I'll fix it using kstrdup() in v6.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
