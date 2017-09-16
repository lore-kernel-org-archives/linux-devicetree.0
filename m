From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 5/5] usb: usb251xb: Add copyrights
Date: Sat, 16 Sep 2017 03:11:30 +0300
Message-ID: <20170916001130.GC21291@mobilestation>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170915233113.17855-6-fancer.lancer@gmail.com>
 <20170915234028.GA7681@kroah.com>
 <20170915234517.GA21291@mobilestation>
 <20170915235313.GA14637@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170915235313.GA14637@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.leitner@skidata.com, robh+dt@kernel.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 04:53:13PM -0700, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Sat, Sep 16, 2017 at 02:45:17AM +0300, Serge Semin wrote:
> > On Fri, Sep 15, 2017 at 04:40:28PM -0700, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > On Sat, Sep 16, 2017 at 02:31:13AM +0300, Serge Semin wrote:
> > > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > > ---
> > > >  drivers/usb/misc/usb251xb.c | 1 +
> > > >  1 file changed, 1 insertions(+), 0 deletion(-)
> > > 
> > > I can't take patches without any changelog text, sorry.
> > > 
> > 
> > I'll merge it into the previous patch then. There is nothing to changeloging here. 
> > 
> > > > 
> > > > diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> > > > index 1d47acd09..43afa04ad 100644
> > > > --- a/drivers/usb/misc/usb251xb.c
> > > > +++ b/drivers/usb/misc/usb251xb.c
> > > > @@ -3,6 +3,7 @@
> > > >   * Configuration via SMBus.
> > > >   *
> > > >   * Copyright (c) 2017 SKIDATA AG
> > > > + * Copyright (c) 2017 T-platforms
> > > 
> > > I don't see the connection between a random company, and a random
> > > gmail.com email address.  Please explain :)
> > 
> > Why do you see gmail.com only? I cc-ed this patchset to my work email:
> > Sergey.Semin@t-platforms.ru
> > Do I really need to send it from my work e-mail? I have met such rule before.
> 
> The authorship of these patches are coming from a gmail.com address, how
> do I know what that relates to some random email you cc: on the patch :)
> 
> thanks,
> 
> greg k-h

Does it really matter? I could create any domain and add some random company
as copyright. How would you know the copyrighted company is real then? The
only way would be just google it. That's it. But still the site can be faked
if it is really necessary.
I thought these things are a matter of trust. I submitted a patchset from my
personal e-mail, but created it while working for the company. It's highly
possible, that my personal email is going to be mine for much longer time, then
I'll be working in the company. In this case, the better way to declare it as
primary email, instead of the company one, so to have a longer support. Isn't it?
Why would I need to fake a copyrighted company anyway?

-Sergey
