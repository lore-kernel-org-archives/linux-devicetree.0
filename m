From: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/3] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Wed, 3 Jun 2015 22:35:29 +0100
Message-ID: <20150603213529.GF12304@x1>
References: <1432928535-27522-1-git-send-email-eric@anholt.net>
 <1432928535-27522-2-git-send-email-eric@anholt.net>
 <1433148509.2361.35.camel@x220>
 <87vbf75n2l.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87vbf75n2l.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 01 Jun 2015, Eric Anholt wrote:

> Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> writes:
> 
> > On Fri, 2015-05-29 at 12:42 -0700, Eric Anholt wrote:
> >> This gives us a function for making mailbox property channel requests
> >> of the firmware, which is most notable in that it will let us get and
> >> set clock rates.
> 
> >> v6: Drop the try_module_get/module_put stuff, since all clients will
> >>     be referencing our symbols in order to call those functions,
> >>     anyway.  Fix the kerneldoc comments for the changes in v5.
> >
> > (This style of commit explanation is getting quite common. I must say I
> > rather dislike it. I think people should just update the entire commit
> > explanation when needed, and not simply paste any changes at the end of
> > it, thereby forcing the the reader to determine which older parts are
> > actually overruled by newer parts. Besides, many, or maybe even most, of
> > the changes are really not interesting enough to keep in the commit
> > explanation.)
> 
> It was a slip-up that I didn't move it below the '---'this time (I
> changed my workflow a bit, and missed the step).  I was assuming that
> Lee would just trim them on pulling in the changes.

I'm not the Firmware Maintainer, but I'm sure whoever is will be happy
to remove the changelog.  But Paul is correct, the commit should be
updated.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
