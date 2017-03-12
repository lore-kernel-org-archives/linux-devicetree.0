From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v4 3/7] drm/tinydrm: Add MIPI DBI support
Date: Sun, 12 Mar 2017 20:02:15 +0100
Message-ID: <CAKMK7uFtthS7jv+2COx661sam9eMtRnupZiK499m1OSi=4m2SA@mail.gmail.com>
References: <20170211184858.26421-1-noralf@tronnes.org> <20170211184858.26421-4-noralf@tronnes.org>
 <20170312184245.ad2nd2siq3y44amp@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170312184245.ad2nd2siq3y44amp-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 12, 2017 at 7:42 PM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
>
> The upshot of all this is two-fold:
>
> - You get rid of a tiny bit of book-keeping in each tinydrm driver (the
>   merge_clips above, plus the "is this the current fb on our hw" check).
>
> - There's lots more manual upload devices than just tinydrm, or
>   drm_simple_pipe, this would benefit any atomic driver.
>
> - Long-term we want to expose the dirty_clip as properties to userspace,
>   since the compositor already computes this anyway for each atomic update
>   (at least good compositors do this). Test-driving these new properties
>   within the kernel would help in catching issues.

- Correct locking: taking the ->dirty_lock only protects against
concurrent other ->dirty or simple_pipe->update operations, it doesn't
protect against concurrent modeset changes (i.e. someone could disable
the panel while you try to upload stuff). Moving the locking out of
panel drivers into this one single core helper removes the need for
any locking in drivers. And no need for locking == no way to screw it
up :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
