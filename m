From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 4/9] drm: Add DRM support for tiny LCD displays
Date: Tue, 24 Jan 2017 19:48:14 +0200
Message-ID: <8737g8e4dd.fsf@intel.com>
References: <20170122181117.8210-1-noralf@tronnes.org> <20170122181117.8210-5-noralf@tronnes.org> <20170123092805.grj5ehghbbdqn54k@phenom.ffwll.local> <e272852f-0bdb-4d12-6bbe-5dd22e8551ce@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e272852f-0bdb-4d12-6bbe-5dd22e8551ce@tronnes.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch
Cc: thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Tue, 24 Jan 2017, Noralf Trønnes <noralf@tronnes.org> wrote:
> Den 23.01.2017 10.28, skrev Daniel Vetter:
>> On Sun, Jan 22, 2017 at 07:11:12PM +0100, Noralf Trønnes wrote:
>>> tinydrm provides helpers for very simple displays that can use
>>> CMA backed framebuffers and need flushing on changes.
>>>
>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> Looks all pretty. A bunch of ideas below, but all optional. For merging I
>> think simplest to first get the core patches in through drm-misc, and then
>> you can submit a pull request to Dave for tinydrm+backends (just needs an
>> ack for the dt parts from dt maintainers), including MAINTAINERS entry.
>> Ack from my side.
>
> So when the tinydrm core patches are in:
> - tinydrm patches are posted to dri-devel.
> - DT patches need ack.
> - If there's no comments or resolved, I send a pull request to Dave.
>
> How often and when do I send pull requests?
> (I have seen *-next, *-fixes, * for 4.xx)

For DRM the cutoff for new features in the next merge window is around
-rc5 of the previous development kernels, i.e. the deadline for v4.11
merge window is around v4.10-rc5, pretty much now.

Pick up and send fixes pulls for current -rc kernels as needed. My flow
for i915 is to try to pick up stuff early in the week, let the stuff
simmer and go through our CI, and send the pull request to Dave by
Thursday.

> Do drivers _always_ need a MAINTANERS entry, or is it preferred,
> nice to have, not so important, ...

If you want the patches to flow through your tree, you need
it. Otherwise it'll fall under drm and drm-misc.


BR,
Jani.


>
>
>>> +/**
>>> + * tinydrm_display_pipe_update - Display pipe update helper
>>> + * @pipe: Simple display pipe
>>> + * @old_state: Old plane state
>>> + *
>>> + * This function does a full framebuffer flush if the plane framebuffer
>>> + * has changed. It also handles vblank events. Drivers can use this as their
>>> + * &drm_simple_display_pipe_funcs->update callback.
>>> + */
>>> +void tinydrm_display_pipe_update(struct drm_simple_display_pipe *pipe,
>>> +				 struct drm_plane_state *old_state)
>>> +{
>>> +	struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
>>> +	struct drm_framebuffer *fb = pipe->plane.state->fb;
>>> +	struct drm_crtc *crtc = &tdev->pipe.crtc;
>>> +
>>> +	if (!fb)
>>> +		DRM_DEBUG_KMS("fb unset\n");
>>> +	else if (!old_state->fb)
>>> +		DRM_DEBUG_KMS("fb set\n");
>>> +	else if (fb != old_state->fb)
>>> +		DRM_DEBUG_KMS("fb changed\n");
>>> +	else
>>> +		DRM_DEBUG_KMS("No fb change\n");
>>> +
>>> +	if (fb && (fb != old_state->fb)) {
>>> +		pipe->plane.fb = fb;
>>> +		if (fb->funcs->dirty)
>>> +			fb->funcs->dirty(fb, NULL, 0, 0, NULL, 0);
>> I like the idea, but my cunning long-term plan is that we'd extend the
>> atomic support to support a dirty rectangle. Together with the
>> non-blocking stuff we could then implement fb->funcs->dirty in terms of
>> atomic. But here you implement atomic in terms of ->dirty, and we'd end up
>> with a loop.
>>
>> Personally I'd just drop this helper here and move this part into the
>> backend modules ...
>>
>>> +	}
>>> +
>>> +	if (crtc->state->event) {
>>> +		DRM_DEBUG_KMS("crtc event\n");
>>> +		spin_lock_irq(&crtc->dev->event_lock);
>>> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>>> +		spin_unlock_irq(&crtc->dev->event_lock);
>>> +		crtc->state->event = NULL;
>> ... because this here is kinda a hack, since it's not synchronized with
>> the screen update. Otoh these tiny panels are kinda special.
>
> Yeah, you're right it's only synchronized if the framebuffer changes.
> So this won't catch events that's not page flip events.
> afaict DRM_EVENT_VBLANK is the only other event. When is that used?
>
> How about if I check for events as well so the fb is always flushed
> if someone wants know?
>
> void tinydrm_display_pipe_update(struct drm_simple_display_pipe *pipe,
>                   struct drm_plane_state *old_state)
> {
>      struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
>      struct drm_framebuffer *fb = pipe->plane.state->fb;
>      struct drm_crtc *crtc = &tdev->pipe.crtc;
>
>      if (fb && (fb != old_state->fb || crtc->state->event)) {
>          pipe->plane.fb = fb;
>          if (fb->funcs->dirty)
>              fb->funcs->dirty(fb, NULL, 0, 0, NULL, 0);
>      }
>
>      if (crtc->state->event) {
>          spin_lock_irq(&crtc->dev->event_lock);
>          drm_crtc_send_vblank_event(crtc, crtc->state->event);
>          spin_unlock_irq(&crtc->dev->event_lock);
>          crtc->state->event = NULL;
>      }
> }
>
>
> Or maybe I should send the event in the dirty() function instead?
>
> void tinydrm_display_pipe_update(struct drm_simple_display_pipe *pipe,
>                   struct drm_plane_state *old_state)
> {
>      struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
>      struct drm_framebuffer *fb = pipe->plane.state->fb;
>      struct drm_crtc *crtc = &tdev->pipe.crtc;
>
>      if (fb && (fb != old_state->fb || crtc->state->event)) {
>          pipe->plane.fb = fb;
>          if (fb->funcs->dirty)
>              fb->funcs->dirty(fb, NULL, 0, 0, NULL, 0);
>      }
> }
>
> void tinydrm_send_pending_event(struct tinydrm_device *tdev)
> {
>      struct drm_crtc *crtc = &tdev->pipe.crtc;
>
>      if (!crtc->state->event)
>          return;
>
>      spin_lock_irq(&crtc->dev->event_lock);
>      drm_crtc_send_vblank_event(crtc, crtc->state->event);
>      spin_unlock_irq(&crtc->dev->event_lock);
>      crtc->state->event = NULL;
> }
>
> static int mipi_dbi_fb_dirty(struct drm_framebuffer *fb,
>                   struct drm_file *file_priv,
>                   unsigned int flags, unsigned int color,
>                   struct drm_clip_rect *clips,
>                   unsigned int num_clips)
> {
>      <snip>
>      mutex_lock(&tdev->dirty_lock);
>
>      <flush>
>
>      tinydrm_send_pending_event(tdev);
>
>      mutex_unlock(&tdev->dirty_lock);
>
>      return ret;
> }
>
>
> Noralf.
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
