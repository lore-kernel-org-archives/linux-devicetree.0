From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 05/15] drm/sun4i: Fix error path handling
Date: Tue, 5 Dec 2017 23:42:35 +0800
Message-ID: <CAGb2v66kMOFyXa1DqBgKaX+74e6jqt2QVjQcvzEJ_r_Ccoj6vw@mail.gmail.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
 <1f2443c41082fc6e086570da38d20744c52fe636.1512486553.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1f2443c41082fc6e086570da38d20744c52fe636.1512486553.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 11:10 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> The commit 4c7f16d14a33 ("drm/sun4i: Fix TCON clock and regmap
> initialization sequence") moved a bunch of logic around, but forgot to
> update the gotos after the introduction of the err_free_dotclock label.
>
> It means that if we fail later that the one introduced in that commit,
> we'll just to the old label which isn't free the clock we created. This
> will result in a breakage as soon as someone tries to do something with
> that clock, since its resources will have been long reclaimed.
>
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Fixes: 4c7f16d14a33 ("drm/sun4i: Fix TCON clock and regmap initialization sequence")
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks.

I think this was reported, or I noticed it after the patch was merged,
but then I got busy with other stuff.

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
