From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH 0/8] tilcdc-panel: Backlight and GPIO devicetree support
Date: Tue, 22 Jul 2014 11:51:10 -0300
Message-ID: <20140722145110.GA3302@arch.cereza>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1405088334-11215-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, Guido =?iso-8859-1?Q?Mart=EDnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 Jul 11:18 AM, Ezequiel Garcia wrote:
> Hello all,
> 
> This patchset adds the required changes to support an optional backlight
> and GPIO for the tilcdc panel driver.
> 
> There was some code to support a backlight, but it was somewhat broken
> and undocumented. I've followed the nice implementation in panel-simple
> and added a similar one here.
> 
> The enable GPIO is required to turn on and off devices with such capability.
> Also here, I've followed panel-simple which looks correct.
> 
> In addition to this there are very minor cosmetic cleanups and a larger
> error path fix in tilcdc's DRM driver .load error path.
> 
> This patchset applies on top of drm-next branch which contains the latest
> tilcdc pushed by Guido.
> 
> If at all possible, I'd like to get this merged for v3.17. If a pull request
> is needed, don't hesitate to ask and I'll prepare one.
> 
> Comments and tests welcome!
> 

Dave,

If there are no comments and we are still in time, I'd like to merge this for
v3.17. Let me know if you need a pull.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
