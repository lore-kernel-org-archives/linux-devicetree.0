From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 3/5] drm: add SimpleDRM driver
Date: Fri, 2 Sep 2016 08:11:11 +0200
Message-ID: <CAKMK7uEm2_woMoyBUz77ivmyL939m7fEQH_CRbUxq5NeNrmzZw@mail.gmail.com>
References: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
 <1471897525-31118-4-git-send-email-noralf@tronnes.org> <CANq1E4Ro2W0J4XTTx+3TxRDHsc6z2AN7wFBc-njsBDYZVGV4OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANq1E4Ro2W0J4XTTx+3TxRDHsc6z2AN7wFBc-njsBDYZVGV4OA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Herrmann <dh.herrmann@gmail.com>
Cc: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, linux-kernel <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 2, 2016 at 1:48 AM, David Herrmann <dh.herrmann@gmail.com> wrote:
> So either the drm_simple_kms_helpers are buggy, or the SimpleDRM use
> of it. On DPMS updates, I get:
>
> Sep 02 01:00:39 david-t2 kernel:
> [drm:drm_atomic_helper_commit_cleanup_done [drm_kms_helper]] *ERROR*
> [CRTC:25:crtc-0] flip_done timed out
> Sep 02 01:00:39 david-t2 kernel: ------------[ cut here ]------------
> Sep 02 01:00:39 david-t2 kernel: WARNING: CPU: 3 PID: 352 at
> drivers/gpu/drm/drm_atomic_helper.c:1549
> drm_atomic_helper_commit_hw_done+0xab/0xb0 [drm_kms_helper]
>
> The atomic-commit originates in:
> drm_atomic_helper_connector_dpms()
>
> Any idea what is missing there? I haven't looked much into the
> atomic-helpers, yet.

The bugfix for that is in latest drm-misc (or well, should be at
least). And you need to make sure to call drm_crtc_send_vblank_event
(if there's an event) from your update hook. That /should/ work, but I
didn't test it myself. flip_done not happening is when the
driver/helpers fail to submit the event for some reason or another.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
