From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 13/26] drm/fb_cma_helper: Remove implicit call to
 disable_unused_functions
Date: Mon, 25 Jan 2016 00:19:27 +0200
Message-ID: <1484612.l42nGNbAu5__19571.4956651956$1453702923$gmane$org@avalon>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <2014724.QmjXVju9UW@avalon> <20160115101730.GH19130@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160115101730.GH19130@phenom.ffwll.local>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, David Airlie <airlied@linux.ie>, Wynter Woods <wynter@nextthing.co>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alexander Kaplan <alex@nextthing.co>, Hans de Goede <hdegoede@redhat.com>, linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>, Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Friday 15 January 2016 11:17:30 Daniel Vetter wrote:
> On Fri, Jan 15, 2016 at 01:13:05AM +0200, Laurent Pinchart wrote:
> > On Thursday 14 January 2016 16:24:56 Maxime Ripard wrote:
> >> The drm_fbdev_cma_init function always calls the
> >> drm_helper_disable_unused_functions. Since it's part of the usual probe
> >> process, all the drivers using that helper will end up having their
> >> encoder and CRTC disable functions called at probe if their device has
> >> not been reported as enabled.
> >> 
> >> This could be fixed by reading out from the registers the current state
> >> of the device if it is enabled, but even that will not handle the case
> >> where the device is actually disabled.
> >> 
> >> Moreover, the drivers using the atomic modesetting expect that their
> >> enable and disable callback to be called when the device is already
> >> enabled or disabled (respectively).
> >> 
> >> We can however fix this issue by moving the call to
> >> drm_helper_disable_unused_functions out of drm_fbdev_cma_init and make
> >> the drivers needing it (all the drivers calling drm_fbdev_cma_init and
> >> not using the atomic modesetting) explicitly call it.
> > 
> > I'd rather add it to all drivers that call drm_fbdev_cma_init(). All the
> > atomic ones must have special code to cope with it that could be rendered
> > useless by the removal of the drm_helper_disable_unused_functions() call.
> > That code should be removed too, and it would be easier to check drivers
> > one by one and fixing them individually (outside of this patch series,
> > unless you insist ;-)) when removing the explicit
> > drm_helper_disable_unused_functions() call.
>
> I had the same thought, but figured there's really no good reason ever to
> do this. I suspect most of that disable_unused_function stuff we have all
> over is supreme cargo-cult anyway ;-)

I'm not sure you got my point. Yes, the drm_helper_disable_unused_functions() 
call should be removed from atomic drivers, but that will leave support code 
added for the sole reason of avoiding the crash in the drivers. That code will 
likely not be noticed and will stay there rotting. If we added 
drm_helper_disable_unused_functions() calls to all atomic drivers then driver 
authors will hopefully check carefully if there's any support code that can be 
removed when removing the function call. It would act as a kind of FIXME 
reminder.

> > Other than that the patch looks fine to me.
> 
> So went ahead and applied to drm-misc.

-- 
Regards,

Laurent Pinchart
