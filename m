From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: correct of_console_check()'s return value
Date: Thu, 25 Sep 2014 16:53:22 -0700
Message-ID: <20140925235322.GW1193@ld-irv-0074>
References: <1409767603-3290-1-git-send-email-computersforpeace@gmail.com>
 <20140908104238.C7B3DC40AB2@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140908104238.C7B3DC40AB2-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Mon, Sep 08, 2014 at 11:42:38AM +0100, Grant Likely wrote:
> On Wed,  3 Sep 2014 11:06:43 -0700, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > The comments above of_console_check() say that it will return TRUE if it
> > registers a preferred console, but add_preferred_console() uses a
> > 0-equals-success convention, so ths leaves of_console_check() with an
> > inconsistent policy for its return values.
> > 
> > Fortunately, nobody was actually checking the return value of
> > of_console_check(), so this isn't significant at the moment.
> > 
> > But let's match the comments, so we're doing what we say.
> > 
> > Fixes: 3482f2c52b77 ('of: Create of_console_check() for selecting a console specified in /chosen')
> > Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Good catch. Applied, thanks.

Applied to what? I don't see it in linux-next.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
