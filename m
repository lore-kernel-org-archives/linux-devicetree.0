From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v5 04/10] drm/stm: Add STM32 LTDC driver
Date: Tue, 11 Apr 2017 22:51:32 +0200
Message-ID: <20170411205132.sze2wfnnim4halqb@phenom.ffwll.local>
References: <1490694293-18358-1-git-send-email-yannick.fertre@st.com>
 <1490694293-18358-5-git-send-email-yannick.fertre@st.com>
 <87wpaqeks2.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87wpaqeks2.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-qxv4g6HH51o@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 11, 2017 at 01:45:01PM -0700, Eric Anholt wrote:
> Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org> writes:
> > +static void ltdc_crtc_disable(struct drm_crtc *crtc)
> > +{
> > +	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> > +	struct drm_pending_vblank_event *event = crtc->state->event;
> > +
> > +	DRM_DEBUG_DRIVER("\n");
> > +
> > +	if (!crtc->enabled) {
> > +		DRM_DEBUG_DRIVER("already disabled\n");
> > +		return;
> > +	}
> 
> I think this crtc->enabled is a given for the disable() being called.

Yup, one design principle of atomic (compared to the legacy modeset
helpers) is to correctly keep track of hw state and not call a hook when
not needed. If you don't trust them, conver them to WARN_ON, but otherwise
best to remove.

But like Eric said, totally fine in a follow-up patch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
