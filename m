From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] drivers/clocksource/moxart: Refactor enable/disable
Date: Wed, 20 Jul 2016 10:14:00 +0200
Message-ID: <20160720081400.GA2705@linaro.org>
References: <1462797169-14512-1-git-send-email-joel@jms.id.au>
 <1462797169-14512-3-git-send-email-joel@jms.id.au>
 <CACPK8XfJ2e1kr-WftidvqsoYew7LqPiNo0sw7opgh8UH=3q_3A@mail.gmail.com>
 <20160510130414.GE14952@linaro.org>
 <CACPK8XdK35p9rxr8et58omvQExjdri20yCq91LGocnPRYpGLQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACPK8XdK35p9rxr8et58omvQExjdri20yCq91LGocnPRYpGLQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 20, 2016 at 02:47:15PM +0930, Joel Stanley wrote:
> Hello Daniel,
> 
> On Tue, May 10, 2016 at 10:34 PM, Daniel Lezcano
> <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, May 10, 2016 at 08:36:50PM +0930, Joel Stanley wrote:
> >> Hi Daniel,
> >>
> >> Here's a commit message for this patch. If you'd prefer me to resend
> >> the entire series with this included then I can do that.
> >
> > No, it is ok (except if there are comments on the patches before I merge
> > them).
> 
> I couldn't find this in your tree. Any chance I could get it merged now?

Hi Joel,

actually I forgot to include your patchset which is no longer applying 
correctly and the conflicts are not trivials (easy but not trivial). It is a 
bit late to ask for a last minute pull. Sorry for that.

Please respin and resend your patchset, I will include it in my tree 
immediately so that won't happen again. The patch 1/4 is no longer needed.

If there is a really urgent need of this series, please let us know and 
Thomas can take a decision accordingly.

  -- Daniel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
