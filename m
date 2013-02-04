From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 4/4] iio: Add OF support
Date: Mon, 4 Feb 2013 08:37:04 -0800
Message-ID: <20130204163704.GA18187@roeck-us.net>
References: <1359853180-5664-1-git-send-email-linux@roeck-us.net>
 <1359853180-5664-5-git-send-email-linux@roeck-us.net>
 <510E7195.4070803@metafoo.de>
 <20130203162213.GA21576@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130203162213.GA21576-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 03, 2013 at 08:22:13AM -0800, Guenter Roeck wrote:
[ ... ]

> > > +
> > > +	/* NULL terminated array to save passing size */
> > > +	chans = kzalloc(sizeof(*chans)*(nummaps + 1), GFP_KERNEL);
> > 
> > I think using kcalloc makes sense here.
> > 
> that would leave chan->data uninitialized, and I would have to initialize it
> explicitly. also, if additional fields are ever added, we would risk having
> uninitialized fields. Using kzalloc avoids a potential future error case, so I
> would prefer to keep it.
> 
Please ignore this one.

Looks like my brain was too flu-foggy to realize that kcalloc does clear the
memory.

Guenter
