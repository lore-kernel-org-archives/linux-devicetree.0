From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: add 'const' for of_property_*_string*() parameter
 '*np'
Date: Thu, 3 Mar 2016 16:53:59 -0600
Message-ID: <20160303225359.GC17541@rob-hp-laptop>
References: <1456954551-31742-1-git-send-email-drivshin.allworx@gmail.com>
 <CAL_JsqJgOa7wzYCrQFwko-HXQVTkWf+=rwGkimS1n6qucH=jbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJgOa7wzYCrQFwko-HXQVTkWf+=rwGkimS1n6qucH=jbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "David Rivshin (Allworx)" <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 03, 2016 at 07:52:51AM -0600, Rob Herring wrote:
> On Wed, Mar 2, 2016 at 3:35 PM, David Rivshin (Allworx)
> <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>
> >
> > The of_property_{read,count,match}_string* family of functions never
> > modify the struct device_node pointer that is passed in, so there is no
> > reason for it to be non-const. Equivalent functions for all other types
> > already take a 'const struct device_node *np'.
> >
> > Signed-off-by: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>
> > ---
> >
> > MAINTAINTERS says that the appropriate tree is
> >     git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
> 
> Yes, we probably need to update that.
> 
> > but it looks like that hasn't been updated in a while. So this patch
> > is based off the "for-next" branch of
> >     git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
> > instead. Let me know if you need me to respin from another tree/branch.
> 
> You should base off of Linus' tree unless you have some dependency. I
> doubt it matters in this case, so no need to resend.

And now applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
