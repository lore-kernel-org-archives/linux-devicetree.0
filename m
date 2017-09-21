From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 9/9 v2] usb: usb251xb: Use GPIO descriptor consumer
 interface
Date: Thu, 21 Sep 2017 17:07:14 +0200
Message-ID: <20170921150714.GA7791@kroah.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-10-fancer.lancer@gmail.com>
 <20170921082338.GA30669@kroah.com>
 <20170921145129.GA25888@mobilestation>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170921145129.GA25888@mobilestation>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: richard.leitner@skidata.com, robh+dt@kernel.org, mark.rutland@arm.com, Sergey.Semin@t-platforms.ru, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 05:51:29PM +0300, Serge Semin wrote:
> On Thu, Sep 21, 2017 at 10:23:38AM +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Sat, Sep 16, 2017 at 01:42:20PM +0300, Serge Semin wrote:
> > > diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> > > index 71994b883..c2dd9742f 100644
> > > --- a/drivers/usb/misc/usb251xb.c
> > > +++ b/drivers/usb/misc/usb251xb.c
> > > @@ -3,6 +3,7 @@
> > >   * Configuration via SMBus.
> > >   *
> > >   * Copyright (c) 2017 SKIDATA AG
> > > + * Copyright (c) 2017 T-platforms
> > 
> > Again, no, please consult with your corporate lawyers why this isn't ok.
> > 
> > greg k-h
> 
> I still can't see why this isn't right. We submitted the patchset. It is not
> that big and still it isn't just two lines. As I've seen all over the kernel, It is
> a common practice to have multiple copyrights in kernel files. We are not claiming
> the copyright to the whole file, but to the contribution only. I got a consent to
> contribute when I was employed by the company. What's wrong with that? Shall I
> send the patchset from my corporate e-mail then?

Well, yes, I need some way to properly identify that this corporation
did do the changes.  I said that before, I don't know why you ignored
that.

And yes, multiple copyrights are just fine, but again, please talk to
your corporate lawyer about why these changes don't seem to warrant that
"mark".  If they do think that they do warrant that, great, I will be
glad to discuss that with them, off-list if needed.

For even more fun, try discussing with your lawyers about why copyright
marks like this don't even mean anything anymore, and haven't for 20+
years now (can't remember the actual date...)  But that's a different
topic, and one not really relevant here.

thanks,

greg k-h
