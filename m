From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/7] drm/vc4: Use drm_atomic_helper_wait_for_flip_done()
Date: Tue, 6 Jun 2017 22:59:15 +0200
Message-ID: <20170606225915.7864944c@bbrezillon>
References: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496392332-8722-5-git-send-email-boris.brezillon@free-electrons.com>
 <87lgp4rhj2.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87lgp4rhj2.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Hollingwort
List-Id: devicetree@vger.kernel.org

On Tue, 06 Jun 2017 13:24:33 -0700
Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:

> Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> writes:
> 
> > Replace the drm_atomic_helper_wait_for_vblanks() with a call to
> > drm_atomic_helper_wait_for_flip_done(). This allows better detection of
> > page flip done events which what we are really waiting for in
> > vc4_atomic_complete_commit().
> >
> > With this approach, we also addresse the 'missed single vblank event'
> > problem that can arise when the CRTC is configured in oneshot mode
> > (only a single frame is generated and the CRTC is immediately paused
> > after this frame). Note that this oneshot mode will be used for the
> > writeback connector feature.  
> 
> Should we just use drm_atomic_helper_commit_tail() and make this change
> in the core helper, instead?

Hm, not sure changing the default behavior is such a good idea. I don't
want to break other drivers.

> 
> Actually, I'm confused.  drm_atomic_helper_commit_cleanup_done() seems
> to be waiting for the flip_done on the crtc, already.  What's the
> difference?

Actually, drm_atomic_helper_wait_for_flip_done() is called just before
drm_atomic_helper_cleanup_planes() which in turn is called before
drm_atomic_helper_commit_cleanup_done(). My understanding was that it
was unsafe to call plane->cleanup_fb() on FBs that are still in use, and
the only thing guaranteeing that FBs are not used anymore is the
flip_done event.

Maybe I'm wrong, and FB refcounting is enough to make sure resources
are preserved until page flip is actually done.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
