From: atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH v8 1/4] doc: add bindings document for altera fpga
 manager
Date: Fri, 9 Jan 2015 12:58:31 -0600
Message-ID: <alpine.DEB.2.02.1501091256150.30067@linuxheads99>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com> <1420575219-27061-2-git-send-email-atull@opensource.altera.com> <CAL_JsqKRe2YquSmi01wa5b=Ctns+1ek-PdSHDLuxyCfKasTw5g@mail.gmail.com> <alpine.DEB.2.02.1501061627150.18120@linuxheads99>
 <CAL_Jsq+pn5MW6veUivEL49FLSQxZOWRq0gU9Q6iD5jzurKK3rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+pn5MW6veUivEL49FLSQxZOWRq0gU9Q6iD5jzurKK3rQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philip Balister <philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org>, Alessandro Rubini <rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kyle Teske <kyle.teske-acOepvfBmUk@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <bal>
List-Id: devicetree@vger.kernel.org

On Fri, 9 Jan 2015, Rob Herring wrote:

> On Tue, Jan 6, 2015 at 4:34 PM, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> > On Tue, 6 Jan 2015, Rob Herring wrote:
> >
> >> On Tue, Jan 6, 2015 at 2:13 PM,  <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
> >> > From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >> >
> >> > New bindings document for Altera fpga manager.
> >> >
> >> > Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> Like I said, this binding doesn't look like it will change other than
> >> perhaps additional optional properties, so it can go into
> >> Documentation. Perhaps .../bindings/fpga/. I'm happy to merge this
> >> thru DT tree if you want.
> >>
> >> Rob
> >
> > Thanks, that would be great.  Yes ../bindings/fpga sounds good.
> >
> > Do you want me to send you a patch with the updated path?
> 
> Yes, please.
> 
> Rob
> 

OK I'll split that patch out and just send it separately to you and the DT 
list.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
