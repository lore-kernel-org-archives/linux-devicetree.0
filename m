From: Charles Keepax <ckeepax-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
Date: Thu, 26 Oct 2017 10:10:50 +0100
Message-ID: <20171026091050.vpeulil4g7cqbxj4@localhost.localdomain>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-4-andrew@aj.id.au>
 <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
 <1508490173.24322.53.camel@aj.id.au>
 <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
 <1508976339.13477.5.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1508976339.13477.5.camel-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Welling <mwelling-ei31t81uNw5BDgjK7y7TUQ@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Ryan Chen <ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 26, 2017 at 10:35:39AM +1030, Andrew Jeffery wrote:
> On Wed, 2017-10-25 at 09:14 +0100, Charles Keepax wrote:
> > On Fri, Oct 20, 2017 at 07:32:53PM +1030, Andrew Jeffery wrote:
> > > On Fri, 2017-10-20 at 09:27 +0200, Linus Walleij wrote:
> > > > I don't see it as helpful to give userspace control over whether the line
> > > > is persistent or not. It is more reasonable to assume persistance for
> > > > userspace use cases, don't you think? Whether the system goes to sleep
> > > > or the gpiochip resets should not make a door suddenly close or the
> > > > lights in the christmas tree go out, right? I think if the gpiochip supports
> > > > persistance of any kind, we should try to use it and not have userspace
> > > > provide flags for that.
> > > 
> > > Right. I guess the counter argument to your examples is if the gpio is
> > > controlling any active process that we don't want to continue if we've
> > > lost the capacity to monitor some other inputs (some kind of dead-man's 
> > > switch). But maybe the argument is that should be implemented in the
> > > kernel anyway?
> > > 
> > 
> > To me it certainly feels like decisions like this should live in
> > the kernel, your talking about things that could cause very weird
> > hardware behaviour if set wrong, so it makes sense to me to have
> > that responsibility guarded in the kernel.
> 
> I feel that taking this argument to its logical conclusion leads to
> never exporting any GPIOs to userspace and doing everything in the
> kernel. If userspace has exported the GPIO and is managing its state,
> then it can *already* cause very weird hardware behaviour if set wrong.
> The fact that userspace is controlling the GPIO state and not the
> kernel already says that the kernel doesn't know how to manage it, so
> why not expose the option for userspace to set the persistence, given
> that it should know what it's doing?

Admittedly yes, I guess it really comes down to use-cases.  There
are fairly strong use-cases to control GPIOs from user-space
that justify the risks. The use-cases for being able to set
non-persistent GPIOs from user-space seem less clear to me, but
if they exist I certainly don't have any objection.

Thanks,
Charles
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
