From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2 v6] of: add generic videomode description
Date: Thu, 04 Oct 2012 12:51:00 -0600
Message-ID: <506DDA94.1090702@wwwdotorg.org>
References: <1349373560-11128-1-git-send-email-s.trumtrar@pengutronix.de> <1349373560-11128-3-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1349373560-11128-3-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/04/2012 11:59 AM, Steffen Trumtrar wrote:
> Get videomode from devicetree in a format appropriate for the
> backend. drm_display_mode and fb_videomode are supported atm.
> Uses the display signal timings from of_display_timings

> +++ b/drivers/of/of_videomode.c

> +int videomode_from_timing(struct display_timings *disp, struct videomode *vm,

> +	st = display_timings_get(disp, index);
> +
> +	if (!st) {

It's a little odd to leave a blank line between those two lines.

Only half of the code in this file seems OF-related; the routines to
convert a timing to a videomode or drm display mode seem like they'd be
useful outside device tree, so I wonder if putting them into
of_videomode.c is the correct thing to do. Still, it's probably not a
big deal.
